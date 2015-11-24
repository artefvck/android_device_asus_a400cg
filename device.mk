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

#media
PRODUCT_COPY_FILES += \
    device/asus/a400cg/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/a400cg/configs/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    device/asus/a400cg/configs/media_codecs.xml:system/etc/media_codecs.xml

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

$(call inherit-product-if-exists, vendor/asus/a400cg/device-vendor.mk)
