{
 programs.fish = {
    enable = true;

    shellInit =
    "
    set -g fish_greeting \n
    ";

    shellAliases = {
      ei = "exit";
      python = "python3";
      cat = "bat";
      nb = "newsboat";
      hack = "cd ~/Documents/TryHackMe/";

      # Markdown -> PDF
      ## ...latex -o OUTFILE.pdf YOUR-FILE.md
      pd = "pandoc -f markdown-implicit_figures -t latex -o";

      # ZelliJ
      notes = "zellij --layout ~/Hacky_Nix/layouts/notes.kdl";
      thm = "zellij --layout ~/Hacky_Nix/layouts/thm.kdl";

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
      ls = "exa -1";
      sls = "exa -a --color --icons";
      zj = "zellij";

      # NixOS ❄
      ## Laptop
      lhmu = "home-manager switch --flake .#laptop";
      lnup = "sudo nixos-rebuild switch --flake .#laptop";

      ## Work Desktop
      whmu = "home-manager switch --flake .#work";
      wnup = "sudo nix-channel --update && sudo nixos-rebuild switch --flake .#work";

      ## Server
      shmu = "home-manager switch --flake .#server";
      snup = "sudo nixos-rebuild switch --flake .#server";

      ## Home Desktop
      hhmu = "home-manager switch --flake .#home";
      hnup = "sudo nix-channel --update && sudo nixos-rebuild switch --flake .#home";

      ## General
      clcon = "nix-env --delete-generations 14d";
      gecon = "nix-store --gc";
    };
  };
}
