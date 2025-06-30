RunASM = nasm

SRC_DIR = src
BUILD_DIR = build


#
# Floppy images  | file formate = F12 A
#
floppy_images: $(BUILD_DIR)/meow.img
$(BUILD_DIR)/meow.img: bootloader kernel
	# Creates a file filled with zeroes 512 bytes × 2880 sectors = 1.44MB 
	dd if=/dev/zero of=$(BUILD_DIR)/meow.img bs=512 count=2880

	#  Format it with a FAT12 filesystem
	mkfs.fat -F 12 -n "MeowHappyOS" $(BUILD_DIR)/meow.img

	# Write bootloader to frist sector 
	dd if=$(BUILD_DIR)/boot.bin of=$(BUILD_DIR)/meow.img conv=notrunc

	# Copy kernel into the disk’s file system
	mcopy -i $(BUILD_DIR)/meow.img $(BUILD_DIR)/kernel.bin "::kernel.bin"
	
# Old Version
# $(BUILD_DIR)/boot.img: $(BUILD_DIR)/boot.bin
# 	# Copy binary to image file
# 	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot.img
# 	# Resize to 1.44MB (standard floppy size)
# 	truncate -s 1440k $(BUILD_DIR)/boot.img

#
#Bootloader
#
bootloader: $(BUILD_DIR)/boot.bin   #make bootloader
$(BUILD_DIR)/boot.bin:  #Since there are no dependencies, it always rebuilds unless you add one.
	$(RunASM) -f bin $(SRC_DIR)/bootloader/boot.asm -o $(BUILD_DIR)/boot.bin

#
#Kernel
#
kernel: $(BUILD_DIR)/kernel.bin   #make kernel
$(BUILD_DIR)/kernel.bin:  #Since there are no dependencies, it always rebuilds unless you add one.
	$(RunASM) -f bin $(SRC_DIR)/kernel/kernel.asm -o $(BUILD_DIR)/kernel.bin