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

    # networking tools
    dnsutils # `dig` + `nslookup`
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
    btop # nicer looking htop
    bottom # also nicer looking htop
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
    vscode-fhs # intermediary for public presentations
    presenterm # cmd line slideshows
    helix # editor
    libreoffice-fresh # gtk version of fresh libreoffice

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
    iotop # io monitor
    iftop # network monitor
    pciutils # lspci
    usbutils # lsusb

    # window manager related tools
    hyprlock # wayland lock scren, similar to swaylock
    #hyprpanel
    grimblast # screenshot utility implementing grim and slurp
    catppuccin-cursors.mochaDark # pretty cursor
    gnome-themes-extra # for theme compat
    fuzzel # app launcher etc
    hyprpicker # colour picker

    # Programming tools
    python3

    # security tools
    seclists # Useful wordlists for brute-forcing etc.
    rustscan # For cursory first glances on pentesting operations
    feroxbuster # my directory buster of choice
    john # password brute forcing/cpu bound
    burpsuite # web intermediary proxy
    hashcat # password brute forcing/gpu bound
    dirb # auto directory busting
    pwntools # generally useful python bindings for binary exploit+web automation in ctf
    gdb # debugger for dynamic analysis
    pwndbg # gdb extension that adds more functionality to binary exploitation type tasks

    # compatibility
    ungoogled-chromium # so that I can access evil website that mandate chrome

    # gaming
  ];

  wayland.windowManager.hyprland = import ./config/hyprland.nix;

  programs = {
    helix = import ./config/helix.nix;
    foot = import ./config/foot.nix;
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
    spicetify = import ./config/spicetify.nix {inherit inputs pkgs;};
    # Let home-manager manage itself
    home-manager = {enable = true;};
  };
}
