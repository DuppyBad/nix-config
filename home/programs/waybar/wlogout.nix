{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        action = "hyprlock";
        text = "Lock";
      }
      {
        action = "loginctl terminate-session";
        text = "Logout";
      }
      {
        action = "systemctl poweroff";
        text = "Shutdown";
      }
      {
        action = "systemctl suspend";
        text = "Bedtime";
      }
      {
        action = "systemctl reboot";
        text = "Reboot";
      }
    ];
  };
}
