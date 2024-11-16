{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./fish.nix
    {inherit pkgs;}
    ./foot.nix
    ./hyprland.nix
    ./kitty.nix
    ./nix-index.nix
    ./nvf.nix
    ./spicetify.nix
    {inherit pkgs inputs;}
    ./starship.nix
    ./zoxide.nix
  ];
}
