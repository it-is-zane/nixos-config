{
  config,
  pkgs,
  inputs,
  ...
}:
{
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
      # ../home-manager/base.nix
      # ../home-manager/user.nix
      # ../home-manager/programmer.nix
      ../helix.nix
      ../git.nix
      ../plasma.nix
      ../kitty.nix
    ];

    home.packages = with pkgs; [
      bottom
      ripgrep
      tmux
      pkgsRocm.blender
      discord-ptb
      firefox
    ];

    systemd.user.sessionVariables.EDITOR = "hx";
    home.sessionVariables.EDITOR = "hx";
    programs.kitty.environment.EDITOR = "hx";
  };

}
