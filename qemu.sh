#! /bin/zsh

qemu-system-aarch64 -machine type=versatilepb # -drive format=raw,file=build/kernel.bin
