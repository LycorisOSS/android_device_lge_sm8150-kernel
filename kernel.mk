#
# Copyright (C) 2024 StatiX
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_KERNEL_PATH := device/lge/sm8150-kernel

# Configurations
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL := false

# DTB image
BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_PATH)/dtb

# Kernel modules
KERNEL_MODULES := $(wildcard $(TARGET_KERNEL_PATH)/modules/*.ko)

# Image (dtbo)
ifneq ($(filter alphalm alphaplus,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_PATH)/dtbo/alpha/dtbo.img
else ifneq ($(filter flashlm flashlmdd,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_PATH)/dtbo/flash/dtbo.img
else ifneq ($(filter betalm,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_PATH)/dtbo/beta/dtbo.img
endif

# Kernel image
ifneq ($(filter alphalm alphaplus,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
PRODUCT_COPY_FILES += $(TARGET_KERNEL_PATH)/kernel/alpha/Image:kernel
else ifneq ($(filter flashlm flashlmdd,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
PRODUCT_COPY_FILES += $(TARGET_KERNEL_PATH)/kernel/flash/Image:kernel
else ifneq ($(filter betalm,$(shell echo $(TARGET_PRODUCT) | sed 's/^statix_//')),)
PRODUCT_COPY_FILES += $(TARGET_KERNEL_PATH)/kernel/beta/Image:kernel
endif
