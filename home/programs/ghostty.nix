{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-family = ["Geist Mono" "Symbols Nerd Font Mono"];
      font-size = 14;
      background-opacity = 0.92;
      gtk-titlebar = false;
      confirm-close-surface = false;
      resize-overlay = "never";
      #if we deny decorations, it doesn't listen to anything
      # sometimes ghostty will latch the context of another window.
      working-directory = "home";
      # TODO, keep an eye on this
      quit-after-last-window-closed = false;
      # no terminal emulator, i dont want a toast when I copy to clipboard
      app-notifications = false;
    };
  };
}
