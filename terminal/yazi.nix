{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;

    settings = {
      log = {
        enabled = true;
      };
      manager = {
        show_hidden = false;
        sort_dir_first = true;
      };
    };      
  };
}
