{
  lib,
  pkgs,
  ...
}: {
  services.fstrim.enable = lib.mkDefault true;
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["IosevkaTerm"];})
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    cm_unicode
  ];
}
