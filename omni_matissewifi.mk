# Release name
PRODUCT_RELEASE_NAME := matissewifi

# Inherit some common omni stuff.
$(call inherit-product, vendor/omni/config/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/matissewifi/device_matissewifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matissewifi
PRODUCT_NAME := omni_matissewifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := matissewifi
PRODUCT_MANUFACTURER := samsung
