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
  # causes playerctld to segfault, we manually work around this on boot. FIXME
  services.mpd-mpris = {
    enable = false;
    mpd.useLocal = true;
  };
}
