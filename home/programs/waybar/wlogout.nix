{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
      }
      {
        label = "logout";
        action = "loginctl terminate-session";
        text = "Logout";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
      }
    ];
  };
}
