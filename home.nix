{
  config,
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "kyrios";
  home.homeDirectory = "/home/kyrios";
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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$term" = "alacritty";
      "$menu" = "rofi";
      bind =
        [
          "$mod, return, exec, $term"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, V, togglefloating"
          "$mod, Tab, workspace, e+1"
          "$mod, Tab, workspace, e-1"
        ]
        ++ (
          #functional workspace defintion
          # binds $mod + {1..10} to the workspace corresponding
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };
  };

  programs = {
    # alacritty - a cross-platform, GPU-accelerated terminal emulator
    alacritty = import ./config/alacritty.nix;
    git = import ./config/git.nix;
    # pretty command prompt
    starship = {enable = true;};
    # fish-shell, no more zsh we're in the future
    fish = import ./config/fish.nix {inherit pkgs;};
    nix-index = {enable = true;};
    wezterm = import ./config/wezterm.nix;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  # nixvim - a Neovim configuration system for nix

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";

    opts = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;

      # 2 space tabs, just as nix intended
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # autointent, via spaces
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # incremental search
      hlsearch = true;
      incsearch = true;

      # text wrap
      wrap = true;

      # improve splitting
      splitbelow = true;
      splitright = true;

      # mouse mode on
      mouse = "a";

      # ignore case for improved searching
      ignorecase = true;
      # dont ignore case when caps specified
      smartcase = true;

      grepprg = "rg --vimgrep";

      # faster update time
      updatetime = 50;

      # highlight cursors line
      cursorline = true;
    };
    # Takes a lot of build time
    enableMan = false;
    plugins.cmp.enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lightline.enable = true;
    plugins.treesitter.enable = true;
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "live_grep";
      };
      extensions.fzf-native = {enable = true;};
    };
    plugins.oil.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
        ruff-lsp.enable = true;
        nixd.enable = true;
        rust-analyzer.enable = true;
        fsautocomplete.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
      };
    };
    # We let configuration.nix control programming language versioning
    plugins.lsp.servers.rust-analyzer.installCargo = false;
    plugins.lsp.servers.rust-analyzer.installRustc = false;
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
