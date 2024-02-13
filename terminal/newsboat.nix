{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        tags = [
          "tech"
          "misch"
        ];
        title = "Luke_Smith";
        url = "https://lukesmith.xyz/index.xml";
      }
      {
        tags = [
          "linux"
        ];
        title = "Linux_Exp";
        url = "https://thelinuxexp.com/feed.xml";
      }
      {
        tags = [
          "linux"
        ];
        title = "Linux_Cast";
        url = "https://feeds.fireside.fm/thelinuxcast/rss";
      }
      {
        tags = [
          "tech"
        ];
        title = "Darknet_Diaries";
        url = "https://feeds.megaphone.fm/darknetdiaries";
      }
      {
        tags = [
          "tech"
        ];
        title = "System76";
        url = "https://blog.system76.com/rss.xml";
      }
      {
        tags = [
          "Catholic"
        ];
        title = "SSPX";
        url = "https://sspx.org/en/rss";
      }
      {
        tags = [
          "Catholic"
        ];
        title = "Fr Z";
        url = "https://wdtprs.com/feed/";
      }
      {
        tags = [
          "Tech"
        ];
        title = "It's_FOSS";
        url = "https://news.itsfoss.com/latest/rss/";
      }
      {
        tags = [
          "Tech"
        ];
        title = "PC_Load_Letter";
        url = "https://www.pcloadletter.dev/feed/feed.xml";
      }
      {
        tags = [
          "Tech"
        ];
        title = "Eric_Murphy";
        url = "https://ericmurphy.xyz/index.xml";
      }
      {
        tags = [
          "Tech"
        ];
        title = "Faster_Than_Lime";
        url = "https://fasterthanli.me/index.xml";
      }
    ];
    extraConfig = "include ~/Hacky_Nix/themes/dark";
  };
}
