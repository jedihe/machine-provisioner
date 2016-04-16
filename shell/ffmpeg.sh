#!/bin/bash

COMMON_HOME="/home/common"

sudo apt-get update
sudo apt-get -y install autoconf automake build-essential libass-dev libgpac-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev \
  libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev
mkdir -p $COMMON_HOME/src/ffmpeg

cd $COMMON_HOME/src/ffmpeg
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure --prefix="$COMMON_HOME/builds" --bindir="$COMMON_HOME/bin"
make -j6
make install
make distclean
export "PATH=$PATH:$COMMON_HOME/bin"

cd $COMMON_HOME/src/ffmpeg
wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar xjvf last_x264.tar.bz2
cd x264-snapshot*
./configure --prefix="$COMMON_HOME/builds" --bindir="$COMMON_HOME/bin" --enable-static
make -j6
make install
make distclean

cd $COMMON_HOME/src/ffmpeg
wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
unzip fdk-aac.zip
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="$COMMON_HOME/builds" --disable-shared
make -j6
make install
make distclean

sudo apt-get install -y libmp3lame-dev

cd $COMMON_HOME/src/ffmpeg
wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
tar xjvf libvpx-v1.3.0.tar.bz2
cd libvpx-v1.3.0
./configure --prefix="$COMMON_HOME/builds" --disable-examples
make -j6
make install
make clean

cd $COMMON_HOME/src/ffmpeg
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PKG_CONFIG_PATH="$COMMON_HOME/builds/lib/pkgconfig"
export PKG_CONFIG_PATH
./configure --prefix="$COMMON_HOME/builds" --extra-cflags="-I$COMMON_HOME/builds/include" \
   --extra-ldflags="-L$COMMON_HOME/builds/lib" --bindir="$COMMON_HOME/bin" --extra-libs=-ldl --enable-gpl \
   --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libtheora \
   --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-x11grab
make -j6
make install
make distclean
hash -r

