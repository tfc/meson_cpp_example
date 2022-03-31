let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {};
  inherit (pkgs) meson ninja pkg-config stdenv;
in

rec {
  lib = rec {
    a = stdenv.mkDerivation {
      name = "liba";
      # the pkg-config files will know that they need ac and ad
      # but they can't refer to the nix store alone as pkg-config would
      # violate its own interface.
      # So we propagate this further through the nix layer
      propagatedBuildInputs = [ ac ad ];
      nativeBuildInputs = [ meson ninja pkg-config ];
      src = ./a;
    };

    ac = stdenv.mkDerivation {
      name = "libac";
      nativeBuildInputs = [ meson ninja ];
      src = ./ac;
    };

    ad = stdenv.mkDerivation {
      name = "libad";
      nativeBuildInputs = [ meson ninja ];
      src = ./ad;
    };

    b = stdenv.mkDerivation {
      name = "libb";
      nativeBuildInputs = [ meson ninja ];
      src = ./b;
    };
  };

  app = stdenv.mkDerivation {
    name = "myapp";
    buildInputs = with lib; [ a b ];
    nativeBuildInputs = [ meson ninja pkg-config ];
    src = ./app;
  };
}
