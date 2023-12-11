{ pkgs, ...}:

{
  programs.bat = {
    enable = true;
  };
  themes = {
    catppuccin = {
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
      };
      file = "Catppuccin-mocha.tmTheme";
    };
  };
}
