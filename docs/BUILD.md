All pre-built binaries, headers, and libraries are under cross compiler sysroot in chroot environment.
Sysroot is the default search path of a compiler, so **you do not need to provide -I or -L to CFLAGS or LDFLAGS**.
If gcc cannot find header or library from the given path, it will then search `sysroot/usr/{lib,include}`.
`/toolkit/build_env/ds.<platform>-<version>/usr/local/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/`

### Manual compilation
```shell
$ lxc start synobuild-focal
$ lxc exec synobuild-focal --force-interactive --user 1000 -- /bin/bash
$ schroot --chroot=armada38x
$ export LANG=en_US.UTF-8
$ cd /source/nano-7.2/
$ ./configure --with-platform-specific-flags WITH_PLATFORM_SPECIFIC=VARIABLES
$ make
$ make DESTDIR=/build/armada38x/nano-7.2 install
$ exit
To detach from the console, press: <ctrl>+a q
$ lxc file pull synobuild-focal/home/ubuntu/build/ ~/projects/synobuild/ --recursive
$ lxc stop synobuild-focal
```

#### Variables
Most of variable values can be found in `/toolkit/build_env/ds.${platform}-${version}/{env.mak,env32/64.mak}`.

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

### Compilation settings
#### Pre-built headers and projects
Synology toolkit environment has included selected prebuild projects. You can **enter the chroot** and use following commands to check if needed header or project is provided by toolkit.
```bash
(armada38x)ubuntu@synobuild-focal:~$ dpkg -l  # List all dpkg projects.
(armada38x)ubuntu@synobuild-focal:~$ dpkg -L {project dev} # List project install files, e.g `dpkg -L synousb-armada38x-dev`
(armada38x)ubuntu@synobuild-focal:~$ dpkg -S {header/library pattern} # Search header/library pattern, e.g. `dpkg -S libexif`
```
Some open source projects require to use other projects' cross compiled product while building their own.
For example, _python_ needs _libffi_ and _zlib_ during configuration stage. We need to provide those two project before building _python_.
You can install the cross compiled product into the destination you want in build script.
Please refer to [Compile Open Source Project: nmap](https://help.synology.com/developer-guide/examples/compile_nmap.html) for more information.

More information can be found [here](https://help.synology.com/developer-guide/toolkit/build_stage.html).
