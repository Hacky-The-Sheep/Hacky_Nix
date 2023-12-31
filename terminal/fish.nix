{
 programs.fish = {
    enable = true;

    shellInit =
    "
    set -g fish_greeting \n

    if set -q ZELLIJ\n
    else\n
      zellij\n
    end\n

    begin\n
      eval (ssh-agent -c)\n
      ssh-add ~/.ssh/id_ed25519\n
    end &> /dev/null
    ";

    shellAliases = {
      ei = "exit";
      python = "python3";
      cat = "bat";

      # ZelliJ
      notes = "zellij --layout ~/.dotfiles/layouts/notes.kdl";
      thm = "zellij --layout ~/.dotfiles/layouts/thm.kdl";

      # Git
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";

      # YoutubeDL
      yty = "yt-dlp -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ";
      ytu = "yt-dlp -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s'";
      ydl = "yt-dlp --prefer-ffmpeg --merge-output-format mkv ";
      ymp4 = "yt-dlp --prefer-ffmpeg --merge-output-format mp4 ";
      ymp3 = "yt-dlp --extract-audio --audio-format mp3 ";
      ls = "exa --color --icons";
      sls = "exa -a --color --icons";
      zj = "zellij";

      # NixOS ❄
      ## Laptop
      lhmu = "home-manager switch --flake .#laptop";
      lnup = "sudo nixos-rebuild switch --flake .#laptop";

      ## Work Desktop
      whmu = "home-manager switch --flake .#work";
      wnup = "sudo nixos-rebuild switch --flake .#work";

      ## Server
      shmu = "home-manager switch --flake .#server";
      snup = "sudo nixos-rebuild switch --flake .#server";

      ## Home Desktop
      hhmu = "home-manager switch --flake .#home";
      hnup = "sudo nixos-rebuild switch --flake .#home";

      ## General
      # up = "nixos-rebuild switch --upgrade";
      clcon = "nix-env --delete-generations 14d";
      gecon = "nix-store --gc";
    };
  };
}
