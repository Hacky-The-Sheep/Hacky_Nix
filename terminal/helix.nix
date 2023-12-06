{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        auto-format = true;
      };
      editor.statusline = {
        left = [ "mode" "spinner" "read-only-indicator" "file-modification-indicator"];
        center = [ "file-name" ];
        right = [ "selections" "positions" "file-encoding" "file-line-ending" "file-type" ];
        mode.normal = "NORMAL 🐧";
        mode.insert = "INSERT 🚀";
        mode.select = "SELECT  👆";
      };
      editor.lsp = {
        insert = "bar";
        select = "underline";
      };
      editor.indent-guides = {
        render = true;
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection"];
        C-space = "signature_help";
        X = "extend_line_up";
      };
      keys.normal.space = {
        w = ":write";
        q = ":quit";
        b = ":buffer-close";
      };
    };
    language = {
      name = "python";
      scope = "source.python";
      injection-regex = "python" ;
      file-types = ["py" "pyi" "py3" "pyw" ".pythonstartup" ".pythonrc"];
      shebangs = ["python"] ;
      roots = ["." "pyproject.toml" "pyrightconfig.json"];
      comment-token = "#" ;
      language-servers = ["pyright" "ruff" "pylsp"];
      auto-format = true;
    };
    language.formatter = {
      command = "ruff";
      args = [ "format" "-"]; 
    };
  };
}
