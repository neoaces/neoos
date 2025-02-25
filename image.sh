#! /bin/sh

dd if=build/kernel.bin of=build/neoos.img bs=4096 count=131136
#mkfs.vfat build/neoos.img
