{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.rust;

in

{
  options = with lib; {
    my.modules.rust = {
      enable = mkEnableOption ''
        Whether to enable rust module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        env = {
          RUSTUP_DIST_SERVER = "https://rsproxy.cn";
          RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup";
        };
        user = {
          packages = with pkgs; [
            (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
            carnix
            rust-analyzer
            rls

            #cargo-bloat
            #rust-analyzer-unwrapped
            # rustup rustc cargo
            #cargo-watch
            #evcxr
            # cargo-msrv
            # cargo-deny
            # cargo-expand
            # cargo-bloat
            # cargo-fuzz
            # gitlint

            (writeScriptBin "rust-doc" ''
              #! ${stdenv.shell} -e
              exec ${pkgs.firefox-mac}/Applications/Firefox.app/Contents/MacOS/firefox "${rustc.doc}/share/doc/rust/html/index.html"
            '')
          ];
        };
      };

    };
}
