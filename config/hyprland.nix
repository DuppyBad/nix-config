{
  enable = true;
  catppuccin.enable = true;
  settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$menu" = "fuzzel";

    bind =
      [
        "$mod, return, exec, $term"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, D, exec, $menu"
        "$mod, V, togglefloating"
        "$mod, Tab, workspace, e+1"
        "$mod SHIFT, Tab, workspace, e-1"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindowpixel"
      ]
      ++ (
        #functional workspace defintion
        # binds $mod + {1..10} to the workspace corresponding
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };
  extraConfig = ''
    # cringe since it is specific to REAL hardware, breaks when distributed. can we specify via nix variables? TODO
    monitor = DP-3,2560x1440@239.96, 0x0, 1
    monitor = HDMI-A-5,1366x768@59.96400, 2560x0 ,1
    #Autostarting
    exec-once = mako
    exec-once = hyprctl setcursor Bibata-Modern-Classic 24

    input {
      kb_layout = gb
      follow_mouse = 1
    }
  '';
}
