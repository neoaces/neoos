#! /bin/zsh

qemu-system-aarch64 -machine type=virt -cpu cortex-a72 -bios help -device virtio-gpu-pci -m 1024 
# -kernel build/bldr/bootloader.bin -drive format=raw,file=build/kernel/
