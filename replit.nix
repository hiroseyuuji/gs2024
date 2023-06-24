{ pkgs }: {
  deps = [
    pkgs.busybox
    pkgs.qrencode.bin
    pkgs.texlive.combined.scheme-full
    pkgs.texlive.combined.scheme-full
    pkgs.ruby_3_1
    pkgs.rubyPackages_3_1.solargraph
  ];
}
