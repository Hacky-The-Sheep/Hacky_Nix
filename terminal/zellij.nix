{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;
    settings = {
      pane_frames = false;
      # theme = "catppuccin-mocha";
      default_layout = "compact";
    };
  };
}
