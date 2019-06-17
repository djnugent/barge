#!/bin/bash
VERSION=4.1.0

# Install prereqs
apt-get install -y \
            libjpeg8-dev \
            libgtk2.0-dev \
            libv4l-dev      \
            libatlas-base-dev \
            gfortran        \
            libhdf5-serial-dev \
            libswscale-dev \
            libtbb2 \
            libtbb-dev \
            libjpeg-dev \
            libpng-dev \
            libtiff-dev \
            libavformat-dev \
            libpq-dev \
            libxine2-dev \
            libglew-dev \
            libtiff5-dev \
            zlib1g-dev \
            libpng12-dev \
            libjasper-dev \
            libavcodec-dev \
            libavutil-dev \
            libpostproc-dev \
            libswscale-dev \
            libeigen3-dev \
            libtbb-dev \
            qt4-default \


# Clone release
mkdir /tmp/opencv
cd /tmp/opencv
wget -O opencv.zip https://github.com/Itseez/opencv/archive/$VERSION.zip -q
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/$VERSION.zip -q
unzip opencv.zip
unzip opencv_contrib.zip

# Build
cd opencv-$VERSION
mkdir build
cd build

cmake -DBUILD_TIFF=ON \
   -DBUILD_opencv_java=OFF \
   -DENABLE_FAST_MATH=1 \
   -DCPU_DISPATCH=AVX,AVX2 \
   -DWITH_IPP=ON \
   -DWITH_TBB=ON \
   -DFORCE_VTK=ON \
   -DWITH_EIGEN=ON \
   -DWITH_OPENGL=ON \
   -DWITH_OPENCL=ON \
   -DWITH_QT=ON \
   -DWITH_V4L=ON \
   -DWITH_XINE=ON \
   -DWITH_GDAL=ON \
   -DCMAKE_BUILD_TYPE=RELEASE \
   -DCMAKE_INSTALL_PREFIX=/usr/local \
   -DINSTALL_PYTHON_EXAMPLES=ON \
   -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$VERSION/modules \
   -DBUILD_EXAMPLES=ON \
    ..

  #-DENABLE_PRECOMPILED_HEADERS=OFF \
  #-DWITH_1394=OFF \
  #-DWITH_FFMPEG=OFF \
  #-DBUILD_PROTOBUF=OFF \
  #-DBUILD_TESTS=OFF \
  #-DBUILD_PERF_TESTS=OFF \

   #-DCUDA_FAST_MATH=1 \
   #-DWITH_CUBLAS=1 \
   #-DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.0 \
   #-DWITH_CUDA=ON \
   #-DBUILD_SHARED_LIBS=OFF \
   #-DCUDA_ARCH_BIN='3.0 3.5 5.0 6.0 6.2 6.1 7.0' \
   #-DCUDA_ARCH_PTX="" \

make -j12 install
ldconfig

# Clean up
rm -rf /tmp/opencv
