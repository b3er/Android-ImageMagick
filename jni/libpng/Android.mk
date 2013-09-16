LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

common_SRC_FILES := \
png.c\
pngerror.c\
pngget.c\
pngmem.c\
pngpread.c\
pngread.c\
pngrio.c\
pngrtran.c\
pngrutil.c\
pngset.c\
pngtest.c\
pngtrans.c\
pngwio.c\
pngwrite.c\
pngwtran.c\
pngwutil.c\


LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_CFLAGS += -O3 $(common_CFLAGS)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include $(LOCAL_PATH)
LOCAL_MODULE:= png

include $(BUILD_STATIC_LIBRARY)

