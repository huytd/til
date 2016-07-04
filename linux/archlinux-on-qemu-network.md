# Setup ArchLinux on Qemu and solve network problem

If you are installing ArchLinux on Qemu, you may experience some networking problem such as losing internet connection after installed.

The simple way to fix it is, boot the Qemu machine with `-net nic -net user` parameter and start the network devices manually in Arch.

Create a `boot` script ro run Qemu:
```
qemu-system-x86_64 $1 -vga std -m 2048 -hda hdd.img -net nic -net user
```

Give this script an execute permission:

```
chmod +x boot
```

Now you can start ArchLinux with `boot` script:

```
./boot
```

After boot, add this script to ArchLinux's `.bash_profile`:

```
ip link set up lo
ip link set up ens3
dhcpd
```

Now you can restart the VM and network will be ready. 

Test the network with:

```
ping 8.8.8.8
```
