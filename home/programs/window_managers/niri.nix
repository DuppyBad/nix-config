{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.niri = {
    settings = {
      xwayland-satellite.enable = true;
      outputs = {
        "DP-3" = {
          mode = {
            # can do 240 but no need
            refresh = 240.0;
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
        "HDMI-1" = {
          scale = 1;
        };
      };
      layout = {
        # Nix evaluates these to the floating point values
        # You can define them as 1. / 2. instead, but it's not as pretty or idiomatic
        default-column-width = {
          proportion = 1.0 / 2.0;
        };
        preset-column-widths = [
          {proportion = 1.0 / 4.0;}
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
        ];

        # cba6f7 is mocha mauve catppuccin
        # 6c7086 is mocha overlay0
        border = {
          enable = true;
          width = 0.5;
          active.color = "#cba6f7";
          inactive.color = "#6c7086";
        };
        focus-ring = {
          enable = true;
          active.color = "#cba6f7";
          inactive.color = "#6c7086";
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
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+F".action = maximize-column;
        "Mod+C".action = center-column;
        "Mod+R".action = switch-preset-column-width;
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        "Mod+V".action = toggle-window-floating;
        "Mod+L".action = spawn "${lib.getExe pkgs.hyprlock}";

        # Movement controls
        "Mod+1".action = focus-workspace 1;
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Tab".action = focus-workspace-previous;

        # Audio control
        "XF86AudioMute".action = spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
        "XF86AudioRaiseVolume".action = spawn ["wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "5%+"];
        "XF86AudioLowerVolume".action = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
        "Shift+XF86AudioRaiseVolume".action = spawn ["wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "1%+"];
        "Shift+XF86AudioLowerVolume".action = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "1%-"];

        # Brightness Control
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
