include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PIPSize

$(TWEAK_NAME)_FILES = /mnt/d/codes/pipsize/Tweak.xm
$(TWEAK_NAME)_FRAMEWORKS = UIKit CydiaSubstrate
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
export ARCHS = armv7 armv7s arm64 arm64e
$(TWEAK_NAME)_ARCHS = armv7 armv7s arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
