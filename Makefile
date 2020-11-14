TARGET = aarch64-unknown-none-softfloat
# triple is in format <arch>[<sub>]-<vendor>-<sys>-<abi>

PROFILE ?= debug

PKG_NAME = kernel
# stupid workaround - cargo rustc will always 
# output the file as the name of the package - find 
# a better solution in the future :(


RUSTC_ARGS = -C target-cpu=cortex-a53 -C link-arg=-Tsrc/link.ld
# note: target-cpu=cortext-a72 for rpi4
# this doesnt matter till we run into a bit more complicated code
# as basic instructions are still the same
# we also use the linker file using -T
# and we choose the profile release or debug


KERNEL_ELF = target/$(TARGET)/$(PROFILE)/$(PKG_NAME)

all: kernel8.img

clean:
	rm kernel8.{elf, img} *.o

.PHONY : all clean

qemu: 
	qemu-system-aarch64 -d in_asm -display none -M raspi3 -kernel kernel8.img

# -d (debugging) in_asm - generate host assembly code

kernel8.img: $(KERNEL_ELF)
	rust-objcopy -O binary --strip-all $(KERNEL_ELF) kernel8.img 

$(KERNEL_ELF):
	RUSTFLAGS="$(RUSTC_ARGS)" cargo build -Z unstable-options --target $(TARGET) --profile $(PROFILE)