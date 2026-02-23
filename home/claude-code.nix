{ pkgs, ... }:
{
  home.packages = [
    pkgs.claude-code
  ];

  programs.claude-code = {
    enable = true;
  }; # claude-code
}
