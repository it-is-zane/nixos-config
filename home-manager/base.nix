{ pkgs, ... }:
{
  home.stateVersion = "25.11";

  systemd.user.sessionVariables.EDITOR = "hx";

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "vim_dark_high_contrast";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = pkgs.lib.getExe pkgs.nixfmt;
      }
    ];
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Zane Gant";
        email = "zane.gant@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    bottom
  ];
}
