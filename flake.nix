{
  description = "Meson C++ Example with modularized subprojects";

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    inherit (pkgs) meson stdenv;
  in
    rec {
      lib = rec {
        a = stdenv.mkDerivation {
          name = "liba";
          buildInputs = [ c d ];
          nativeBuildInputs = [ meson ];
          src = self + "/a";
        };

        b = stdenv.mkDerivation {
          name = "libb";
          nativeBuildInputs = [ meson ];
          src = self + "/b";
        };

        c = stdenv.mkDerivation {
          name = "libc";
          nativeBuildInputs = [ meson ];
          src = self + "/c";
        };

        d = stdenv.mkDerivation {
          name = "libd";
          nativeBuildInputs = [ meson ];
          src = self + "/d";
        };
      };

      myapp = stdenv.mkDerivation {
        name = "myapp";
        buildInputs = with lib; [ a b c d ];
        nativeBuildInputs = [ meson ];
        src = self + "/app";
      };

      defaultPackage.x86_64-linux = myapp;
    };
}
