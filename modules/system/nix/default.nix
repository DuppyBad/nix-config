{
  pkgs,
  lib,
  ...
}: {
  imports = [./nixpkgs.nix];
  nix = {
    # Learnt about most of these options whilst reading bloxx12/nichts
    package = pkgs.lix;
    channel.enable = lib.mkForce false;
    settings = {
      allowed-users = ["root" "@wheel" "nix-builder"];
      trusted-users = ["root" "@wheel" "nix-builder"];
      warn-dirty = false;
      extra-experimental-features = ["flakes" "nix-command"];
      http-connections = 50;
      accept-flake-config = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = false;
      dates = "19:00";
      options = "--delete-older-than 1w";
      persistent = false;
    };
    optimise = {
      automatic = true;
      dates = "20:00";
    };
  };
}
