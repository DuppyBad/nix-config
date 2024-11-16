{
  programs.alacritty = {
    enable = true;

    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      window = {
        opacity = 0.9;
      };
      font = {
        normal.family = "Iosevka Nerd Font";
        bold.family = "Iosevka Nerd Font";
        italic.family = "Iosevka Nerd Font";
        size = 14;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      terminal.shell = {
        program = "fish";
      };
    };
  };
}
