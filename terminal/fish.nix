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
      dhmu = "home-manager switch --flake .#work_desktop";
      dnup = "sudo nixos-rebuild switch --flake .#work_desktop";

      ## Server
      shmu = "home-manager switch --flake .#server";
      snup = "sudo nixos-rebuild switch --flake .#server";

      ## Home Desktop
<<<<<<< HEAD
      hhmu = "home-manager switch --flake .#home";
      hnup = "sudo nixos-rebuild switch --flake .#home";
=======
      hhmu = "home-manager switch --flake .#home_desktop";
      hnup = "sudo nixos-rebuild switch --flake .#home_desktop";
>>>>>>> 302083749d0ae3986951c56e072ef65e7cc77d78

      ## General
      # up = "nixos-rebuild switch --upgrade";
      clcon = "nix-env --delete-generations 14d";
      gecon = "nix-store --gc";
    };
  };
}
