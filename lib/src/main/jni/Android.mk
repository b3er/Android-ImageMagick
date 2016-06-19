LOCAL_PATH := $(call my-dir)

IMAGE_MAGICK 	    := ImageMagick-6.7.3-0/
JPEG_SRC_PATH 		:= jpeg-8c/
PHYSFS_SRC_PATH 	:= physfs-2.0.2/
PNG_SRC_PATH 		:= libpng-1.6.20/
TIFF_SRC_PATH 		:= tiff-3.9.5/
FREETYPE_SRC_PATH	:= freetype2-android/
ZLIB_SRC_PATH	    := zlib128/
WEBP_SRC_PATH	    := libwebp-0.3.1/
JASPER_SRC_PATH	    := jasper-1.900.1/

############################################################################################################################################################################################
#libjpego
include $(CLEAR_VARS)

LOCAL_MODULE    := libjpego
LOCAL_MODULE_FILENAME := libjpego

LOCAL_C_INCLUDES  :=  \
	${JPEG_SRC_PATH}

LOCAL_SRC_FILES := \
        ${JPEG_SRC_PATH}jcapimin.c ${JPEG_SRC_PATH}jcapistd.c ${JPEG_SRC_PATH}jccoefct.c ${JPEG_SRC_PATH}jccolor.c ${JPEG_SRC_PATH}jcdctmgr.c ${JPEG_SRC_PATH}jchuff.c \
        ${JPEG_SRC_PATH}jcinit.c ${JPEG_SRC_PATH}jcmainct.c ${JPEG_SRC_PATH}jcmarker.c ${JPEG_SRC_PATH}jcmaster.c ${JPEG_SRC_PATH}jcomapi.c ${JPEG_SRC_PATH}jcparam.c \
        ${JPEG_SRC_PATH}jcprepct.c ${JPEG_SRC_PATH}jcsample.c ${JPEG_SRC_PATH}jctrans.c ${JPEG_SRC_PATH}jdapimin.c ${JPEG_SRC_PATH}jdapistd.c \
        ${JPEG_SRC_PATH}jdatadst.c ${JPEG_SRC_PATH}jdatasrc.c ${JPEG_SRC_PATH}jdcoefct.c ${JPEG_SRC_PATH}jdcolor.c ${JPEG_SRC_PATH}jddctmgr.c ${JPEG_SRC_PATH}jdhuff.c \
        ${JPEG_SRC_PATH}jdinput.c ${JPEG_SRC_PATH}jdmainct.c ${JPEG_SRC_PATH}jdmarker.c ${JPEG_SRC_PATH}jdmaster.c ${JPEG_SRC_PATH}jdmerge.c \
        ${JPEG_SRC_PATH}jdpostct.c ${JPEG_SRC_PATH}jdsample.c ${JPEG_SRC_PATH}jdtrans.c ${JPEG_SRC_PATH}jerror.c ${JPEG_SRC_PATH}jfdctflt.c ${JPEG_SRC_PATH}jfdctfst.c \
        ${JPEG_SRC_PATH}jfdctint.c ${JPEG_SRC_PATH}jidctflt.c ${JPEG_SRC_PATH}jidctfst.c ${JPEG_SRC_PATH}jidctint.c ${JPEG_SRC_PATH}jquant1.c \
        ${JPEG_SRC_PATH}jquant2.c ${JPEG_SRC_PATH}jutils.c ${JPEG_SRC_PATH}jmemmgr.c ${JPEG_SRC_PATH}jcarith.c ${JPEG_SRC_PATH}jdarith.c ${JPEG_SRC_PATH}jaricom.c \
        ${JPEG_SRC_PATH}jmemnobs.c


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)


############################################################################################################################################################################################
#libtiff

############################################################################################################################################################################################
#libfreetype

############################################################################################################################################################################################
#libphysfs

############################################################################################################################################################################################

##libpngo
include $(CLEAR_VARS)

LOCAL_MODULE    := libpngo
LOCAL_CFLAGS    := -g -Dlinux -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT
LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${PNG_SRC_PATH} \

LOCAL_SRC_FILES := \
	${PNG_SRC_PATH}pngerror.c \
	${PNG_SRC_PATH}pngwio.c \
	${PNG_SRC_PATH}pngwrite.c \
	${PNG_SRC_PATH}pngwutil.c \
	${PNG_SRC_PATH}pngwtran.c \
	${PNG_SRC_PATH}pngset.c \
	${PNG_SRC_PATH}pngtrans.c \
	${PNG_SRC_PATH}example.c \
	${PNG_SRC_PATH}png.c \
	${PNG_SRC_PATH}pngrtran.c \
	${PNG_SRC_PATH}pngmem.c \
	${PNG_SRC_PATH}pngpread.c \
	${PNG_SRC_PATH}pngrutil.c \
	${PNG_SRC_PATH}pngrio.c \
	${PNG_SRC_PATH}pngget.c \
	${PNG_SRC_PATH}pngread.c \

LOCAL_LDLIBS    := -llog -lz -L../lib -lGLESv1_CM

ifeq ($(ARCH_ARM_HAVE_NEON),true)
my_cflags_arm := -DPNG_ARM_NEON_OPT=2
else
my_cflags_arm := -DPNG_ARM_NEON_OPT=0
endif

my_cflags_arm64 := -DPNG_ARM_NEON_OPT=2

my_src_files_arm := \
                        ${PNG_SRC_PATH}arm/arm_init.c \
                        ${PNG_SRC_PATH}arm/filter_neon.S \
                        ${PNG_SRC_PATH}filter_neon_intrinsics.c


LOCAL_CFLAGS_arm := $(my_cflags_arm)

LOCAL_SRC_FILES_arm := $(my_src_files_arm)

LOCAL_CFLAGS_arm64 := $(my_cflags_arm64)

LOCAL_SRC_FILES_arm64 := $(my_src_files_arm)
ifeq ($(TARGET_ARCH),arm64)
LOCAL_SRC_FILES += $(my_src_files_arm)
endif

include $(BUILD_STATIC_LIBRARY)

############################################################################################################################################################################################
#libwebpo

############################################################################################################################################################################################
#libjasper

############################################################################################################################################################################################
#magick
include $(CLEAR_VARS)

LOCAL_MODULE    := magick
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DXLOCALE_NOT_USED
LOCAL_C_INCLUDES  :=  \
	$(IMAGE_MAGICK) \
	$(IMAGE_MAGICK)magick \
	${PNG_SRC_PATH} \
	$(FREETYPE_SRC_PATH)include \
	$(FREETYPE_SRC_PATH)src \
	${TIFF_SRC_PATH}libtiff/ \
	${JPEG_SRC_PATH} \
	${PHYSFS_SRC_PATH} \
	$(WEBP_SRC_PATH)src \
	${JASPER_SRC_PATH}src/libjasper/include \

LOCAL_SRC_FILES := \
	$(IMAGE_MAGICK)coders/bmp.c \
	$(IMAGE_MAGICK)coders/gif.c \
	$(IMAGE_MAGICK)coders/jpeg.c \
	$(IMAGE_MAGICK)coders/png.c \
	$(IMAGE_MAGICK)filters/analyze.c \
	$(IMAGE_MAGICK)magick/PreRvIcccm.c \
	$(IMAGE_MAGICK)magick/accelerate.c \
	$(IMAGE_MAGICK)magick/animate.c \
	$(IMAGE_MAGICK)magick/annotate.c \
	$(IMAGE_MAGICK)magick/artifact.c \
	$(IMAGE_MAGICK)magick/attribute.c \
	$(IMAGE_MAGICK)magick/blob.c \
	$(IMAGE_MAGICK)magick/cache-view.c \
	$(IMAGE_MAGICK)magick/cache.c \
	$(IMAGE_MAGICK)magick/cipher.c \
	$(IMAGE_MAGICK)magick/client.c \
	$(IMAGE_MAGICK)magick/coder.c \
	$(IMAGE_MAGICK)magick/color.c \
	$(IMAGE_MAGICK)magick/colormap.c \
	$(IMAGE_MAGICK)magick/colorspace.c \
	$(IMAGE_MAGICK)magick/compare.c \
	$(IMAGE_MAGICK)magick/composite.c \
	$(IMAGE_MAGICK)magick/compress.c \
	$(IMAGE_MAGICK)magick/configure.c \
	$(IMAGE_MAGICK)magick/constitute.c \
	$(IMAGE_MAGICK)magick/decorate.c \
	$(IMAGE_MAGICK)magick/delegate.c \
	$(IMAGE_MAGICK)magick/deprecate.c \
	$(IMAGE_MAGICK)magick/display.c \
	$(IMAGE_MAGICK)magick/distort.c \
	$(IMAGE_MAGICK)magick/draw.c \
	$(IMAGE_MAGICK)magick/effect.c \
	$(IMAGE_MAGICK)magick/enhance.c \
	$(IMAGE_MAGICK)magick/exception.c \
	$(IMAGE_MAGICK)magick/feature.c \
	$(IMAGE_MAGICK)magick/fourier.c \
	$(IMAGE_MAGICK)magick/fx.c \
	$(IMAGE_MAGICK)magick/gem.c \
	$(IMAGE_MAGICK)magick/geometry.c \
	$(IMAGE_MAGICK)magick/hashmap.c \
	$(IMAGE_MAGICK)magick/histogram.c \
	$(IMAGE_MAGICK)magick/identify.c \
	$(IMAGE_MAGICK)magick/image-view.c \
	$(IMAGE_MAGICK)magick/image.c \
	$(IMAGE_MAGICK)magick/layer.c \
	$(IMAGE_MAGICK)magick/list.c \
	$(IMAGE_MAGICK)magick/locale.c \
	$(IMAGE_MAGICK)magick/log.c \
	$(IMAGE_MAGICK)magick/mac.c \
	$(IMAGE_MAGICK)magick/magic.c \
	$(IMAGE_MAGICK)magick/magick.c \
	$(IMAGE_MAGICK)magick/matrix.c \
	$(IMAGE_MAGICK)magick/memory.c \
	$(IMAGE_MAGICK)magick/mime.c \
	$(IMAGE_MAGICK)magick/module.c \
	$(IMAGE_MAGICK)magick/monitor.c \
	$(IMAGE_MAGICK)magick/montage.c \
	$(IMAGE_MAGICK)magick/morphology.c \
	$(IMAGE_MAGICK)magick/nt-base.c \
	$(IMAGE_MAGICK)magick/nt-feature.c \
	$(IMAGE_MAGICK)magick/option.c \
	$(IMAGE_MAGICK)magick/paint.c \
	$(IMAGE_MAGICK)magick/pixel.c \
	$(IMAGE_MAGICK)magick/policy.c \
	$(IMAGE_MAGICK)magick/prepress.c \
	$(IMAGE_MAGICK)magick/profile.c \
	$(IMAGE_MAGICK)magick/property.c \
	$(IMAGE_MAGICK)magick/quantize.c \
	$(IMAGE_MAGICK)magick/quantum-export.c \
	$(IMAGE_MAGICK)magick/quantum-import.c \
	$(IMAGE_MAGICK)magick/quantum.c \
	$(IMAGE_MAGICK)magick/random.c \
	$(IMAGE_MAGICK)magick/registry.c \
	$(IMAGE_MAGICK)magick/resample.c \
	$(IMAGE_MAGICK)magick/resize.c \
	$(IMAGE_MAGICK)magick/resource.c \
	$(IMAGE_MAGICK)magick/segment.c \
	$(IMAGE_MAGICK)magick/semaphore.c \
	$(IMAGE_MAGICK)magick/shear.c \
	$(IMAGE_MAGICK)magick/signature.c \
	$(IMAGE_MAGICK)magick/splay-tree.c \
	$(IMAGE_MAGICK)magick/static.c \
	$(IMAGE_MAGICK)magick/statistic.c \
	$(IMAGE_MAGICK)magick/stream.c \
	$(IMAGE_MAGICK)magick/string.c \
	$(IMAGE_MAGICK)magick/thread.c \
	$(IMAGE_MAGICK)magick/threshold.c \
	$(IMAGE_MAGICK)magick/timer.c \
	$(IMAGE_MAGICK)magick/token.c \
	$(IMAGE_MAGICK)magick/transform.c \
	$(IMAGE_MAGICK)magick/type.c \
	$(IMAGE_MAGICK)magick/utility.c \
	$(IMAGE_MAGICK)magick/version.c \
	$(IMAGE_MAGICK)magick/vms.c \
	$(IMAGE_MAGICK)magick/widget.c \
	$(IMAGE_MAGICK)magick/xml-tree.c \
	$(IMAGE_MAGICK)magick/xwindow.c \

LOCAL_LDLIBS    := -L$(SYSROOT)/usr/lib -llog




LOCAL_STATIC_LIBRARIES := \
    libpngo \
    libjpego \
    libwebpo \
    libfreetype \
    libtiff \
    libphysfs \
    libjasper \


include $(BUILD_STATIC_LIBRARY)

############################################################################################################################################################################################
#libimagemagick
include $(CLEAR_VARS)

LOCAL_MODULE    := libimagemagick
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DXLOCALE_NOT_USED
LOCAL_C_INCLUDES  :=  \
	$(IMAGE_MAGICK) \
	$(IMAGE_MAGICK)magick \
	${PNG_SRC_PATH} \
	$(FREETYPE_SRC_PATH)include \
	$(FREETYPE_SRC_PATH)src \
	${TIFF_SRC_PATH}libtiff/ \
	${JPEG_SRC_PATH} \
	${PHYSFS_SRC_PATH} \
	$(WEBP_SRC_PATH)src \
	${JASPER_SRC_PATH}src/libjasper/include \

LOCAL_SRC_FILES := \
	jmagick.c \
	magick_DrawInfo.c \
	magick_ImageInfo.c \
	magick_Magick.c \
	magick_MagickImage.c \
	magick_MagickInfo.c \
	magick_MontageInfo.c \
	magick_PixelPacket.c \
	magick_QuantizeInfo.c \
	magick_MagickBitmap.c

LOCAL_LDLIBS    := -L$(SYSROOT)/usr/lib -llog -lz


LOCAL_STATIC_LIBRARIES := \
    libpngo \
    libjpego \
    magick \

include $(BUILD_SHARED_LIBRARY)



$(call import-module,android/cpufeatures)
