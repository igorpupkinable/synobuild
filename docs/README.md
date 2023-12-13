docker build --tag synobuild .
docker run --name synobuild --privileged synobuild

All pre-built binaries, headers, and libraries are under cross compiler sysroot in chroot environment.
Sysroot is the default search path of a compiler, so **you do not need to provide -I or -L to CFLAGS or LDFLAGS**.
If gcc cannot find header or library from the given path, it will then search `sysroot/usr/{lib,include}`.
`/toolkit/build_env/ds.<platform>-<version>/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/`

### Manual compilation
```shell
$ lxc start synobuild-vm
$ lxc exec synobuild-vm --force-interactive --user 1000 -- /bin/bash
$ schroot -c armada38x
$ export LANG=en_US.UTF-8
$ cd /source/nano-7.2/
$ ./configure --with-platform-specific-flags WITH_PLATFORM_SPECIFIC=VARIABLES
$ make
$ make DESTDIR=/build/armada38x/nano-7.2 install
$ exit
To detach from the console, press: <ctrl>+a q
$ lxc file pull synobuild-vm/home/ubuntu/build/ ~/projects/synobuild/ --recursive
$ lxc stop synobuild-vm
```

### Compilation settings
#### Pre-built headers and projects
Synology toolkit environment has included selected prebuild projects. You can **enter the chroot** and use following commands to check if needed header or project is provided by toolkit.
```bash
(armada38x)ubuntu@synobuild-vm:~$ dpkg -l  # List all dpkg projects.
(armada38x)ubuntu@synobuild-vm:~$ dpkg -L {project dev} # List project install files, e.g `dpkg -L synousb-armada38x-dev`
(armada38x)ubuntu@synobuild-vm:~$ dpkg -S {header/library pattern} # Search header/library pattern, e.g. `dpkg -S libexif`
```
Some open source projects require to use other projects' cross compiled product while building their own.
For example, _python_ needs _libffi_ and _zlib_ during configuration stage. We need to provide those two project before building _python_.
You can install the cross compiled product into the destination you want in build script.
Please refer to [Compile Open Source Project: nmap](https://help.synology.com/developer-guide/examples/compile_nmap.html) for more information.

More info can be found [here](https://help.synology.com/developer-guide/toolkit/build_stage.html).

#### Variables
Most of variables can be found in `/toolkit/build_env/ds.${platform}-${version}/{env.mak,env32/64.mak}`.

- CC: path of gcc cross compiler.
- CXX: path of g++ cross compiler.
- LD: path of cross compiler linker.
- CFLAGS: global cflags includes.
- AR: path of cross compiler ar.
- NM: path of cross compiler nm.
- STRIP: path of cross compiler strip.
- RANLIB: path of cross compiler ranlib.
- OBJDUMP: path of cross compiler objdump.
- LDFLAGS: global ldflags includes.
- ConfigOpt: options for configure.
- ARCH: processor architecture.
- SYNO_PLATFORM: Synology platform.
- DSM_SHLIB_MAJOR: major number of DSM (integer).
- DSM_SHLIB_MINOR: minor number of DSM (integer).
- DSM_SHLIB_NUM: build number of DSM (integer).
- ToolChainSysRoot: cross compiler sysroot path.
- SysRootPrefix: cross compiler sysroot concat with prefix /usr.
- SysRootInclude: cross compiler sysroot concat with include_dir /usr/include.
- SysRootLib: cross compiler sysroot concat with lib_dir /usr/lib.

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
###### synobuild-vm/ipq806x
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
###### synobuild-vm/ipq806x
- /usr/lib
- /usr/local/lib
- /usr/syno/lib
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/lib
- /usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/lib
- /usr/local/arm-unknown-linux-gnueabi/lib
- /usr/lib32

##### NAS and router shared options
```bash
-march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9

CFLAGS='-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DBUILD_ARCH=32 -DSDK_VER_MIN_REQUIRED=602 -DSYNOPLAT_F_ARMV7 -fno-diagnostics-show-caret -g0 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mtune=cortex-a9 -O2 -s -Wno-unused-local-typedefs'
```
https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
https://wiki.debian.org/ArmHardFloatPort/VfpComparison#FPU

### Supported GLIBC versions
```bash
strings /lib/libc.so.6 | grep GLIBC
```
- GLIBC_2.4
- GLIBC_2.5
- GLIBC_2.6
- GLIBC_2.7
- GLIBC_2.8
- GLIBC_2.9
- GLIBC_2.10
- GLIBC_2.11
- GLIBC_2.12
- GLIBC_2.13
- GLIBC_2.14
- GLIBC_2.15
- GLIBC_2.16
- GLIBC_2.17
- GLIBC_2.18
- GLIBC_2.22
- GLIBC_2.23
- GLIBC_2.24
- GLIBC_2.25
- GLIBC_2.26
- GLIBC_2.27
- GLIBC_2.28
- GLIBC_2.29
- GLIBC_2.30
- GLIBC_2.32
```bash
strings /lib/libstdc++.so.6 | grep GLIBC
```
- GLIBCXX_3.4
- GLIBCXX_3.4.1
- GLIBCXX_3.4.2
- GLIBCXX_3.4.3
- GLIBCXX_3.4.4
- GLIBCXX_3.4.5
- GLIBCXX_3.4.6
- GLIBCXX_3.4.7
- GLIBCXX_3.4.8
- GLIBCXX_3.4.9
- GLIBCXX_3.4.10
- GLIBCXX_3.4.11
- GLIBCXX_3.4.12
- GLIBCXX_3.4.13
- GLIBCXX_3.4.14
- GLIBCXX_3.4.15
- GLIBCXX_3.4.16
- GLIBCXX_3.4.17
- GLIBCXX_3.4.18
- GLIBCXX_3.4.19
- GLIBCXX_3.4.20
- GLIBCXX_3.4.21
- GLIBCXX_3.4.22
- GLIBCXX_3.4.23
- GLIBCXX_3.4.24
- GLIBCXX_3.4.25
- GLIBCXX_3.4.26
- GLIBCXX_3.4.27
- GLIBCXX_3.4.28
- GLIBC_2.4
- GLIBC_2.29
- GLIBC_2.6
- GLIBC_2.18
- GLIBC_2.16
- GLIBC_2.17

```bash
file /path/binary.so
readelf -h /path/binary.so
readelf -A /path/binary.so
readelf -a /path/binary.so | grep Shared
readelf -a /path/binary.so | grep interpreter
```

### Manual packaging
[Сборка deb-пакета вручную](https://habr.com/ru/articles/130868/)

### NAS Marvel Armada 385 vs router Qualcomm Krait IPQ8065 CPU comparison
ARMv7 CPU (v7l) armhf

Router: vfpv4 idiva idivt vfpd32
NAS: swp

Common flags and attributes supported by hardware:
- edsp
- fastmult
- half
- neon
- thumb
- tls
- vfp
- vfpv3

```bash
find /lib/ -name '*.so.*' -type f -exec readelf -A {} \; | grep Tag_FP_arch
find /lib/ -name '*.so.*' -type f -exec readelf -A {} \; | grep Tag_ABI_VFP_args
find /lib/ -name '*.so.*' -type f -exec readelf -h {} \; | grep Flags
```

### Setting up synobuild VM in LXC
#### ds.ipq806x-1.3 build enviroment
Fix `../bin/` symlinks in /usr/bin/ directory of _ds.ipq806x-1.3_ build enviroment by copying original files from _ds.ipq806x-1.3.env_ archive.
Fix some corrupted files.
```shell
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/dpkg-divert synobuild-vm/toolkit/build_env/ds.ipq806x-1.3/usr/bin/
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/dpkg-statoverride synobuild-vm/toolkit/build_env/ds.ipq806x-1.3/usr/bin/              
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/env synobuild-vm/toolkit/build_env/ds.ipq806x-1.3/usr/bin/                                   
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/update-alternatives synobuild-vm/toolkit/build_env/ds.ipq806x-1.3/usr/bin/
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/install-info synobuild-vm/toolkit/build_env/ds.ipq806x-1.3/usr/bin/
```
