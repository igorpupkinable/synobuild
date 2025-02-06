docker build --tag synobuild .
docker run --name synobuild --privileged synobuild

Example:
CC=/usr/local/arm-marvell-linux-gnueabi/bin/arm-marvell-linuxgnueabi-gcc
LD=/usr/local/arm-marvell-linux-gnueabi/bin/arm-marvell-linuxgnueabi-ld
CFLAGS += -I/usr/local/arm-marvell-linux-gnueabi/arm-marvell-linuxgnueabi/libc/include
LDFLAGS += -L/usr/local/arm-marvell-linux-gnueabi/arm-marvell-linuxgnueabi/libc/lib

Actual:
Compilers: ld build_env/ds.<platform>-<version>/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-*
CFLAGS includes default path: ld /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/include/ 
LDFLAGS includes default libs: ld /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/lib/

CC=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-wrap-gcc
CXX=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-wrap-g++
LD=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-ld
CFLAGS='-mfloat-abi=hard -march=armv7-a+mp+sec -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=vfpv3 -DSYNOPLAT_F_ARMV7 -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_MARVELL_ARMADA38X -DSYNO_PLATFORM=MARVELL_ARMADA38X'
CXXFLAGS='-mfloat-abi=hard -march=armv7-a+mp+sec -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=vfpv3 -DSYNOPLAT_F_ARMV7 -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_MARVELL_ARMADA38X -DSYNO_PLATFORM=MARVELL_ARMADA38X'
LDFLAGS='-ldbus-1'

INFO: configure: running /bin/sh ./configure --disable-option-checking --prefix=/tmp/_nmap --host=armle-unknown-linux --target=armle-unknown-linux --build=i686-pc-linux --without-ndiff --without-zenmap --without-nping --without-ncat --without-nmap-update --without-liblua --with-libpcap=/usr/local build_alias=i686-pc-linux host_alias=armle-unknown-linux target_alias=armle-unknown-linux
OPTFLAGS='-mfloat-abi=hard -march=armv7-a+mp+sec -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=vfpv3 -DSYNOPLAT_F_ARMV7 -O2 -fno-diagnostics-show-caret -Wno-unused-local-typedefs -DBUILD_ARCH=32 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -DSDK_VER_MIN_REQUIRED=602 -DSYNO_MARVELL_ARMADA38X -DSYNO_PLATFORM=MARVELL_ARMADA38X -Wall -Wno-uninitialized'

##### Includes
###### synobuild-armhf
- /usr/include
- /usr/local/include
- /usr/arm-linux-gnueabihf/include
- /usr/lib/gcc-cross/arm-linux-gnueabihf/10/include
- /usr/lib/gcc/x86_64-linux-gnu/10/include
###### synobuild-focal/ipq806x
- /usr/include
- /usr/local/include
- /usr/syno/include
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/include
- /usr/local/arm-unknown-linux-gnueabi/include
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/include
- /usr/local/arm-unknown-linux-gnueabi/lib/gcc/arm-unknown-linux-gnueabi/10.3.0/include
- /usr/local/arm-unknown-linux-gnueabi/lib/gcc/arm-unknown-linux-gnueabi/10.3.0/install-tools/include

##### Shared libraries
###### synobuild-armhf
- /usr/lib
- /usr/local/lib
- /usr/arm-linux-gnueabihf/lib
- /usr/lib32
- /usr/libx32
###### synobuild-focal/ipq806x
- /usr/lib
- /usr/local/lib
- /usr/syno/lib
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/lib
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/lib
- /usr/local/arm-unknown-linux-gnueabi/lib
- /usr/lib32

```bash
file /path/binary.so
readelf -h /path/binary.so
readelf -A /path/binary.so
readelf -a /path/binary.so | grep Shared
readelf -a /path/binary.so | grep interpreter
```

### Manual packaging
[Сборка deb-пакета вручную](https://habr.com/ru/articles/130868/)
