
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := filters
LOCAL_SRC_FILES := analyze.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..
LOCAL_CFLAGS += -O3 -DHAVE_CONFIG_H
LOCAL_STATIC_LIBRARIES += tiff freetype jpeg png
LOCAL_SHARED_LIBRARIES += tiff freetype jpeg png

LOCAL_ARM_MODE := arm

include $(BUILD_STATIC_LIBRARY)
