{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];
  niri-flake.cache.enable = true;
}
