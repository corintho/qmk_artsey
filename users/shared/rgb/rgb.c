#include "action_layer.h"
#include "action_util.h"
#include "gpio.h"
#include "modifiers.h"
#include "rgblight.h"
#include "users/shared/layers.h"

void keyboard_post_init_user(void) {
    // Initialize RGB to static black
    rgblight_enable_noeeprom();
    rgblight_sethsv_noeeprom(HSV_BLACK);
    rgblight_mode_noeeprom(RGBLIGHT_MODE_STATIC_LIGHT);
}

void keyboard_pre_init_user(void) {
    // Mark the power led pin as output
    gpio_set_pin_output(24);
    // Ensure it is "ON" during startup
    gpio_write_pin_low(24);
}

uint8_t mod_state;
void    housekeeping_task_user(void) {
    // Adjust RGB color based on modifiers
    mod_state     = get_mods();
    uint8_t red   = mod_state & MOD_MASK_ALT ? 255 : 0;
    uint8_t green = mod_state & MOD_MASK_GUI ? 255 : 0;
    uint8_t blue  = mod_state & MOD_MASK_CTRL ? 255 : 0;
    rgblight_setrgb_at(red, green, blue, 0);
}

layer_state_t layer_state_set_user(layer_state_t state) {
    switch (get_highest_layer(state)) {
        // Turn off power led when on NAV layer
        case _ART_NAV:
            gpio_write_pin_high(24);
            break;
        default: //  for any other layers, or the default layer
            gpio_write_pin_low(24);
            break;
    }
    return state;
}
