{ pkgs, ...}:

{
 environment.systemPackages = with pkgs; [

  rust-analyzer
  python311Packages.python-lsp-server
    
  ];
}
