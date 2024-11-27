{
  lib,
  pkgs,
  ...
}: {
  services.fstrim.enable = lib.mkDefault true;

  fonts.fontconfig = {
    allowBitmaps = true;
    enable = true;
    antialias = true;
    hinting.enable = true;
  };
  
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["IosevkaTerm"];})
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    material-design-icons
    cozette
    cm_unicode
  ];
}
