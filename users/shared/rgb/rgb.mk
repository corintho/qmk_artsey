ifeq ($(strip $(RGBLIGHT_ENABLE)), yes)
    SRC += $(USER_PATH)/rgb/rgb.c
    CONFIG_H += $(USER_PATH)/rgb/rgb.h
endif
