SOURCE_DIR=//toolkit/source
ToolChainDir=/usr/local/arm-unknown-linux-gnueabi
ToolChainSysRoot=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot
ConfigOpt="--host=armle-unknown-linux --target=armle-unknown-linux --build=i686-pc-linux"
HOST=arm-unknown-linux-gnueabi
ToolChainPrefix=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-
ToolChainInclude=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/include
ToolChainLib=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/lib
ARCH=arm
# TODO: CFLAGS needs -I/usr/local/arm-marvell-linux-gnueabi/arm-marvell-linuxgnueabi/sysroot/include
CFLAGS=-mfloat-abi=hard -march=armv7-a+mp+sec -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=vfpv3 -DSYNOPLAT_F_ARMV7 -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_MARVELL_ARMADA38X -DSYNO_PLATFORM=MARVELL_ARMADA38X
CXXFLAGS=-mfloat-abi=hard -march=armv7-a+mp+sec -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=vfpv3 -DSYNOPLAT_F_ARMV7 -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_MARVELL_ARMADA38X -DSYNO_PLATFORM=MARVELL_ARMADA38X
LDFLAGS=-L/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/lib
CC=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc
CXX=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-g++
LD=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld
AR=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ar
STRIP_ORI=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-strip
#SSTRIP=/usr/syno/bin/sstrip
RANLIB=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ranlib
NM=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-nm
READELF=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-readelf
DSM_BUILD_NUM=63133
DSM_SHLIB_MAJOR=7
DSM_SHLIB_MINOR=2
SynoDir=/usr
SynoIncludeDir=/usr/include
SynoLibDir=/usr/lib
SynoBinDir=/usr/bin
BUILD_ARCH=32
SysRootPrefix=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr
SysRootInclude=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/include
SysRootLib=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/lib
PLATFORM_FAMILY=SYNOPLAT_F_ARMV7
#GOROOT=/usr/lib/go
