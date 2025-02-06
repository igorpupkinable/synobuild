# Deploy Chroot environments
## Extract tarballs
Provide correct version and platform according to downloaded tarballs.
```bash
$ lxc exec synobuild-focal --force-interactive --user 1000 -- /bin/bash
$ sudo ~/toolkit/pkgscripts-ng/EnvDeploy --version 1.3 -p ipq806x --tarball ~/toolkit/toolkit_tarballs/
$ sudo ~/toolkit/pkgscripts-ng/EnvDeploy --version 7.2 -p armada38x --tarball ~/toolkit/toolkit_tarballs/
```
Synology enviroment preparation documentation can be found [here](https://help.synology.com/developer-guide/getting_started/prepare_environment.html).

#### Fix ds.ipq806x-1.3 build enviroment
Fix some corrupted files and `../bin/` symlinks in `/bin/` and `/usr/bin/` directories of _ds.ipq806x-1.3_ build enviroment by copying original files from _ds.ipq806x-1.3.env_ archive.

1. Delete broken symlinks in the VM
```bash
$ sudo rm ~/toolkit/build_env/ds.ipq806x-1.3/bin/env \
          ~/toolkit/build_env/ds.ipq806x-1.3/usr/bin/dpkg-divert \
          ~/toolkit/build_env/ds.ipq806x-1.3/usr/bin/dpkg-statoverride \
          ~/toolkit/build_env/ds.ipq806x-1.3/usr/bin/update-alternatives
$ exit
```
2. Push original files extracted from the archive 
```bash
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/bin/env synobuild-focal/home/ubuntu/toolkit/build_env/ds.ipq806x-1.3/bin/ --uid=0 --gid=0
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/dpkg-divert synobuild-focal/home/ubuntu/toolkit/build_env/ds.ipq806x-1.3/usr/bin/ --uid=0 --gid=0
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/dpkg-statoverride synobuild-focal/home/ubuntu/toolkit/build_env/ds.ipq806x-1.3/usr/bin/ --uid=0 --gid=0
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/update-alternatives synobuild-focal/home/ubuntu/toolkit/build_env/ds.ipq806x-1.3/usr/bin/ --uid=0 --gid=0
$ lxc file push toolkit_tarballs/ds.ipq806x-1.3.env/usr/bin/install-info synobuild-focal/home/ubuntu/toolkit/build_env/ds.ipq806x-1.3/usr/bin/ --uid=0 --gid=0
```

##### [OPTIONAL] Install package for _chroot_ management
```bash
lxc exec synobuild-focal --force-interactive --user 1000 -- /bin/bash
sudo apt update
sudo apt install schroot
sudo rm -r /etc/schroot/chroot.d/
sudo ln -sT ~/toolkit/schroot/ /etc/schroot/chroot.d
sudo chown root /etc/schroot/chroot.d/*.conf
schroot -c armada38x
exit
```
