{
  services.tailscale.enable = true;

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/home/kyrios/Music";
      Address = "0.0.0.0";
      Port = 4533;
    };
  };
}
