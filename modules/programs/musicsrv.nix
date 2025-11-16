{
  config,
  lib,
  ...
}: {
  services.tailscale.enable = true;

  systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce false;
  services.navidrome = lib.mkIf (config.networking.hostName == "sun") {
    enable = true;
    settings = {
      MusicFolder = "/home/kyrios/Music";
      Address = "0.0.0.0";
      Port = 4533;
    };
  };
}
