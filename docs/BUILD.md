# Git
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git#_installing_from_source
```bash
make configure
./configure --prefix=/home/ubuntu/source/x86_64/rootfs/git/usr/local --without-expat --without-tcltk CC=/usr/bin/x86_64-linux-gnu-gcc-11 CPP=/usr/bin/x86_64-linux-gnu-cpp-11 CFLAGS='-g0 -O2 -s -Wno-unused-local-typedefs'
make NO_GETTEXT=YesPlease all
make NO_GETTEXT=YesPlease install
```

# libunistring
https://www.gnu.org/software/libunistring/
```bash
./gitsub.sh pull

with debug_info, not stripped
```

# concurrencykit/ck
https://github.com/concurrencykit/ck

Fix configure file:
```bash
640,641c640
< #COMPILER=`./.1 2> /dev/null`
< COMPILER=gcc
---
> COMPILER=`./.1 2> /dev/null`

```
```bash
export CC=/usr/bin/arm-linux-gnueabihf-gcc
export CFLAGS='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs'
./configure --prefix=/home/ubuntu/projects/rootfs/ck/usr/local --cores=2 --disable-sse --profile=arm --platform=armv7l
make
make install
unset CC
unset CFLAGS
```

# LuaJIT/LuaJIT
https://github.com/LuaJIT/LuaJIT
```bash
make PREFIX=/home/ubuntu/projects/rootfs/LuaJIT/usr/local HOST_CC=i686-linux-gnu-gcc CROSS=arm-linux-gnueabihf- TARGET_CFLAGS="-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs"

make PREFIX=/home/ubuntu/source/ipq806x/rootfs/LuaJIT/usr/local HOST_CC="gcc -m32" HOST_CFLAGS="-I/usr/include/" CROSS=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi- TARGET_CFLAGS="-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs"

make install PREFIX=/home/ubuntu/projects/rootfs/LuaJIT/usr/local
```

# akopytov/sysbench
https://github.com/akopytov/sysbench
##### Skip MySQL
```bash
sudo apt install make automake libtool pkg-config libaio-dev
./autogen.sh
./configure --prefix=/home/ubuntu/projects/rootfs/sysbench/usr/local --with-system-luajit --with-system-ck --host=arm-linux-gnueabihf --without-mysql --with-gcc-arch=armv7-a CC=arm-linux-gnueabihf-gcc CFLAGS='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs -Wl,-rpath=/usr/local/lib' PKG_CONFIG_PATH='/home/ubuntu/projects/rootfs/LuaJIT/usr/local/lib/pkgconfig:/home/ubuntu/projects/rootfs/ck/usr/local/lib/pkgconfig'

./configure --prefix=/home/ubuntu/source/ipq806x/rootfs/sysbench/usr/local --with-system-luajit --with-system-ck --host=arm-unknown-linux-gnueabi --without-mysql --with-gcc-arch=armv7-a CC=/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc --with-sysroot=/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot CFLAGS='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs -Wl,-rpath=/usr/local/lib' PKG_CONFIG_PATH='/home/ubuntu/source/ipq806x/rootfs/LuaJIT/usr/local/lib/pkgconfig:/home/ubuntu/source/ipq806x/rootfs/ck/usr/local/lib/pkgconfig'

make
make install
```

##### Include MySQL and PostgreSQL
```bash
./configure --prefix=/home/ubuntu/projects/rootfs/sysbench/usr/local --with-system-luajit --with-system-ck --host=arm-linux-gnueabihf --with-mysql --with-pgsql --with-gcc-arch=armv7-a --with-mysql-includes=/usr/include/mysql --with-mysql-libs=/usr/lib/arm-linux-gnueabihf --with-pgsql-includes=/usr/include/postgresql --with-pgsql-libs=/usr/lib/arm-linux-gnueabihf CC=arm-linux-gnueabihf-gcc CFLAGS='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -Wno-unused-local-typedefs -Wl,-rpath=/usr/local/lib' PKG_CONFIG_PATH='/home/ubuntu/projects/rootfs/LuaJIT/usr/local/lib/pkgconfig:/home/ubuntu/projects/rootfs/ck/usr/local/lib/pkgconfig:/usr/lib/arm-linux-gnueabihf/pkgconfig'f
```
