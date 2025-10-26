{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.niri = {
    settings = {
      outputs = {
        "DP-3" = {
          mode = {
            refresh = 144.0;
            height = 2560;
            width = 1440;
          };
          position = {
            x = 0;
            y = 0;
          };
          scale = 1;
          focus-at-startup = true;
        };
      };
      input = {
        focus-follows-mouse.enable = true;
        keyboard = {
          xkb = {
            layout = "gb";
          };
        };
      };
      binds = with config.lib.niri.actions; {
        # General Controls that I use in all WM
        "Mod+Return".action = spawn "${lib.getExe pkgs.foot}";
        "Mod+D".action = spawn "${lib.getExe pkgs.fuzzel}";
        "Mod+Q".action = close-window;
        "Mod+F".action = fullscreen-window;
        "Mod+V".action = toggle-window-floating;
        "Mod+L".action = spawn "${lib.getExe pkgs.hyprlock}";

        # Movement controls
        "Mod+Left".action = focus-window-up;
        "Mod+Right".action = focus-window-down;
      };
      prefer-no-csd = true;
      hotkey-overlay = {
        skip-at-startup = true;
      };
    };
  };
}
