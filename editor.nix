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
          editor = {
            cursor-shape = {
              normal = "block";
              insert = "bar";
              select = "underline";
            };
            end-of-line-diagnostics = "hint";
            inline-diagnostics = {
              cursor-line = "hint";
              other-lines = "disable";
            };
            lsp.display-inlay-hints = true;
            lsp.display-progress-messages = true;
          };
        };
        languages = {
          language-server = {
            typos = {
              command = "${pkgs.lib.getExe pkgs.typos-lsp}";
            };
          };
          language = [
            {
              name = "nix";
              auto-format = true;
              formatter.command = pkgs.lib.getExe pkgs.nixfmt;
            }
          ];
        };

      };

      systemd.user.sessionVariables.EDITOR = "hx";
      home.sessionVariables.EDITOR = "hx";
      programs.kitty.environment.EDITOR = "hx";
    }
  ];

  environment.systemPackages = [ pkgs.nixd ];
}
