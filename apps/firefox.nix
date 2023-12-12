{ inputs, ... }:

{
  programs.firefox = {
    enable = true;
  };
  profiles.hacky = {

      bookmarks = [
        {
          name = "Oryx";
          url = "https://configure.zsa.io/";
        }
        {
          name = "MP3";
          url = "https://free-mp3-download.net/";
        }
        {
          name = "Monkeytype";
          url = "https://monkeytype.com/";
        }
        {
          name = "DIM";
          url = "https://app.destinyitemmanager.com/login";
        }
        {
          name = "MyNixOS";
          url = "https://mynixos.com/";
        }
      ];

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        return-youtube-dislikes
        reddit-enhancement-suite
        old-reddit-redirect
        sponsorblock
      ];
  };
}
