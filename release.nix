let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  inherit (pkgs) cmake meson ninja pkg-config stdenv;
in

rec {
  lib = rec {
    a = stdenv.mkDerivation {
      name = "liba";
      buildInputs = [ c d ];
      nativeBuildInputs = [ meson ninja pkg-config ];
      src = ./a;
    };

    b = stdenv.mkDerivation {
      name = "libb";
      nativeBuildInputs = [ meson ninja ];
      src = ./b;
    };

    c = stdenv.mkDerivation {
      name = "libc";
      nativeBuildInputs = [ meson ninja cmake ];
      src = ./c;
    };

    d = stdenv.mkDerivation {
      name = "libd";
      nativeBuildInputs = [ meson ninja ];
      src = ./d;
    };
  };

  myapp = stdenv.mkDerivation {
    name = "myapp";
    buildInputs = with lib; [ a b c d ];
    nativeBuildInputs = [ meson ninja pkg-config ];
    src = ./app;
  };
}
