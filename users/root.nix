{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home-manager.users.root = {
    home.stateVersion = "25.11";
    imports = [
      # ../home-manager/base.nix
      ../helix.nix
      ../git.nix
    ];

    home.packages = with pkgs; [
      bottom
      ripgrep
      tmux
    ];

    systemd.user.sessionVariables.EDITOR = "hx";
    home.sessionVariables.EDITOR = "hx";
    programs.kitty.environment.EDITOR = "hx";
  };
}
