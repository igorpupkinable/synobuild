# Synology build platform
## Create synobuild LXC virtual machine
**It is important to use correct distro version** as a build platform if you are planning to build software using standard GCC tools.
See [here](#Choosing-build-platform) how to choose a distribution with matching GLIBC version supported by your device so built software works correctly on older Linux systems.

_ubuntu:20.04_ (focal) is used for an example below.
```bash
$ lxc image list ubuntu:focal type=virtual-machine architecture=x86_64 --columns=Lfpdatsu
$ lxc launch ubuntu:20.04 synobuild-focal --profile=synobuild --vm
$ lxc exec synobuild-focal -- /bin/bash
root@synobuild-focal:~$ passwd ubuntu
root@synobuild-focal:~$ exit
```

## Create synobuild LXC container
LXC container is an alternative way of setting up a lightweight build enviroment 
compared to a fully-fledged Virtual Machine setup.
```bash
$ TODO
```



# Download Build Environments
```bash
$ lxc exec synobuild-focal --force-interactive --user 1000 -- /bin/bash
$ git clone https://github.com/igorpupkinable/synobuild.git --depth=1 --branch=master --recurse-submodules ~/toolkit
```
## Download tarballs for Synology RT2600ac (SRM)
_Skip this section if you need an enviroment for Synology DSM only._
The following steps can be used to deploy build environment for other Synology networking devices.
RT2600ac's _ipq806x_ platform ID must be replaced by relevant platform ID in such case.
Available toolkit platforms are listed at [Synology Archive Download Site](https://archive.synology.com/download/ToolChain/toolkit/1.3).
```bash
$ cd ~/toolkit/toolkit_tarballs/
$ wget https://global.synologydownload.com/download/ToolChain/toolkit/7.2/base/base_env-7.2.txz
$ wget --output-document=ds.ipq806x-1.3.env.txz https://global.synologydownload.com/download/ToolChain/toolkit/1.3/ipq806x/ds.ipq806x-1.3.env.tgz
$ wget --output-document=ds.ipq806x-1.3.dev.txz https://global.synologydownload.com/download/ToolChain/toolkit/1.3/ipq806x/ds.ipq806x-1.3.dev.tgz
$ ln -s base_env-7.2.txz base_env-1.3.txz
```
## Download tarballs for Synology NAS (DSM)
The following steps can be used to deploy build environment for other Synology storage devices.
_armada38x_ platform ID must be replaced by relevant platform ID in such case.
Available toolkit platforms are listed at [Synology Archive Download Site](https://archive.synology.com/download/ToolChain/toolkit/7.2).
```bash
$ cd ~/toolkit/toolkit_tarballs/
$ wget https://global.synologydownload.com/download/ToolChain/toolkit/7.2/base/base_env-7.2.txz
$ wget https://global.synologydownload.com/download/ToolChain/toolkit/7.2/armada38x/ds.armada38x-7.2.env.txz
$ wget https://global.synologydownload.com/download/ToolChain/toolkit/7.2/armada38x/ds.armada38x-7.2.dev.txz
```
_base_env-7.2.txz_ is common for all setups. **No need to download it twice.**

##### Proceed to the deployment of the downloaded Chroot environments decribed [here](Chroot.md)



## Notes
### Choosing build platform
1. SSH to an embeded device to run the following
```bash
$ strings /lib/libc.so.6 | grep GLIBC
```
2. Check the list for the latest version, e.g. `GLIBC_2.32`
```bash
GLIBC_2.4
GLIBC_2.5
...
GLIBC_2.30
GLIBC_2.32
$
```
3. Browse to https://distrowatch.com/table.php?distribution=ubuntu
4. Find _glibc_ row in the _Package_ table
5. Find a column with required GLIBC version, i.e. 2.32
6. Pick **LTS** Ubuntu version with matching GLIBC version or **older**, i.e.
  - `GLIBC_2.23` > 16.04 LTS (xenial)
  - `GLIBC_2.24` > 16.04 LTS (xenial)
  - `GLIBC_2.25` > 16.04 LTS (xenial)
  - `GLIBC_2.26` > 16.04 LTS (xenial)
  - `GLIBC_2.27` > 18.04 LTS (bionic)
  - `GLIBC_2.28` > 18.04 LTS (bionic)
  - `GLIBC_2.29` > 18.04 LTS (bionic)
  - `GLIBC_2.30` > 18.04 LTS (bionic)
  - `GLIBC_2.31` > 20.04 LTS (focal)
  - `GLIBC_2.32` > 20.04 LTS (focal)
  - `GLIBC_2.33` > 20.04 LTS (focal)
  - `GLIBC_2.34` > 20.04 LTS (focal)
  - `GLIBC_2.35` > 22.04 LTS (jammy)
  - `GLIBC_2.36` > 22.04 LTS (jammy)
  - `GLIBC_2.37` > 22.04 LTS (jammy)
  - `GLIBC_2.38` > 22.04 LTS (jammy)
  - `GLIBC_2.39` > 24.04 LTS (noble)
7. We choose _focal_ for GLIBC version 2.32 as the closest older LTS release.
