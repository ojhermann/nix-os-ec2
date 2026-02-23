{ pkgs, ... }:
{
  home.packages = [
    pkgs.zellij
  ];

  programs.zellij = {
    enable = true;

    settings = {
      default_shell = "zsh";
      theme = "kanagawa";
    };
  };
}
