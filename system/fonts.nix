{ pkgs, ... }:

{
    # Fonts
    fonts.packages = with pkgs; [
  	# fira-code
  	# fira-code-symbols
  	# fira-code-nerdfont
   #  intel-one-mono
  	iosevka
    # monaspace
    # powerline
    # source-sans-pro
  ];
}
