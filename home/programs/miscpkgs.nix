{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # LSPs
    nil

    # utils
    fd # Like find, but good
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    zoxide # directory change helper
    teehee # Modal alternative to xxd
    wl-clipboard # cmd-line copy-paste for wayland
    tealdeer # rust tldr implementation
    grc # output colouriser
    lazygit # git tui tools
    tmux # it's tmux
    #delta # better diff output

    # networking tools
    dnsutils # `dig` + `nslookup`
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for IPv4/v6 addresses
    openvpn # standard tunnelling application

    # media
    playerctl # commandline controls for mpris media
    pwvucontrol # pipewire pavucontrol

    # communication
    signal-desktop
    vesktop

    # misc
    file
    which
    tree
    dust # Rust powered du alternative(finally got the namespace)
    btop # nicer looking htop
    bottom # also nicer looking htop
    yazi # terminal file manager
    zathura # pdf/document reader

    # nix related
    nix-output-monitor
    alejandra # formatter
    nvd # for cool diffs
    nh # for nom/nvd integration

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    vscode-fhs # intermediary for public presentations
    presenterm # cmd line slideshows

    #entertainment
    freetube
    yt-dlp
    qbittorrent
    nicotine-plus

    #music
    easyeffects # for eq
    euphonica # gtk mpd, in dev
    beets # auto-tagger

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    iotop # io monitor
    iftop # network monitor
    pciutils # lspci
    usbutils # lsusb

    # window manager related tools
    hyprlock # wayland lock scren, similar to swaylock
    wlsunset # blue light filtering
    wlogout #logout
    nautilus #file manager
    waybar # the og bar
    grimblast # screenshot utility implementing grim and slurp
    brightnessctl # for brightness control
    fuzzel # app launcher etc
    hyprpicker # colour picker
    swaynotificationcenter # it is what it says
    swww # we are back sisters

    # Programming tools (literally just python)
    python3
    python313Packages.ipython
    uv

    # security tools
    #seclists # Useful wordlists for brute-forcing etc.
    rustscan # For cursory first glances on pentesting operations
    feroxbuster # my directory buster of choice
    john # password brute forcing/cpu bound
    burpsuite # web intermediary proxy
    hashcat # password brute forcing/gpu bound
    dirb # auto directory busting
    pwntools # generally useful python bindings for binary exploit+web automation in ctf
    gdb # debugger for dynamic analysis
    ghidra # NSA's decompiler and associated tools
    (cutter.withPlugins (p: with p; [rz-ghidra jsdec sigdb])) # cutter with decompiler
    #pwndbg # gdb extension that adds more functionality to binary exploitation type tasks
    #TODO import pwndbg here so I don't have to rebuild every gc interval
    # pwndbg is gone :<

    # compatibility
    ungoogled-chromium # so that I can access evil website that mandate chrome

    #office
    libreoffice-fresh

    # misc
    cliphist
  ];

  # Some of these are here solely for theming purposes
  programs = {
    delta = {
      enable = true;
    };
    lazygit = {
      enable = true;
    };
    bottom = {enable = true;};
    freetube = {enable = true;};
    ncmpcpp = {enable = true;};
    floorp = {enable = true;};

    # Let home-manager manage itself
    home-manager = {enable = true;};
  };
}
