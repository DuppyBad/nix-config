{
  pkgs,
  lib,
  config,
  ...
}: {
  # Needs to be in-scope for the auto-integration to function (it doesn't get autocalled by the option)
  home.packages = [pkgs.xwayland-satellite];
  programs.niri = {
    settings = {
      spawn-at-startup = [
        # TODO: more elegant systemd spawn via normal options?
        # {command = ["systemctl enable --user app-com.mitchellh.ghostty.service"];}
        {command = ["${lib.getExe pkgs.wlsunset}" "-l" "51.1" "-L" "0.07"];}
        # timezone general lL, sorry to disappoint
        {command = ["${lib.getExe pkgs.waybar}"];}
        {command = ["${lib.getExe' pkgs.swww "swww-daemon"}"];}
      ];
      outputs = {
        "DP-3" = {
          mode = {
            # can do 240 but no need(we're doing 240)
            refresh = 239.958;
            height = 1440;
            width = 2560;
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
        "HDMI-A-5" = {
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
          # disable when typing is true
          dwt = true;
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
      window-rules = [
        {
          matches = [
            {
              app-id = "kitty";
            }
          ];
          draw-border-with-background = false;
        }
      ];
      layer-rules = [
        {
          matches = [
            {
              namespace = "^swaync-notification-window$";
            }
          ];
          block-out-from = "screen-capture";
        }
      ];
      overview = {
        # mocha base #1e1e2e
        backdrop-color = "#1e1e2e";
      };

      binds = with config.lib.niri.actions; let
        playerctl = spawn "${lib.getExe pkgs.playerctl}";
      in
        {
          "Mod+Return".action = spawn ["${lib.getExe pkgs.kitty}"];
          "Mod+D".action =
            spawn "${lib.getExe pkgs.fuzzel}" "--launch-prefix=niri msg action spawn -- ";
          "Mod+Q".action = close-window;
          "Mod+Shift+F".action = fullscreen-window;
          "Mod+F".action = maximize-column;
          "Mod+C".action = center-column;
          "Mod+R".action = switch-preset-column-width;
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;
          "Mod+V".action = toggle-window-floating;
          "Mod+L".action = spawn "${lib.getExe pkgs.hyprlock}";
          "Mod+L".allow-when-locked = true;
          "Mod+Shift+E".action = spawn "${lib.getExe pkgs.wlogout}";

          "Mod+Left".action = focus-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+Up".action = focus-window-or-workspace-up;
          "Mod+Down".action = focus-window-or-workspace-down;
          "Mod+Tab".action = focus-workspace-previous;

          "Mod+Shift+Left".action = move-column-left;
          "Mod+Shift+Right".action = move-column-right;
          "Mod+Shift+Up".action = move-column-to-workspace-up;
          "Mod+Shift+Down".action = move-column-to-workspace-down;
          "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        }
        // (
          lib.genAttrs
          (map (n: "Mod+${toString n}") (lib.range 1 4))
          (key: {
            action = focus-workspace (lib.toInt (lib.removePrefix "Mod+" key));
          })
        )
        // {
          "XF86AudioMute".action =
            spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
          "XF86AudioRaiseVolume".action =
            spawn ["wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "5%+"];
          "XF86AudioLowerVolume".action =
            spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
          "Shift+XF86AudioRaiseVolume".action =
            spawn ["wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "1%+"];
          "Shift+XF86AudioLowerVolume".action =
            spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "1%-"];
          "XF86AudioPlay".action = playerctl "play-pause";
          "XF86AudioStop".action = playerctl "pause";
          "XF86AudioPrev".action = playerctl "previous";
          "XF86AudioNext".action = playerctl "next";

          "XF86MonBrightnessUp".action = spawn ["brightnessctl" "set" "+5%"];
          "XF86MonBrightnessDown".action =
            spawn ["brightnessctl" "set" "5%-"];

          "Mod+Shift+S".action.screenshot = {show-pointer = false;};
          "Print".action.screenshot-screen = {write-to-disk = false;};

          "Mod+P".action = spawn ["${lib.getExe pkgs.hyprpicker}" "-a"];
        };

      prefer-no-csd = true;
      hotkey-overlay = {
        skip-at-startup = true;
      };
    };
  };
}
