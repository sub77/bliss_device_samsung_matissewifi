# Release name
PRODUCT_RELEASE_NAME := matissewifi

# Inherit device configuration
$(call inherit-product, device/samsung/matissewifi/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matissewifi
PRODUCT_NAME := omni_matissewifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T530
PRODUCT_MANUFACTURER := samsung

