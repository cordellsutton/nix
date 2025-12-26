
{ config, pkgs, ... }:

{



#automount drives
  fileSystems."/mnt/ssd" = {
   device = "/dev/disk/by-partuuid/5b472898-7c46-400d-8709-20658fc265be";
   fsType = "ext4";
   options = [ 
     "defaults"     
     "users" 
     "nofail" 
	 "exec"     
   ];
 };
#  fileSystems."/mnt/nvme" = {
#   device = "/dev/disk/by-partuuid/38078f44-01";
#   fsType = "ext4";
#   options = [ 
#     "defaults"     
#     "users" 
#     "nofail" 
#	 "rw"     
#	 "exec"     
#   ];
# };
}
