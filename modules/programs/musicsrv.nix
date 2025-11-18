{
  config,
  lib,
  ...
}: {
  services.tailscale.enable = true;

  # allows the symlink to be followed
  systemd.services.navidrome.serviceConfig = {
    BindReadOnlyPaths = [
      "/home/kyrios/Music"
      "/mnt/windows/Users/Ghost/Music"
    ];
    ProtectHome = lib.mkForce false; # please don't destroy my home dir dear navidrome...
  };
  services.navidrome = lib.mkIf (config.networking.hostName == "sun") {
    enable = true;
    settings = {
      MusicFolder = "/home/kyrios/Music";
      Address = "0.0.0.0";
      Port = 4533;
    };
  };
}
