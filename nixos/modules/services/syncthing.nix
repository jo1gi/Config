{ config, lib, ... }:

let
  # Data
  devices = {
    desktop = {
      name = "Desktop";
      id = "GEPTKFT-6XWFWOU-JY25OBM-VNBNIVJ-UKQRB62-MIRBKAV-XKTX4KK-L5EGWQ3";
      introducer = false;
    };
    lenovo = {
      name = "Lenovo";
      id = "ISSSVTJ-4KOFJKX-3AZRX5U-DRNUPTN-QVQXQH6-MRAJXAJ-WFLBBIX-67BT2AF";
      introducer = false;
    };
    oneplus = {
      name = "Oneplus";
      id = "AUJG6NN-WXQWUZA-SJ36776-Y4V5T7N-ZVPMPZJ-XDIAZ5Y-UNITZVV-CCDGOQM";
      introducer = true;
    };
    pi = {
      name = "Pi";
      id = "IV3WLJ5-4MUT7TY-HCRQXIE-VTT2YM4-JYRH645-X7G7CFR-7LN6WE6-R55VEAN";
      introducer = true;
    };
  };
  folders = {
    "Books" = {
      path = "/home/jo1gi/Books";
      devices = [ "desktop" "lenovo" "oneplus" "pi" ];
    };
    "Documents" = {
      path = "/home/jo1gi/Documents";
      devices = [ "desktop" "lenovo" "oneplus" "pi" ];
    };
    "Music" = {
      path = "/home/jo1gi/Music";
      devices = [ "desktop" "lenovo" "oneplus" "pi" ];
    };
    "Game Saves" = {
      path = "/home/jo1gi/Games/Saves";
      devices = [ "desktop" "lenovo" "pi" ];
    };
    # "School" = {
    #   path = "/home/jo1gi/Documents/School";
    #   devices = [ "desktop" "lenovo" "oneplus" "pi" ];
    # };
    "Images" = {
      path = "/home/jo1gi/Images";
      devices = [ "desktop" "lenovo" "oneplus" "pi" ];
    };
  };
  # Functions
  filterDevices = devicename: n: v: devicename != n;
  filterFolders = devicename: n: v: builtins.any (x: devicename == x) v.devices;
  fixFolderDevices = devicename: n: v: {
    path = v.path;
    devices = builtins.filter (x: devicename != x) v.devices;
  };
  # Other
  name = config.networking.hostName;

in
  {
    services.syncthing = {
      enable = true;
      user = "jo1gi";
      configDir = "/home/jo1gi/.config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      extraOptions = {
        gui = {
          theme = "dark";
        };
      };
      devices = lib.attrsets.filterAttrs (filterDevices name) devices;
      folders = lib.attrsets.mapAttrs
        (fixFolderDevices name)
        (lib.attrsets.filterAttrs (filterFolders name) folders);
    };
  }
