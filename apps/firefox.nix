{ inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.hacky = {

        bookmarks = [
          {
            name = "Oryx";
            tags = [ "oryx" ];
            keyword = "oryx";
            url = "https://configure.zsa.io/";
          }
          {
            name = "MP3";
            keyword = "mp3";
            url = "https://free-mp3-download.net/";
          }
          {
            name = "Monkeytype";
            keyword = "mt";
            url = "https://monkeytype.com/";
          }
          {
            name = "DIM";
            keyword = "dm";
            url = "https://app.destinyitemmanager.com/login";
          }
          {
            name = "MyNixOS";
            keyword = "nix";
            url = "https://mynixos.com/";
          }
          {
            name = "KeyMash";
            keyword = "km";
            url = "https://keymash.io/";
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

      settings = {
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = true;
        "signon.rememberSignons" = false;
        "browser.startup.homepage" = "https://search.brave.com/";

        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.backgroundtask.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;

        "browser.download.clearHistoryOnDelete" = 1;
        "browser.search.suggest.enabled" = false;
        "browser.search.widget.inNavBar" = false;
        "browser.urlbar.contextualSearch.enabled" = false;
        "browser.urlbar.shortcuts.history" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.newtabpage.enabled" = false;

        "font.name.serif.x-western" = "Iosevka";

        # Pocket 😝
        "extensions.pocket.enabled" = false;
        "extensions.pocket.showHome" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.newtabpage.activity-stream.discoverystream.saveToPocketCard.enabled" = false;
      };

    };
  };
}