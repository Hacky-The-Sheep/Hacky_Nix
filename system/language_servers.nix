{ pkgs, ...}:

{
 environment.systemPackages = with pkgs; [
  ansible-language-server
  clippy
  gopls
  marksman
  openssl
  # python311Packages.python-lsp-server
  rust-analyzer
  rustc
  vscode-langservers-extracted
  yaml-language-server  ];
}
