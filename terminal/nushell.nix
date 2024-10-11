{
  programs.nushell = {
    enable = true;

    # Aliases
    shellAliases = {
      # General
      ll = "ls -l";
      ei = "exit";
      zj = "zellij";

      # Git
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";

      # Nix Stuff
      gecon = "nix-store --gc";
    };

    # Config
    extraConfig = ''
      $env.config = {
        show_banner: false,
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
        }
      }
    '';
  };
}
