{
 programs.ssh = {
  enable = true;

  extraConfig = ''

   Host serv_room
    HostName 192.168.2.80
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Tech_Deck
    HostName 192.168.2.2
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Counseling
    HostName 192.168.2.30
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Women_Lock_Room
    HostName 192.168.2.50
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Asbestos_Closet
    HostName 192.168.2.40
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Elec_Closet
    HostName 192.168.2.20
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Band_Room
    HostName 192.168.2.60
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Facilities
    HostName 192.168.2.90
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Concession
    HostName 192.168.2.96
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa

   Host Press_Box
    HostName 192.168.2.97
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa
    
   Host Sci_Left
    HostName 192.168.2.130
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa
    
   Host Sci_Right
    HostName 192.168.2.131
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa
    
   Host Shed
    HostName 192.168.2.100
    User admin
    Port 22
    KexAlgorithms +diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
    HostKeyAlgorithms +ssh-rsa
        
   Host home
    Hostname 10.0.0.17
    User hacky
    Port 22
   '';
  };
}
