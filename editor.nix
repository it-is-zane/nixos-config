{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      programs.helix = {
        enable = true;
        settings = {
          theme = "ayu_dark";
          editor.cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          editor.end-of-line-diagnostics = "hint";
          editor.inline-diagnostics = {
            cursor-line = "hint";
            other-lines = "disable";
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

      systemd.user.sessionVariables.EDITOR = "hx";
      home.sessionVariables.EDITOR = "hx";
      programs.kitty.environment.EDITOR = "hx";
    }
  ];

  environment.systemPackages = [ pkgs.nixd ];
}
