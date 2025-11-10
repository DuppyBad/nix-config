{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 15;
    };
    settings = {
      # we specify colour to be 1 bit out so that the opacity masking doesn't apply
      # without it, we get transparent hx, vim, etc., since our colour scheme is perfect
      background = "#1E1E2D";
      background_opacity = "0.9";
      # blur would be cool, maybe on the WM end?
      confirm_os_window_close = "0";
      hide_window_decorations = "yes";
      enable_audio_bell = "no";
    };
    shellIntegration = {
      enableFishIntegration = true;
    };
  };
}
