{ pkgs, ...}:

{
 environment.systemPackages = with pkgs; [
  rust-analyzer
  rustc
  python311Packages.python-lsp-server
  gopls
  vscode-langservers-extracted
  ];
}
