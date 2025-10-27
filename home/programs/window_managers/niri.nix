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
            # can do 240 but no need
            refresh = 144.0;
            height = 2560;
            width = 1440;
          };
          position = {
            x = 0;
            y = 0;
          };
          scale = 1;
          # avoid weird issues where hdmi-1 is first in boot order
          focus-at-startup = true;
        };
        "eDP-1" = {
          scale = 1;
        };
      };
      input = {
        focus-follows-mouse.enable = true;
        touchpad = {
          natural-scroll = false;
        };
        keyboard = {
          xkb = {
            layout = "gb";
          };
        };
      };
      animations = {
        enable = true;
      };
      binds = with config.lib.niri.actions; {
        # General Controls that I use in all WM
        "Mod+Return".action = spawn "${lib.getExe pkgs.foot}";
        "Mod+D".action = spawn "${lib.getExe pkgs.fuzzel}";
        "Mod+Q".action = close-window;
        "Mod+F".action = fullscreen-window;
        "Mod+Shift+F".action = maximize-column;
        "Mod+V".action = toggle-window-floating;
        "Mod+L".action = spawn "${lib.getExe pkgs.hyprlock}";

        # Movement controls
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Tab".action = focus-window-or-workspace-down;
        "Mod+Shift+Tab".action = focus-window-or-workspace-up;
        # Audio control
        "XF86AudioMute".action = spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
        "XF86AudioRaiseVolume".action = spawn ["wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "5%+"];
        "XF86AudioLowerVolume".action = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];

        #Brightness Control
        "XF86MonBrightnessUp".action = spawn ["brightnessctl" "set" "+5%"];
        "XF86MonBrightnessDown".action = spawn ["brightnessctl" "set" "5%-"];
      };
      prefer-no-csd = true;
      hotkey-overlay = {
        skip-at-startup = true;
      };
    };
  };
}
