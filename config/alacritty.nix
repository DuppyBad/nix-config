{
  enable = true;
  # custom settings
  settings = {
    env.TERM = "xterm-256color";
    window = {
      opacity = 0.9;
    };
    font = {
      normal.family = "JetBrains Mono Nerd Font";
      bold.family = "JetBrains Mono Nerd Font";
      italic.family = "JetBrains Mono Nerd Font";
      size = 13.5;
    };
    colors = {
      primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        dim_foreground = "#7f849c";
        bright_foreground = "#cdd6f4";
      };
      cursor = {
        text = "#1e1e2e";
        cursor = "#f5e0dc";
      };
      vi_mode_cursor = {
        text = "#1e1e2e";
        cursor = "#b4befe";
      };
      selection = {
        text = "#1e1e2e";
        background = "#f5e0dc";
      };
      normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };
      bright = {
        black = "#585b70";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };
      dim = {
        black = "#585b70";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };
    };
    scrolling.multiplier = 5;
    selection.save_to_clipboard = true;
    shell = {
      program = "fish";
    };
  };
}
