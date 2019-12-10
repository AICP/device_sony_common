ifneq ($(AICP_BUILD),)
# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS += msm8952 msm8996 msm8998 sdm660 sdm845

QCOM_NEW_MEDIA_PLATFORM := msm8952 msm8996 msm8998 sdm660 sdm845 sm8150

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := msm8952 msm8996 msm8998 sdm660 sdm845

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996 msm8998 sdm660 sdm845

SONY_QCOM_HAL_ROOT := hardware/sony/qcom-$(SOMC_KERNEL_VERSION)

audio-hal := $(SONY_QCOM_HAL_ROOT)/audio
gps-hal := $(SONY_QCOM_HAL_ROOT)/gps/sdm845
display-hal := $(SONY_QCOM_HAL_ROOT)/display

ifneq ($(filter $(QCOM_NEW_MEDIA_PLATFORM), $(TARGET_BOARD_PLATFORM)),)
QCOM_MEDIA_ROOT := $(SONY_QCOM_HAL_ROOT)/media/sm8150
else
QCOM_MEDIA_ROOT := $(SONY_QCOM_HAL_ROOT)/media/msm8998
endif

OMX_VIDEO_PATH := mm-video-v4l2
media-hal := $(QCOM_MEDIA_ROOT)

SRC_CAMERA_HAL_DIR ?= hardware/sony/camera
SRC_DISPLAY_HAL_DIR := $(display-hal)
SRC_MEDIA_HAL_DIR := $(QCOM_MEDIA_ROOT)
TARGET_KERNEL_VERSION := $(SOMC_KERNEL_VERSION)

include device/sony/common/hardware/qcom/utils.mk

#include $(display-hal)/Android.mk
include $(call all-makefiles-under,$(audio-hal))
include $(call all-makefiles-under,$(gps-hal))
include $(call all-makefiles-under,$(media-hal))

ifneq ($(ipa-hal),)
include $(call first-makefiles-under,$(ipa-hal))
endif

endif
