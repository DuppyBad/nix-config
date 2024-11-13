# spicetify.nix
{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  enable = true;
  enabledExtensions = with spicePkgs.extensions; [
    fullAppDisplay
    keyboardShortcut
    fullAlbumDate
    powerBar
    volumePercentage
    beautifulLyrics
  ];
  theme = spicePkgs.themes.comfy;
  colorScheme = "catppuccin-mocha";
}
