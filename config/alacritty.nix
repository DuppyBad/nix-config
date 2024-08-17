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
      size = 14;
    };
    scrolling.multiplier = 5;
    selection.save_to_clipboard = true;
    shell = {
      program = "fish";
    };
  };
}
