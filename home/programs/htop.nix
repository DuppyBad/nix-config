{
  config,
  lib,
  ...
}: {
  programs.htop = {
    enable = true;
    settings =
      {
        show_cpu_frequency = 1;
        show_cpu_temperature = 1;
        color_scheme = 6;
        highlight_threads = 1;
        delay = 10;
        fields = with config.lib.htop.fields; [
          PID
          USER
          PRIORITY
          NICE
          M_SIZE
          M_RESIDENT
          M_SHARE
          STATE
          PERCENT_CPU
          PERCENT_MEM
          TIME
          ELAPSED
          COMM
          IO_RATE
        ];
      }
      // (with config.lib.htop;
        leftMeters [
          (bar "CPU")
          (bar "GPU")
          (text "MemorySwap")
        ])
      // (with config.lib.htop;
        rightMeters [
          (text "PressureStallCPUSome")
          (text "Tasks")
          (text "Uptime")
          (text "DiskIO")
          (text "PressureStallIOFull")
          (text "NetworkIO")
        ]);
  };
}
