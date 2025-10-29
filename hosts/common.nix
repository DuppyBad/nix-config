{
  lib,
  pkgs,
  ...
}: {
  services.fstrim.enable = lib.mkDefault true;
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
  fonts.fontconfig = {
    allowBitmaps = true;
    enable = true;
    antialias = true;
    hinting.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    material-design-icons
    cozette
    cm_unicode
  ];
  # For patching binaries for dynamic analysis
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      elfutils
    ];
  };
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
}
