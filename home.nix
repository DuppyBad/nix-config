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

  programs.zoxide = {
    enable = true;
    # defaults to true anyway, just for testing
    enableFishIntegration = true;
  };

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

  programs.nix-index = {
    enable = true;
  };

  # basic configuration of git, imagine if we had our kyrios domain set properly
  programs.git = {
    enable = true;
    userName = "kyrios";
    userEmail = "kyrios@tinybrain.ltd";
    extraConfig  = {
      init.defaultBranch = "main";
      safe.directory = "/home/kyrios/.config/nixos/system";
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
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

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      window = {
        opacity = 0.9;
      };
      font = {
        normal.family = "JetBrains Mono Nerd Font";
        bold.family = "JetBrains Mono Nerd Font";
        italic.family = "JetBrains Mono Nerd Font";
        size = 13.5;
      };
      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          dim_foreground = "#7f849c";
          bright_foreground = "#cdd6f4";
        };
        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };
        vi_mode_cursor = {
          text = "#1e1e2e";
          cursor = "#b4befe";
        };
        selection = {
          text = "#1e1e2e";
          background = "#f5e0dc";
        };
        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };
        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };
        dim = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      shell = {
        program = "fish";
      };
    };
  };

  # fish-shell, no more zsh we're in the future
  programs.fish = {
    enable = true;
    shellAliases = {
      "..." = "cd ../..";
      "v" = "nvim";
      "vi" = "nvim";
      "ga" = "git add *";
      "g" = "git";
      "copy" = "wl-copy";
      "ls" = "eza";
      "la" = "eza --all --icons --git";
    };
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
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
