{
  programs.lf = {
    enable = true;
    previewer.source = {
      pkgs.writeShellScript  = "./lf_previewer.sh";
    };
  };
}
