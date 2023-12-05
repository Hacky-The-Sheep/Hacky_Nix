{ config, pkgs, ... }:

{
    # Fonts
    fonts.fonts = with pkgs; [
  	fira-code
  	fira-code-symbols
  	fira-code-nerdfont
  	iosevka
    monaspace
    powerline
  ];
}
