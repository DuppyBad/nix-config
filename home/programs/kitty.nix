{
  programs.kitty = {
    enable = true;
    font = {
      name = "IosevkaTerm Nerd Font";
      size = 12;
    };
    settings = {
      background_opacity = "0.8";
      confirm_os_window_close = "0";
      hide_window_decorations = "yes";
    };
    shellIntegration = {
      enableFishIntegration = true;
    };
  };
}
