# Shared config for all machines

{ config, pkgs, ...}:

{
  user.users.kyrios = {
    isNormalUser = true;
    home = "/home/kyrios";
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["flakes" "nix-command"];
  };
  
  time.timeZone = "Europe/London";
  i18n.defaultLocate = "en_GB.UTF-8";
  console.keyMap = "uk";

}
