{ pkgs ? import <nixpkgs> { } }:
let inherit (pkgs) lib;
in pkgs.stdenv.mkDerivation {
  name = "batfetch";
  src = ./src;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/batfetch $out/bin/batfetch
  '';

  meta = with lib; {
    description = "Display battery info in a fetch design.";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ niksingh710 ];
    mainProgram = "batfetch";
  };
}
