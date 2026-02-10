{
  config,
  pkgs,
  inputs,
  ...
}:
{
  users.users.games = {
    isNormalUser = true;
    description = "Steam Isolation";
    extraGroups = [
      "networkmanager"
      # "wheel"
    ];
    packages = with pkgs; [ ];
  };

  home-manager.users.games = {
    home.stateVersion = "25.11";
    imports = [
      ../plasma.nix
      ../kitty.nix
    ];

    home.packages = with pkgs; [
      discord-ptb
      firefox
    ];
  };

  programs.steam = {
    enable = true;
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
