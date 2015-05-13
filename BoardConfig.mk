# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from msm8226-common
-include device/samsung/msm8226-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := matissewifi,matissewifixx

LOCAL_PATH := device/samsung/matissewifi


# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/matissewifi/cmhw

# Init
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_matissewifi.c

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 maxcpus=2 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
TARGET_KERNEL_SOURCE := kernel/samsung/matissewifi
TARGET_KERNEL_CONFIG := msm8226-sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_matissewifi_defconfig

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.qcom

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
       device/samsung/matissewifi/sepolicy

BOARD_SEPOLICY_UNION += \
       camera.te \
       file.te \
       file_context \
       init.te \
       init_shell.te \
       mm-qcamerad.te \
       netd.te \
       platform_app.te \
       rmt_storage.te \
       shell.te \
       sysinit.te \
       system_app.te \
       system_server.te \
       tee.te \
       time_daemon.te \
       untrusted_app.te \
       vold.te \
       wcnss_service.te \
       zygote.te

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# BlissPop Configs
TARGET_TC_ROM := 4.8-sm
TARGET_TC_KERNEL := 4.9-sm
BLISSIFY := true
BLISS_O3 := true
BLISS_STRICT := false
BLISS_GRAPHITE := true
BLISS_KRAIT := true
BLISS_PIPE := true
TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)

-include vendor/bliss/config/sm.mk
