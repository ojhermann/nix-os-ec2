{ pkgs, ... }:
{
  home.packages = [
    pkgs.helix
    # bash
    pkgs.bash-language-server
    pkgs.shfmt
    # kdl
    pkgs.kdlfmt
    # nix
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
  ];

  programs.helix = {
    enable = true;

    settings = {
      theme = "default";
      editor.true-color = true;
      editor.file-picker.hidden = false;
      editor.lsp.display-inlay-hints = true;
    }; # settings

    languages = {
      language = [
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "shfmt";
          };
        } # bash
        {
          name = "kdl";
          auto-format = true;
          formatter = {
            command = "kdlfmt";
            args = [ "format" ];
          };
        } # kdl
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        } # nix
      ]; # language
    }; # languages
  };
}
