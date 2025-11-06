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

  # look in /nix/var/nix/profiles/system/sw/share/X11/fonts
  # fc-query * | grep '^\s\+family:' | cut -d'"' -f2 | grep

  fonts.packages = with pkgs; [
    # this way, any font can fall back to the symbols, without us having to patch each font
    # this was actually untrue?
    nerd-fonts.symbols-only
    # saves 1gb of disk if gone
    font-awesome # for typst compilation
    roboto
    source-sans
    source-sans-pro

    nerd-fonts.iosevka-term
    iosevka
    noto-fonts-color-emoji
    noto-fonts
    noto-fonts-cjk-sans
    material-design-icons
    cozette
    #cm_unicode
  ];
  # For patching binaries for dynamic analysis
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      elfutils
    ];
  };

  security.soteria.enable = true;
  # polkit client
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
}
