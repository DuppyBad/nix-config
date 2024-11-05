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
  
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/London";
  i18n.defaultLocate = "en_GB.UTF-8";
  console.keyMap = "uk";
  
  fonts.packages = with pkgs; [
  (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Mononoki" "Iosevka"];})
  noto-fonts
  noto-fonts-cjk-sans
  cm_unicode
  ];

}
