
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := coders
LOCAL_SRC_FILES := aai.c \
art.c \
avs.c \
bgr.c \
bmp.c \
braille.c \
cals.c \
caption.c \
cin.c \
cip.c \
clip.c \
clipboard.c \
cmyk.c \
cut.c \
dcm.c \
dds.c \
debug.c \
dib.c \
djvu.c \
dng.c \
dot.c \
dps.c \
dpx.c \
emf.c \
ept.c \
exr.c \
fax.c \
fits.c \
fpx.c \
gif.c \
gradient.c \
gray.c \
hald.c \
hdr.c \
histogram.c \
hrz.c \
html.c \
icon.c \
info.c \
inline.c \
ipl.c \
jbig.c \
jp2.c \
jpeg.c \
label.c \
mac.c \
magick.c \
map.c \
mat.c \
matte.c \
meta.c \
miff.c \
mono.c \
mpc.c \
mpeg.c \
mpr.c \
msl.c \
mtv.c \
mvg.c \
null.c \
otb.c \
palm.c \
pattern.c \
pcd.c \
pcl.c \
pcx.c \
pdb.c \
pdf.c \
pes.c \
pict.c \
pix.c \
plasma.c \
png.c \
pnm.c \
preview.c \
ps.c \
ps2.c \
ps3.c \
psd.c \
pwp.c \
raw.c \
rgb.c \
rla.c \
rle.c \
scr.c \
sct.c \
sfw.c \
sgi.c \
stegano.c \
sun.c \
svg.c \
tga.c \
thumbnail.c \
tiff.c \
tile.c \
tim.c \
ttf.c \
txt.c \
uil.c \
url.c \
uyvy.c \
vicar.c \
vid.c \
viff.c \
wbmp.c \
webp.c \
wmf.c \
wpg.c \
x.c \
xbm.c \
xc.c \
xcf.c \
xpm.c \
xps.c \
xwd.c \
ycbcr.c \
yuv.c \

LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. $(LOCAL_PATH)/../../freetype/include $(LOCAL_PATH)/../../tiff/libtiff $(LOCAL_PATH)/../../libjpeg $(LOCAL_PATH)/../../libpng
LOCAL_CFLAGS += -DHAVE_CONFIG_H


LOCAL_STATIC_LIBRARIES += MagickCore tiff jpeg freetype png
LOCAL_SHARED_LIBRARIES += MagickCore tiff jpeg freetype png

include $(BUILD_STATIC_LIBRARY)
