{ pkgs, ...}:

{
 environment.systemPackages = with pkgs; [
  clippy
  marksman
  openssl
  rust-analyzer
  rustc
  # python311Packages.python-lsp-server
  gopls
  vscode-langservers-extracted
  ];
}
