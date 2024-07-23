{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
      editor.lsp.display-messages = true;
    };
  };
}
