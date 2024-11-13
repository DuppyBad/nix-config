{
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  home = {
    username = "kyrios";
    homeDirectory = "/home/kyrios";
    # Don't you dare change the stateVersion
    stateVersion = "23.11";
  };
  # colour theming stuff
  catppuccin = {
    enable = true;
    accent = "mauve"; #mauve is default, here for clarity
    flavor = "mocha"; # mocha is also default
  };
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # LSPs
    #nvf handles their install for now

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
    docker-compose # to make docker easier

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for IPv4/v6 addresses
    openvpn # standard tunnelling application

    # media
    playerctl # commandline controls for mpris media

    # misc
    file
    which
    tree
    du-dust # Rust powered du alternative
    # yazi # terminal file manager
    zathura # pdf/document reader

    # nix related
    nix-output-monitor
    alejandra # formatter
    nvd # for cool diffs
    nh # for nom/nvd integration
    #cachix # binary cache ; TODO fix why this is being weird on enable

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    vscode-fhs # intermediary while we work on nixvim
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    presenterm # cmd line slideshows
    helix # editor

    #entertainment

    freetube

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # window manager related tools
    hyprlock
    #hyprpanel
    grimblast
    catppuccin-cursors.mochaDark
    gnome-themes-extra
    fuzzel
    hyprpicker
    greetd.regreet
    # Programming tools
    python3

    # security tools
    seclists
    rustscan
    feroxbuster
    john
    burpsuite
    hashcat
    dirb
    pwntools
    gdb
    pwndbg

    # compat
    ungoogled-chromium # so that I can access evil website that mandate chrome

    # gaming

    # lutris
  ];

  wayland.windowManager.hyprland = import ./config/hyprland.nix;

  programs = {
    helix = import ./config/helix.nix;
    alacritty = import ./config/alacritty.nix;
    git = import ./config/git.nix;
    starship = {enable = true;};
    fish = import ./config/fish.nix {inherit pkgs;};
    nix-index = {enable = true;};
    neovim.defaultEditor = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    nvf = import ./config/nvf.nix;
    kitty = import ./config/kitty.nix;
    bat = import ./config/bat.nix;
    lazygit = {enable = true;};
    bottom = {enable = true;};
    freetube = {enable = true;};
    fuzzel = {enable = true;};
    #TODO export this to it's own file
    spicetify = import ./config/spicetify.nix {inherit inputs pkgs;};
    # Let home-manager manage itself
    home-manager = {enable = true;};
  };
}
