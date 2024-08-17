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
    bat # the better cat
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
    ipcalc # it is a calculator for the IPv4/v6 addresses
    openvpn # standard tunnelling application

    # media
    spotify # it's spotify. may my music be free one day.
    spicetify-cli # it's spotify but pretty. may my music be tui only one day.
    playerctl # commandline controls for mpris media

    # misc
    file
    which
    tree
    du-dust # Rust powered du alternative
    yazi # terminal file manager
    zathura # pdf/document reader

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    alejandra
    nvd # for cool diffs
    nh # for nom/nvd integration

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    vscode-fhs # intermediary while we work on nixvim

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

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
    waybar
    # notification daemon
    mako

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
    # TODO wezterm deviates a bit from declaration, hardcoded lua file for config
    # wezterm is kinda annoying with wayland and it wants to build itself on rebuild? stop
    #wezterm = import ./config/wezterm.nix;
    wezterm = {enable = false;};
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    nixvim = import ./config/nixvim.nix;
    #  waybar = import ./config/waybar.nix;
    kitty = {enable = true;};
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
