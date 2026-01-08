{ 
  fileSystems."/mnt/Things" = {
    device = "dev/disk/by-uuid/f8196089-db9a-414b-9f20-2207da626d92";
    fsType = "btrfs";
    options = [ "defaults" "nofail" ];
  };
}