#! /bin/sh
# UNUSED: only to be used once the OS is to be placed in a floppy drive

dd if=build/kernel.bin of=build/neoos.img bs=4096 count=131136
#mkfs.vfat build/neoos.img
