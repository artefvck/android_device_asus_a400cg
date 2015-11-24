#
# Copyright 2014 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/asus/a400cg-kernel/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# cm overlay
DEVICE_PACKAGE_OVERLAYS += device/asus/a400cg/overlay

#bluetooth
PRODUCT_COPY_FILES += \
        device/asus/a400cg/configs/bt_redhookbay_ttyMFD0.conf:system/etc/bluetooth/bt_redhookbay_ttyMFD0.conf \
        device/asus/a400cg/configs/bt_redhookbay_ttyMFD3.conf:system/etc/bluetooth/bt_redhookbay_ttyMFD3.conf

# media
PRODUCT_COPY_FILES += \
    device/asus/a400cg/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/a400cg/configs/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    device/asus/a400cg/configs/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
     frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml

# video decoder encoder
PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4

# specific audio
PRODUCT_COPY_FILES += \
    device/asus/a400cg/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/a400cg/audio/asound.conf:system/etc/asound.conf \
    device/asus/a400cg/audio/asound-vv.conf:system/etc/asound-vv.conf \
    device/asus/a400cg/audio/audio_volume_curve.conf:system/etc/audio_volume_curve.conf \
    device/asus/a400cg/audio/icesoundpresets.def:system/etc/icesoundpresets.def \
    device/asus/a400cg/audio/route_criteria.conf:system/etc/route_criteria.conf

# init
PRODUCT_PACKAGES += \
	fstab \
	fstab.charger.redhookbay \
	fstab.ramconsole.redhookbay \
	fstab.redhookbay \
	fstab.zram \
	init.avc.rc \
	init.bt.rc \
	init.bt.vendor.rc \
	init.camera_cali.rc \
	init.common.rc \
	init.debug.rc \
	init.diag.rc \
	init.firmware.rc \
	init.gps.rc \
	init.logtool.rc \
	init.modem.rc \
	init.platform.usb.rc \
	init.project.rc \
	init.recovery.redhookbay.rc \
	init.redhookbay.rc \
	init.watchdog.rc \
	init.wifi.rc \
	init.wifi.vendor.rc \
	init.wireless.rc \
	init.zram.rc \
	intel_prop.cfg \
	rfkill_bt.sh \
	ueventd.project.rc \
	ueventd.redhookbay.rc \
	intel_prop \
	thermald \
	pclinkd

# Only copy init.rc if the target doesn't have its own.
PRODUCT_COPY_FILES += \
	device/asus/a400cg/rootdir/etc/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.rc:root/init.extra.rc

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:system/etc/permissions/android.hardware.gamepad.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

$(call inherit-product-if-exists, vendor/asus/a400cg/device-vendor.mk)
