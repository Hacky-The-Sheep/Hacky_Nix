{ pkgs, ... }:

{
    # Fonts
    fonts.packages = with pkgs; [
  	fira-code
  	fira-code-symbols
  	fira-code-nerdfont
  	iosevka
    monaspace
    powerline
  ];
}
