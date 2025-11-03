# spicetify.nix
{
  inputs,
  pkgs,
  ...
}: let
  # stdenv.system superceded system
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  programs.spicetify = {
    enable = true;
    wayland = false;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      keyboardShortcut
      fullAlbumDate
      powerBar
      volumePercentage
      beautifulLyrics
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "RosePine";
  };
}
