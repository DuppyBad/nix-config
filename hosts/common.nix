{
  lib,
  pkgs,
  ...
}: {
  services.fstrim.enable = lib.mkDefault true;
  # should definitely be moved to Niri
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
  fonts.fontconfig = {
    allowBitmaps = true;
    enable = true;
    antialias = true;
    hinting.enable = true;
    defaultFonts = {
      monospace = ["Iosevka" "Symbols Nerd Font"];
    };
  };

  # look in /nix/var/nix/profiles/system/sw/share/X11/fonts
  # fc-query * | grep '^\s\+family:' | cut -d'"' -f2 | grep

  fonts.packages = with pkgs; [
    # this way, any font can fall back to the symbols, without us having to patch each font
    nerd-fonts.symbols-only
    # typst compilation fonts
    font-awesome
    roboto
    source-sans
    source-sans-pro
    # typst fonts end
    # saves 1gb of disk if gone
    # nerd-fonts.iosevka-term
    geist-font
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
