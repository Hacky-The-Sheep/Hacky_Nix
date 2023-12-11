{ pkgs, ...}:

{
  programs.lf = {
    enable = true;

    keybindings = {
      "\\\"" = "";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=catppuccin-mocha "$f"'';
    };
  };
}
