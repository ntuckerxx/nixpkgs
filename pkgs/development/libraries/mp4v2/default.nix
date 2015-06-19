{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mp4v2-2.0.0";

  src = fetchurl {
    url = "http://mp4v2.googlecode.com/files/${name}.tar.bz2";
    sha1 = "193260cfb7201e6ec250137bcca1468d4d20e2f0";
  };

  # `faac' expects `mp4.h'.
  postInstall = "ln -s mp4v2/mp4v2.h $out/include/mp4.h";

  meta = {
    homepage = http://code.google.com/p/mp4v2;
    maintainers = [ stdenv.lib.maintainers.urkud ];
    platforms = stdenv.lib.platforms.all;
  };
}
