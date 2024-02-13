{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        title = "Luke_Smith";
        url = "https://lukesmith.xyz/index.xml";
      }
      {
        title = "Linux_Exp";
        url = "https://thelinuxexp.com/feed.xml";
      }
    ];
    extraConfig = "include ~/Hacky_Nix/themes/dark";
  };
}
