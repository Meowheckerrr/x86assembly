RunASM = nasm

SRC_DIR = src
BUILD_DIR = build

$(BUILD_DIR)/boot.img: $(BUILD_DIR)/boot.bin
	# Copy binary to image file
	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot.img
	# Resize to 1.44MB (floppy)
	truncate -s 1440k $(BUILD_DIR)/boot.img

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.asm
	$(RunASM) -f bin $(SRC_DIR)/boot.asm -o $(BUILD_DIR)/boot.bin