SOURCE_DIR=//source
ToolChainDir=/usr/local/arm-unknown-linux-gnueabi
ToolChainSysRoot=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot
ConfigOpt="--host=armle-unknown-linux --target=armle-unknown-linux --build=i686-pc-linux"
HOST=arm-unknown-linux-gnueabi
ToolChainPrefix=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-
ToolChainInclude=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/include
ToolChainLib=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/lib
ARCH=arm
CFLAGS=-mhard-float -mfpu=vfpv3-d16 -march=armv7-a -mtune=cortex-a9 -DSYNO_QUALCOMM_COMMON -DSYNO_QUALCOMM_IPQ806X -DSYNOPLAT_F_ARMV7 -DSUPPORT_NSM -DSYNO_GCC630_COMPATIBLE -DSYNO_GCC730_COMPATIBLE -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -Wno-psabi -Wno-address-of-packed-member -fexceptions -I/usr/syno/include -DSYNO_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DSYNO_PLATFORM=QUALCOMM_IPQ806X -g -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_QUALCOMM_IPQ806X -DSYNO_PLATFORM=QUALCOMM_IPQ806X
CXXFLAGS=-mhard-float -mfpu=vfpv3-d16 -march=armv7-a -mtune=cortex-a9 -DSYNO_QUALCOMM_COMMON -DSYNO_QUALCOMM_IPQ806X -DSYNOPLAT_F_ARMV7 -DSUPPORT_NSM -DSYNO_GCC630_COMPATIBLE -DSYNO_GCC730_COMPATIBLE -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -Wno-psabi -Wno-address-of-packed-member -fexceptions -I/usr/syno/include -DSYNO_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DSYNO_PLATFORM=QUALCOMM_IPQ806X -g -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_QUALCOMM_IPQ806X -DSYNO_PLATFORM=QUALCOMM_IPQ806X
LDFLAGS=-L/usr/syno/lib
CC=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-wrap-gcc
CXX=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-wrap-g++
LD=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld
AR=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ar
# STRIP is decided by the env.mak.
STRIP_ORI=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-strip
SSTRIP=/usr/syno/bin/sstrip
RANLIB=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ranlib
NM=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-nm
READELF=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-readelf
DSM_BUILD_NUM=9346
DSM_SHLIB_MAJOR=1
DSM_SHLIB_MINOR=3
SynoDir=/usr
SynoIncludeDir=/usr/include
SynoLibDir=/usr/lib
SynoBinDir=/usr/bin
BUILD_ARCH=32
SysRootPrefix=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr
SysRootInclude=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/include
SysRootLib=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/lib
PLATFORM_FAMILY=SYNOPLAT_F_ARMV7
GOROOT=/usr/lib/go
