# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/lg/eve/full_eve.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_eve
PRODUCT_BRAND := google
PRODUCT_DEVICE := eve
PRODUCT_MODEL := GW620
PRODUCT_MANUFACTURER := LG
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=FRG83 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=openetna

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += device/lg/eve/overlay

# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=1

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=OpenEtna/CyanogenMod-6.1-$(shell date +%m%d%Y)-NIGHTLY
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=OpenEtna/CyanogenMod-6.1
endif

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

# Add the Torch app
PRODUCT_PACKAGES += Torch

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
