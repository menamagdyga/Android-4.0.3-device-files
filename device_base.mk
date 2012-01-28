# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# aries. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that aries is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.



# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/aries/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/aries/vold.fstab:system/etc/vold.fstab \
	device/samsung/aries/egl.cfg:system/lib/egl/egl.cfg

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/aries/init.aries.rc:root/init.aries.rc \
	device/samsung/aries/init.aries.usb.rc:root/init.aries.usb.rc \
	device/samsung/aries/ueventd.aries.rc:root/ueventd.aries.rc

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/samsung/aries/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/aries/s3c-keypad.kcm:system/usr/keychars/s3c-keypad.kcm \
	device/samsung/aries/aries-keypad.kl:system/usr/keylayout/aries-keypad.kl \
	device/samsung/aries/aries-keypad.kcm:system/usr/keychars/aries-keypad.kcm \
	device/samsung/aries/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl \
	device/samsung/aries/cypress-touchkey.kcm:system/usr/keychars/cypress-touchkey.kcm \
	device/samsung/aries/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/aries/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
	device/samsung/aries/mxt224_ts_input.kl:system/usr/keylayout/mxt224_ts_input.kl \
	device/samsung/aries/mxt224_ts_input.kcm:system/usr/keychars/mxt224_ts_input.kcm

#Bluetooth setup
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf \

#NVRAM setup
PRODUCT_COPY_FILES += \
        device/samsung/aries/nvram_net.txt:system/vendor/firmware/nvram_net.txt

#MFC Firmware
PRODUCT_COPY_FILES += \
        device/samsung/aries/samsung_mfc_fw.bin:system/vendor/firmware/samsung_mfc_fw.bin

# NFC
PRODUCT_PACKAGES += \
	Tag

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
##PRODUCT_COPY_FILES += \
##	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# file that declares the MIFARE NFC constant
##PRODUCT_COPY_FILES += \
##	device/sample/nxp/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

## NFC EXTRAS add-on API
## PRODUCT_PACKAGES += \
## 	com.android.nfc_extras
##PRODUCT_COPY_FILES += \
##	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
#ifeq ($(TARGET_BUILD_VARIANT),user)
#	NFCEE_ACCESS_PATH := device/samsung/aries/nfcee_access.xml
#else
#	NFCEE_ACCESS_PATH := device/samsung/aries/nfcee_access_debug.xml
#endif
#PRODUCT_COPY_FILES += \
#	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Generated kcm keymaps
PRODUCT_PACKAGES += \
	s3c-keypad.kcm \
	cypress-touchkey.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

#PRODUCT_CHARACTERISTICS := nosdcard

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/aries/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/aries/media_profiles.xml:system/etc/media_profiles.xml


# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

# Misc other modules
PRODUCT_PACKAGES += \
	lights.s5pc110 \
	hwcomposer.s5pc110 \
	sensors.aries 

# Camera
PRODUCT_PACKAGES += \
	camera.aries

# audio
PRODUCT_PACKAGES += \
	audio.primary.aries \
	audio.a2dp.default \
	libaudioutils
#	audio_policy.aries \

# NFC
#PRODUCT_PACKAGES += \
#	nfc.aries

# Libs
PRODUCT_PACKAGES += \
	libcamera \
	libstagefrighthw \
	com.android.future.usb.accessory

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/samsung/aries/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb

include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Screen size is "normal", density is "hdpi"
PRODUCT_AAPT_CONFIG := normal hdpi

ifeq ($(TARGET_PREBUILT_WIFI_MODULE),)
LOCAL_WIFI_MODULE := device/samsung/aries/bcm4329.ko
else
LOCAL_WIFI_MODULE := $(TARGET_PREBUILT_WIFI_MODULE)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_WIFI_MODULE):system/modules/bcm4329.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/aries/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/nxp/pn544/nxp-pn544-fw-vendor.mk)
