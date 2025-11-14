{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/kyrios/Music";
    network.startWhenNeeded = true; #systemd only starts mpd when incoming connection to mpd socket
    extraConfig = ''
      follow_outside_symlinks "yes"
      follow_inside_symlinks "yes"
      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };
  # go implementation of mprisv2 for mpd
  # sigsegv playerctld due to parsing NULL wrong (playerctld error)
  services.mpd-mpris = {
    enable = false;
    mpd.useLocal = true;
  };
}
