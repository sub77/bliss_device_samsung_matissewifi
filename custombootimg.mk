MKBOOTIMG_BIN := out/host/linux-x86/bin/mkbootimg
# 	/home/sub77/roms/omnirom/out/host/linux-x86/bin/mkbootimg  --kernel /home/sub77/roms/omnirom/device/samsung/matissewifi/kernel  --ramdisk /home/sub77/roms/omnirom/out/target/product/matissewifi/ramdisk-recovery.img --cmdline "console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1" --base 0x00008000 --pagesize 4096 --ramdisk_offset 0x02000000 --dt device/samsung/matissewifi/dtb --tags_offset 0x01e00000 --output /home/sub77/roms/omnirom/out/target/product/matissewifi/recovery.img
LZMA_RAMDISK := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img

$(LZMA_RAMDISK): $(recovery_ramdisk)
	 gunzip -f < $(recovery_ramdisk) | lzma -e > $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(LZMA_RAMDISK) \
		$(recovery_kernel)
	@echo ----- Making recovery image ------
	/home/sub77/roms/omnirom/out/host/linux-x86/bin/mkbootimg  --kernel /home/sub77/roms/omnirom/device/samsung/matissewifi/kernel --ramdisk $(LZMA_RAMDISK) --cmdline "console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1" --base 0x00008000 --pagesize 4096 --ramdisk_offset 0x02000000 --dt device/samsung/matissewifi/dtb --tags_offset 0x01e00000 --output /home/sub77/roms/omnirom/out/target/product/matissewifi/recovery.img
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	#$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)



