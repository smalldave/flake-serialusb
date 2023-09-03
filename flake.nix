{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    packages."x86_64-linux" = with nixpkgs.legacyPackages."x86_64-linux"; {
      default = stdenv.mkDerivation {
        name = "serialusb";
        src = fetchFromGitHub {
          owner = "matlo";
          repo = "serialusb";
          rev = "v0.7";
          sha256 = "Uhv6cdvn5Wr90SmuBlulW9UdwB3Zw2wBlX3C3gT19+8=";
        };
        sourceRoot = "source/sw";
        buildInputs = [ pkgs.libusb1 ];
        installPhase = ''
          mkdir -p $out/bin
          cp serialusb $out/bin/serialusb
          cp serialusb-capture.sh $out/bin/serialusb-capture.sh
        '';
      };
    };
  };
#   devShell = pkgs.mkShell { serialusb = serialusb; }; 
}
