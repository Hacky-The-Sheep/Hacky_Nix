{ inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.hacky = {

        bookmarks = [
          {
            name = "Bookmarks";
            toolbar = true;
            bookmarks = [   

              # Folders
              {
                name = "Mr Robot";
                bookmarks = [
                  {
                    name = "TryHackMe";
                    keyword = "th";
                    url = "https://tryhackme.com";
                  }
                  {
                    name = "NIST";
                    url = "https://www.nist.gov/cyberframework";
                  }
                  {
                    name = "OWASP";
                    url = "https://owasp.org/";
                  }
                  {
                    name = "OWASP Favicon DB";
                    url = "https://wiki.owasp.org/index.php/OWASP_favicon_database";
                  }
                  {
                    name = "Wappalyzer";
                    url = "https://www.wappalyzer.com/";
                  }
                  {
                    name = "CRT";
                    url = "https://crt.sh/";
                  }
                  {
                    name = "Cert Lookup";
                    url = "https://ui.ctsearch.entrust.com/ui/ctsearchui"; 
                  }
                ];
              }
              {
                name = "Nix Sites";
                bookmarks = [   
                  {
                    name = "MyNixOS";
                    keyword = "nix";
                    url = "https://mynixos.com/";
                  }
                  {
                    name = "Nix Packages";
                    url = "https://search.nixos.org/packages";
                  }
                ];
              }
              {
                name = "Jobs";
                bookmarks = [
                  {
                    name = "Clear Creek ISD";
                    url = "https://clearcreekisd.tedk12.com/hire/index.aspx?jcat=Technology%20Education";
                  }
                  {
                    name = "Duchesne";
                    url = "https://recruiting.paylocity.com/Recruiting/Jobs/All/71da38bc-7973-4602-81ab-c751c00fb0b6/Religious-of-the-Sacred-Heart-Inc";
                  }
                  {
                    name = "Rice University";
                    url = "https://emdz.fa.us2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_2001/requisitions?lastSelectedFacet=CATEGORIES&selectedCategoriesFacet=300000008971178";
                  }
                  {
                    name = "SJC";
                    url = "https://sanjac.csod.com/ux/ats/careersite/3/home?c=sanjac";
                  }
                ];
              }
              # Single Links
              {
                name = "KeyMash";
                keyword = "km";
                url = "https://keymash.io/";
              }
              {
                name = "Monkeytype";
                keyword = "mt";
                url = "https://monkeytype.com/";
              }
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
                name = "DIM";
                keyword = "dm";
                url = "https://app.destinyitemmanager.com/login";
              }
              {
                name = "Nerd Fonts";
                url = "https://www.nerdfonts.com/";
              }
            ];
          }
        ];

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          gnome-shell-integration
          old-reddit-redirect
          reddit-enhancement-suite
          return-youtube-dislikes
          sponsorblock
          ublock-origin
        ];

      settings = {

        # Theme
        "layout.css.prefers-color-scheme.content-override" = 0;
        "extensions.activeThemeID" = "{1cd0d6ef-d4bf-4fd1-9d80-4a9811a84647}";
        "browser.uiCustomization.state" = "{'placements':{'widget-overflow-fixed-list':[],'unified-extensions-area':[''_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action','chrome-gnome-shell_gnome_org-browser-action','wappalyzer_crunchlabz_com-browser-action'],'nav-bar':['back-button','forward-button','stop-reload-button','urlbar-container','save-to-pocket-button','downloads-button','fxa-toolbar-menu-button','unified-extensions-button','sponsorblocker_ajay_app-browser-action','ublock0_raymondhill_net-browser-action',''_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action'],'toolbar-menubar':['menubar-items'],'TabsToolbar':['firefox-view-button','tabbrowser-tabs','new-tab-button','alltabs-button'],'PersonalToolbar':['personal-bookmarks']},'seen':['developer-button',''_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action',''_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action','sponsorblocker_ajay_app-browser-action','ublock0_raymondhill_net-browser-action','chrome-gnome-shell_gnome_org-browser-action','wappalyzer_crunchlabz_com-browser-action'],'dirtyAreaCache':['nav-bar','unified-extensions-area','toolbar-menubar','TabsToolbar','PersonalToolbar'],'currentVersion':20,'newElementCount':5}";

        # Security
        "app.shield.optoutstudies.enabled" = false;
        "browser.startup.homepage" = "https://search.brave.com/";
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "toolkit.telemetry.pioneer-new-studies-available" = false;

        # Telemetry
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.backgroundtask.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;

        # AutoFill
        "browser.urlbar.autoFill" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        # Search
        "browser.download.clearHistoryOnDelete" = 1;
        "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomeBar" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = false;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.widget.inNavBar" = false;
        "browser.urlbar.contextualSearch.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.shortcuts.history" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.url.placeholderName" = "DuckDuckGo";
        "browser.url.placeholderName.private" = "DuckDuckGo";
        "geo.enabled" = false;

        # Font
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
