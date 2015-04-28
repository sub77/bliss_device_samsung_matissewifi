# Release name
PRODUCT_RELEASE_NAME := matissewifi

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/matissewifi/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matissewifi
PRODUCT_NAME := cm_matissewifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := matissewifi
PRODUCT_MANUFACTURER := samsung
