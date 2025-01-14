#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright 2016-2018 The LineageOS Project
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

BOARD_VENDOR := htc

PLATFORM_PATH := device/htc/hima

TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

TARGET_BOARD_PLATFORM := msm8994
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8994
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_BASE := 0x00078000
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 boot_cpus=0-5 androidusb.pid=0x065d  androidboot.init_fatal_reboot_target=recovery androidkey.dummy=1 androidtouch.htc_event=1 disk_mode_enable=1 debug=0 nowatchdog nmi_watchdog=0 no_debug_objects dyndbg=0 module.dyndbg=0
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01f88000 --tags_offset 0x01d88000
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_SOURCE := kernel/htc/msm8994
TARGET_KERNEL_NEW_GCC_COMPILE := true
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/eva/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-elf-
TARGET_KERNEL_CONFIG := hima_defconfig

# Device Asserts
TARGET_OTA_ASSERT_DEVICE := htc_himaul,htc_himauhl,htc_himaulatt,htc_himawhl,htc_himawl

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true

AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := false
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_VNDK_VERSION := 33

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext_hima
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/cameraserver=24 \
    /system/bin/cameraserver_hima=24 \
    /vendor/bin/mm-qcamera-daemon=24

BOARD_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'

# Charger
BOARD_CHARGING_CMDLINE_NAME := "androidboot.mode"
BOARD_CHARGING_CMDLINE_VALUE := "chargerlogo"
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Display
BOARD_USES_ADRENO := true
USE_OPENGL_RENDERER := true
TARGET_USES_GRALLOC1 := true
TARGET_SCREEN_DENSITY := 420
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_DISABLE_POSTRENDER_CLEANUP := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
HWUI_COMPILE_FOR_PERF := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 1426063360
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4697620480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25232932864
BOARD_VENDORIMAGE_PARTITION_SIZE := 304087040
TARGET_FS_CONFIG_GEN := $(PLATFORM_PATH)/config.fs
TARGET_USERIMAGES_USE_EXT4 := true

# Vendor Image
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_VENDORIMAGE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_FOLDERS := \
    vendor \
    persist

# HIDL
#DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_hima
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# IPA
USE_DEVICE_SPECIFIC_DATA_IPA_CFG_MGR := true

# Legacy memfd
TARGET_HAS_MEMFD_BACKPORT := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_HAS_LEGACY_POWER_STATS := true
TARGET_HAS_NO_WIFI_STATS := true

# Properties
TARGET_SYSTEM_PROP :=  $(PLATFORM_PATH)/system.prop

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# Sensors
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy
#BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy-minimal
#SELINUX_IGNORE_NEVERALLOWS := true

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/lib/libHtcVteEngine.so|libshim_camera_hima.so \
    /vendor/lib/hw/camera.msm8994.so|libshim_camera_hima.so \
    /vendor/lib/hw/camera.msm8994.so|libshim_sensor.so \
    /system/lib/liblog.so|liblog_htc.so \
    /system/lib64/liblog.so|liblog_htc.so \
    /vendor/bin/hw/android.hardware.drm@1.0-service.widevine|libshim_drm.so \
    /vendor/lib64/libril-qc-qmi-1.so|libshim_ril.so \
    /vendor/lib64/libsettings.so|/vendor/lib64/libprotobuf-cpp-full.so \
    /vendor/lib/libmmcamera_chromaflash_lib.so|/vendor/lib/libshim_chromaflash.so \
    /vendor/lib/libmmcamera_stillmore_lib.so|/vendor/lib/libshim_stillmore.so \
    /vendor/lib/libwvhidl.so|/vendor/lib/libprotobuf-cpp-lite.so \
    /vendor/lib/mediadrm/libwvdrmengine.so|/vendor/lib/libprotobuf-cpp-lite.so \
    /vendor/lib64/libmm-qdcm-diag.so|libshims_thermal.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(PLATFORM_PATH)/liblog_htc

# Use Snapdragon LLVM, if available
TARGET_USE_SDCLANG := true

# Security Patch Level
VENDOR_SECURITY_PATCH := 2017-04-01

# Wifi
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/etc/firmware/fw_bcm4356_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/etc/firmware/fw_bcm4356.bin"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# inherit from the proprietary version
-include vendor/htc/hima/BoardConfigVendor.mk
