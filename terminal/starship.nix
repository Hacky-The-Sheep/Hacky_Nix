{ pkgs, ... }: 

{
  catppuccin.flavor = "mocha";
  
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ../starship.toml;
    catppuccin.enable = true;
    };
}
