{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka";
      size = 14;
    };
    settings = {
      background_opacity = "1";
      confirm_os_window_close = "0";
      hide_window_decorations = "yes";
    };
    shellIntegration = {
      enableFishIntegration = true;
    };
  };
}
