{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      log = {
        enabled = true;
      };
      manager = {
        show_hidden = false;
        sort_by = "name";
        sort_dir_first = true;
      };
    };

  };
}
