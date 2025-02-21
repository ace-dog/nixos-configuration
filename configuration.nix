# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     wget
     curl
     openssl
     vscode
     git
     lsd
     bat
     podman
     android-tools
     nodejs_20
     pyenv
  ];
 
  services.openssh = {
   enable = true;
   ports = [ 22 ];
   settings = {
     PasswordAuthentication = true;
     AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
     UseDns = true;
     X11Forwarding = false;
     PermitRootLogin = "prohibit-password"; 
   };
   extraConfig = ''
      AcceptEnv LANG LANGUAGE LC_*
      AcceptEnv GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL 
      AcceptEnv GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL 
      AcceptEnv GIT_EDITOR GIT_EXTERNAL_DIFF GIT_PAGER
    '';
  };

}
