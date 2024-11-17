# NixOS Config

## Kyrios' personal device config as a flake

Current Flake Structure

```
.
├── flake.lock
├── flake.nix
├── home
│   ├── default.nix
│   └── programs
│       ├── alacritty.nix
│       ├── bat.nix
│       ├── default.nix
│       ├── fish.nix
│       ├── foot.nix
│       ├── hypr
│       │   ├── default.nix
│       │   ├── hyprland.nix
│       │   └── hyprlock.nix
│       ├── kitty.nix
│       ├── miscpkgs.nix
│       ├── nix-index.nix
│       ├── nvf.nix
│       ├── spicetify.nix
│       ├── starship.nix
│       ├── waybar.nix
│       └── zoxide.nix
├── hosts
│   ├── default.nix
│   └── sun
│       ├── default.nix
│       └── hardware-configuration.nix
├── LICENSE
├── modules
│   ├── default.nix
│   ├── programs
│   │   ├── default.nix
│   │   └── dev
│   │       ├── default.nix
│   │       └── git.nix
│   └── system
│       ├── default.nix
│       └── nix
│           ├── default.nix
│           └── nixpkgs.nix
└── README.md
```

when paths randomly break(?!)
`sudo nix-store --repair --verify --check-contents`

TODO

- [x] modularise home.nix
- [x] get a tiling window manager fully functioning
- [ ] host specfic specifications
