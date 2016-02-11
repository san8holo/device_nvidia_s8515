#
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/nvidia/s8515/s8515-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# This device is xhdpi
PRODUCT_AAPT_CONFIG += normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

LOCAL_PATH := device/nvidia/s8515

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.ceres \
	init.ceres.rc \
	init.nv_dev_board.usb.rc \
	init.icera_ceres.rc \
	init.icera.common.rc \
	init.modem_icera.rc \
	init.icera.phone.rc \
	ueventd.ceres.rc \
	init.hdcp.rc \
	init_charging.rc

# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml
	
# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

# Proprietary blobs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/bin/powerservice:system/bin/powerservice \
	$(LOCAL_PATH)/blobs/etc/power.ceres.rc:system/etc/power.ceres.rc \
	$(LOCAL_PATH)/blobs/lib/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
	$(LOCAL_PATH)/blobs/lib/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
	$(LOCAL_PATH)/blobs/vendor/lib/hw/power.ceres.so:system/vendor/lib/hw/power.ceres.so

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    libaudiospdif \
    libtinycompress \
    tinycap \
    tinymix \
    tinyplay \
    xaplay

PRODUCT_PACKAGES += \
    libnetcmdiface
	
# Rild
PRODUCT_PACKAGES += rild

# Light
PRODUCT_PACKAGES += lights.ceres

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Enable Widevine drmcd .
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true
	
# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
	
# WIFISKAYA
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf
	
# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf
    
# Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 196609 \
    wifi.interface=wlan0 \
    ap.interface=wlan0 \
    persist.tegra.nvmmlite = 1 \
    persist.wlan.ti.calibrated = 0 \
    ro.sf.override_null_lcd_density = 1 \
    ro.sf.lcd_density=320 \
    persist.tegra.compositor=glcomposer \
    ro.input.noresample=1 \
    ro.com.google.clientidbase=android-nvidia \
    ro.zygote.disable_gl_preload=true \
    af.resampler.quality = 4

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_s8515
PRODUCT_DEVICE := s8515
PRODUCT_MODEL := WAX CM12
PRODUCT_MANUFACTURER := NVIDIA
