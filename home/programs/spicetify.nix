# spicetify.nix
{
  inputs,
  pkgs,
  ...
}: let
  # latest unstable forces us to stdenv syntax?
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  programs.spicetify = {
    enable = true;
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
