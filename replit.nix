{ pkgs }: {
    deps = [
        pkgs.qrencode.bin
        pkgs.wget
        pkgs.unzip
        pkgs.libuuid.bin
    ];
}