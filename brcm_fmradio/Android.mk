ifeq ($(BOARD_USE_BCM_FM), true)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
