{
 programs.ssh = {
  enable = true;

  extraConfig = ''

   Host serv_room
    HostName 192.168.2.80
    Port 22

   Host Tech_Deck
    HostName 192.168.2.2
    Port 22

   Host Counseling
    HostName 192.168.2.30
    Port 22
    
   Host home
    Hostname 10.0.0.17
    Port 22
   
   '';
  };
}
