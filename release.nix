let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  inherit (pkgs) cmake meson ninja pkg-config stdenv;
in

rec {
  lib = rec {
    a = stdenv.mkDerivation {
      name = "liba";
      propagatedBuildInputs = [ ac ad ];
      nativeBuildInputs = [ meson ninja pkg-config ];
      src = ./a;
      outputs = [ "out" "dev" ];
    };

    b = stdenv.mkDerivation {
      name = "libb";
      nativeBuildInputs = [ meson ninja ];
      src = ./b;
    };

    ac = stdenv.mkDerivation {
      name = "libac";
      nativeBuildInputs = [ meson ninja cmake ];
      src = ./ac;
    };

    ad = stdenv.mkDerivation {
      name = "libad";
      nativeBuildInputs = [ meson ninja ];
      src = ./ad;
    };
  };

  app = stdenv.mkDerivation {
    name = "myapp";
    buildInputs = with lib; [ a b ];
    nativeBuildInputs = [ pkgs.breakpointHook meson ninja pkg-config ];
    src = ./app;
  };
}
