# Create synobuild LXC virtual machine
```bash
$ lxc image list ubuntu:focal type=virtual-machine architecture=x86_64 --columns=Lfpdatsu
$ lxc launch ubuntu:20.04 synobuild-focal --profile=synobuild --vm
$ lxc exec synobuild-focal -- /bin/bash
root@synobuild-focal:~$ passwd ubuntu
root@synobuild-focal:~$ exit
```

# Create synobuild LXC container
```bash

```

# Deploy Chroot Environment
```bash
$ lxc exec synobuild-focal --force-interactive --user 1000 -- /bin/bash
$ git clone https://github.com/igorpupkinable/synobuild.git --depth=1 --branch=master --recurse-submodules ~/toolkit
$ mkdir -p ~/toolkit/toolkit_tarballs/
$ cd ~/toolkit/toolkit_tarballs/
$ wget https://global.synologydownload.com/download/ToolChain/toolkit/7.2/base/base_env-7.2.txz
$ wget --output-document=ds.ipq806x-1.3.env.txz https://global.synologydownload.com/download/ToolChain/toolkit/1.3/ipq806x/ds.ipq806x-1.3.env.tgz
$ wget --output-document=ds.ipq806x-1.3.dev.txz https://global.synologydownload.com/download/ToolChain/toolkit/1.3/ipq806x/ds.ipq806x-1.3.dev.tgz
$ ln -s base_env-7.2.txz base_env-1.3.txz
$
```
