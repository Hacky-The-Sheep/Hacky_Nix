{ options, config, lib, pkgs, ... }:

in
{
  options.campground.apps.firefox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Firefox.";
    cac = mkBoolOpt false "Enable CAC Support";
  };

  config = mkIf cfg.enable {

    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "";
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";
          };
          bookmarks = {
            {
              name = "Oryx";
              tags = [ "Oryx" ];
              keyword = "oryx";
              toolbar = true;
              url = "https://configure.zsa.io/";
            }
            {
              name = "MP3";
              toolbar = true;
              url = "https://free-mp3-download.net/";
            }
            {
              name = "MonkeyType";
              toolbar = true;
              url = "https://monkeytype.com/";
            }
            {
              name = "DIM";
              toolbar = true;
              url = "https://app.destinyitemmanager.com/login";
            }
            {
              name = "Keymap Editor";
              toolbar = true;
              url = "https://nickcoutsos.github.io/keymap-editor/";
            }
            {
              name = "KeyMash";
              toolbar = true;
              url = "https://keymash.io/";
            }
            {
              name = "TypeRacer";
              toolbar = true;
              url = "https://play.typeracer.com/";
            }
            {
              name = "TinyCat";
              toolbar = true;
              url = "https://www.librarycat.org/admin/";
            }
            {
              name = "Jobs";
              toolbar = true;
              bookmarks = [
                {
                  name = "CCISD";
                  url = "https://clearcreekisd.tedk12.com/hire/index.aspx?jcat=Technology%20Education";
                }
                {
                  name = "Duchesne";
                  url = "https://recruiting.paylocity.com/Recruiting/Jobs/All/71da38bc-7973-4602-81ab-c751c00fb0b6/Religious-of-the-Sacred-Heart-Inc";
                }
                {
                  name = "Rice";
                  url = "https://emdz.fa.us2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_2001/requisitions?lastSelectedFacet=CATEGORIES&selectedCategoriesFacet=300000008971178";
                }
                {
                  name = "SJC";
                  url = "https://sanjac.csod.com/ux/ats/careersite/3/home?c=sanjac";
                }
              ];
            }
            {
              name = "Mr Robot";
              toolbar = true;
              bookmarks = [
                {
                  name = "OWASP";
                  url = "https://owasp.org/";
                }
                {
                  name = "HackerOne";
                  url = "https://www.hackerone.com/";
                }
                {
                  name = "HackTheBox";
                  url = "https://hackthebox.com/";
                }
                {
                  name = "OffSec";
                  url = "https://portal.offsec.com/library/all?mySubscriptionsFlag=false&sortBy=Job+Roles_position%3Aasc%2CSkills_position%3Aasc";
                }
              ];
            }
          };
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [ "DuckDuckGo" ];
            engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@nw" ];
              };
              "DuckDuckGo" = {
                urls = [{ template = "https://duckduckgo.com/?q=search&kp=-1&kl=us-en{searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@searx" ];
              };
            };
          };
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            bitwarden
            old-reddit-redirect
            multi-account-containers
            reddit-enhancement-suite
          ];
        };
      };
    };
  };
}
