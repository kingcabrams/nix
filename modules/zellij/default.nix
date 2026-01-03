{ pkgs, ... }:
{
    home.file.".config/zellij/layouts/default.kdl".source = pkgs.replaceVars ./layout.kdl { zjstatus = "${pkgs.zjstatus}/bin/zjstatus.wasm"; };
    programs.zellij.enable = true;
}
