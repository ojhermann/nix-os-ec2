{ lib, pkgs, ... }:
let
  scriptsDir = ./scripts;
  scriptFiles = builtins.readDir scriptsDir;
  createScriptBin =
    name: type:
    let
      scriptContent = builtins.readFile (scriptsDir + "/${name}");
      binName = lib.strings.removeSuffix ".sh" name;
    in
    if type == "regular" && lib.strings.hasSuffix ".sh" name then
      pkgs.writeShellScriptBin binName scriptContent
    else
      null;
  scriptBins = lib.concatMap (
    n:
    let
      bin = createScriptBin n scriptFiles.${n};
    in
    if bin == null then [ ] else [ bin ]
  ) (builtins.attrNames scriptFiles);
in
{
  home.packages = [ pkgs.zsh ] ++ scriptBins; # home.packages

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
      dev-sum = "git status && tree";
      grep = "grep -i --color=auto";
      ls = "ls --color=auto";
      switch = "sudo nixos-rebuild switch";
      tree = "tree -C";
    }; # shellAliases
  }; # programs.zsh
}
