# credits to bloxx12, who in turn credits raf
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
in {
  imports = [
    ./nixpkgs.nix
  ];

  nix = {
    # swap when they finally setup binary caching
    package = pkgs.lix;
    # hard defaults channels to disable unless hyper enabled by a very low override value
    channel.enable = mkForce false;
    allowed-users = ["root" "@wheel" "nix-builder"];
    trusted-users = ["root" "@wheel" "nix-builder"];
    # no way you can turn off warn on dirty git tree
    warn-dirty = false;

    extra-experimental-features = [
      "flakes"
      "nix-command"
    ];
    # the number of parallel http connections used during the fetch process
    # default limit is 25, if set to 0, there is no limit
    http-connections = 50;
  };
}
