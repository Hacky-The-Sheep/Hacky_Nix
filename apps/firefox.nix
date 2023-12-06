{ pkgs, ... }:

{
  programs.firefox = {
    enabled = true;
    profiles = {
      default = {
        id = 0;
        name = "hacky";
        isDefault = true;
        settings = {
          "browser.search.defaultenginename" = "DuckDuckGo";
        };
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        extenstions = with pkgs.inputs.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };
  };
}
