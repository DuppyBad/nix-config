{
  config,
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  home.username = "kyrios";
  home.homeDirectory = "/home/kyrios";
  # colour theming stuff
  catppuccin = {
    enable = true;
    accent = "mauve"; #mauve is default, here for clarity
    flavor = "mocha"; # mocha is also default
    pointerCursor.enable = true;
  };
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    fd # Like find, but good
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    zoxide # directory change helper
    teehee # Modal alternative to xxd
    grimblast # Screenshot helper for hyprland
    # bat # the better cat
    wl-clipboard # cmd-line copy-paste for wayland
    tealdeer # rust tldr implementation
    grc # output colouriser
    lazygit # git tui tools

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
    spotify # it's spotify. may my music be free one day.
    playerctl # commandline controls for mpris media

    # misc
    file
    which
    tree
    du-dust # Rust powered du alternative
    yazi # terminal file manager
    zathura # pdf/document reader

    # nix related
    nix-output-monitor
    alejandra # styler
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
    swww
    eww # widgets to replace waybar
    # waybar
    # notification daemon
    mako

    # Programming tools
    nodejs
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
  ];

  # Potential script location

  wayland.windowManager.hyprland = import ./config/hyprland.nix;

  programs = {
    # alacritty - a cross-platform, GPU-accelerated terminal emulator
    alacritty = import ./config/alacritty.nix;
    git = import ./config/git.nix;
    # pretty command prompt
    starship = {enable = true;};
    # fish-shell, no more zsh we're in the future
    fish = import ./config/fish.nix {inherit pkgs;};
    nix-index = {enable = true;};
    neovim.defaultEditor = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    nixvim = import ./config/nixvim.nix;
    # nvf = import ./config/nvf.nix;
    #  waybar = import ./config/waybar.nix;
    kitty = import ./config/kitty.nix;
    bat = import ./config/bat.nix;
    lazygit = {enable = true;};
    bottom = {enable = true;};
  };

  services = {
    mako = {enable = true;};
  };
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  # Let home Manager install and manage itself.
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
