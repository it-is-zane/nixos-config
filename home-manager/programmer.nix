{ pkgs, ... }:
let
  python = pkgs.python3.withPackages (
    python-pkgs: with python-pkgs; [
      numpy
    ]
  );
in
{
  programs.helix = {
    enable = true;
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
        formatter.command = pkgs.lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
  };
  home.packages = with pkgs; [
    rustup
    python
    ty
    ruff
    gcc
  ];
  home.sessionVariables = {
    PYTHONPATH = "${python}/${python.sitePackages}";
  };
}
