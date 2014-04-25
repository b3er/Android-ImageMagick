# C                  opyrieht (C) 2009 The Android Open Source Project
#
# L                  icensed under the Apache License, Version 2.0 (the "License");
# y                  ou may not use this file except in compliance with the License.
# Y                  ou may obtain a copy of the License at
#
#                        http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := ImageMagick
LOCAL_SRC_FILES := jmagick.c
LOCAL_SRC_FILES += magick_DrawInfo.c
LOCAL_SRC_FILES += magick_ImageInfo.c
LOCAL_SRC_FILES += magick_Magick.c
LOCAL_SRC_FILES += magick_MagickImage.c
LOCAL_SRC_FILES += magick_MagickInfo.c
LOCAL_SRC_FILES += magick_MontageInfo.c
LOCAL_SRC_FILES += magick_PixelPacket.c
LOCAL_SRC_FILES += magick_QuantizeInfo.c \
                                   magick_MagickBitmap.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../ImageMagick
LOCAL_STATIC_LIBRARIES :=  MagickCore filters coders tiff filters png jpeg freetype
LOCAL_SHARED_LIBRARIES +=  MagickCore filters coders tiff filters png jpeg freetype

LOCAL_LDLIBS += -lz -llog
LOCAL_ARM_MODE  := arm

include $(BUILD_SHARED_LIBRARY)
