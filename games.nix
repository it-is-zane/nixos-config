{
  config,
  pkgs,
  inputs,
  username,
  ...
}:
{
  users.users.${username} = {
    packages = with pkgs; [ beyond-all-reason ];
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/e3d0a5b0-792e-4edc-b96f-37f67314c71a";
    fsType = "ext4";
    options = [
      "rw"
      "exec"
      "nofail"
    ];
  };

  services.scx.enable = true;
  services.scx.scheduler = "scx_lavd";
}
