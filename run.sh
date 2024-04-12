#!/bin/bash
zig build && mkdir -p build/iso/boot/grub && cp grub.cfg build/iso/boot/grub && cp zig-out/bin/kernel build/iso/boot/OwOS.bin && grub-mkrescue -o build/OwOS.iso build/iso && qemu-system-i386 -cdrom build/OwOS.iso -debugcon stdio -vga virtio -m 2G -machine "q35" -no-reboot -no-shutdown