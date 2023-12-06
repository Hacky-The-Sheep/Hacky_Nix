{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      theme = "catppuccin-mocha";
      default_layout = "compact";
    };
  };
}
