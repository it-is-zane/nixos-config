{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../niri.nix
    ../vr.nix
    ../zen.nix
    ../bar.nix
    # ../star-citizen.nix
  ];
  users.users.zaneg = {
    isNormalUser = true;
    description = "Zane Gant";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  home-manager.users.zaneg = {
    home.stateVersion = "25.11";
    imports = [
      ../helix.nix
      ../git.nix
      # ../plasma.nix
      ../kitty.nix
    ];

    home.packages = with pkgs; [
      bottom
      ripgrep
      tmux
      pkgsRocm.blender
      discord-ptb
      firefox
      furnace

      r2modman
    ];

    systemd.user.sessionVariables.EDITOR = "hx";
    home.sessionVariables.EDITOR = "hx";
    programs.kitty.environment.EDITOR = "hx";

    programs.fish.enable = true;
    xdg.configFile."fish/config.fish".force = true;
  };

  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
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
