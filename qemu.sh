#! /bin/zsh

qemu-system-aarch64 -machine type=realview-pb-a8 -drive format=raw,file=build/kernel.bin
