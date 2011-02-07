# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/lg/eve/full_eve.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_eve
PRODUCT_BRAND := google
PRODUCT_DEVICE := eve
PRODUCT_MODEL := GW620
PRODUCT_MANUFACTURER := LG
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=FRG83D BUILD_DISPLAY_ID=GRH78C BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83D/75603:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83D 75603 release-keys"

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=openetna

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=OpenEtna/CyanogenMod-7.0-$(shell date +%m%d%Y)-NIGHTLY
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=OpenEtna/CyanogenMod-7.0
endif

# Add the Torch app
PRODUCT_PACKAGES += Torch

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
