# default.nix or module.nix
{
  lib,
  pkgs,
  config,
  options,
}: let
  # Get all files in the current directory
  files = builtins.readDir ./.;

  nixFiles =
    lib.filterAttrs (
      name: type:
        type
        == "regular"
        && lib.hasSuffix ".nix" name
        && name != "default.nix"
        && name != "module.nix"
    )
    files;

  # Simply pass the same arguments we received
  callModule = path:
    import path {
      inherit lib pkgs config options;
    };

  # Import all the filtered files
  imports =
    lib.mapAttrsToList (
      name: _:
        callModule ./${name}
    )
    nixFiles;
in {
  inherit imports;

  config = {
    # Your module-specific configuration
  };
}

