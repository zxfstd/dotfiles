{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.node;

in

{
  options = with lib; {
    my.modules.node = {
      enable = mkEnableOption ''
        Whether to enable nodejs module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        env = {
          NODE_HOME = "${pkgs.nodejs-18_x}";
        };
        # TODO gatsby-cli
        # TODO prettier-eslint-cli
        user = {
          packages = with pkgs; [
            nodejs-18_x
            nodePackages.npm-check-updates
            nodePackages.create-react-app
            nodePackages.eslint
            nodePackages.eslint_d
            nodePackages.javascript-typescript-langserver
            nodePackages.prettier
            nodePackages.typescript
            nodePackages.typescript-language-server
            nodePackages.webpack-cli
            nodePackages."@vue/cli"
            nodePackages.js-beautify
            #nodePackages.lerna
            #nodePackages.prisma
            nodePackages."@prisma/language-server"
            nodePackages.vscode-langservers-extracted
            # nodePackages.bash-language-server
            # nodePackages.dockerfile-language-server-nodejs
            # nodePackages.yaml-language-server
            # nodePackages.vls
            # nodePackages.vim-language-server
            # nodePackages.pyright
            # nodePackages.svelte-language-server
            # haskellPackages.dhall-lsp-server
            # sumneko-lua-language-server
            yarn
          ];
        };
        hm = {
          file."npmrc".text = "
          registry=https://registry.npmmirror.com
          ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
          ELECTRON_CUSTOM_DIR=16.0.5
          disturl=https://npmmirror.com/dist/
          ";
        };
      };

    };
}
