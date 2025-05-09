{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  programs.alacritty = {
    enable = true;

    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      window = {
        opacity = 0.9;
      };
      font = {
        normal.family = "Cozette";
        bold.family = "Cozette";
        italic.family = "Cozette";
        size = 16;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      terminal.shell = {
        program = "fish";
      };
    };
  };
}
