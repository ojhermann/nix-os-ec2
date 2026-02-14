{ pkgs, ... }:
{
  home.packages = [
    pkgs.zsh
  ]; # home.packages

  programs.zsh = {
    enable = true;

    enableCompletion = true;

    initContent = ''
      prompt off
      PS1="%F{yellow}%n@%m in %~ > %f"
    ''; # initContent

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    shellAliases = {
      grep = "grep -i --color=auto";
      ls = "ls --color=auto";
      tree = "tree -C";
    }; # shellAliases
  }; # programs.zsh
}
