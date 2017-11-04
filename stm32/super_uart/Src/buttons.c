/*
 * buttons.c
 *
 *  Created on: 29.10.2017
 *      Author: Masta
 */

#include "buttons.h"

static int_fast8_t buttons_counters[BUTTON_COUNT];
static bool buttons_press_flags[BUTTON_COUNT];
static bool buttons_click_flags[BUTTON_COUNT];
volatile bool buttons_input_states[BUTTON_COUNT];
const uint_fast8_t BUTTONS_TRESHOLD_LOW = 5, BUTTONS_TRESHOLD_HIGH = 10,
		BUTTONS_MAX = 15;

void buttons_init() {
	for (uint_fast8_t i = 0; i < BUTTON_COUNT; i++) {
		buttons_counters[i] = 0;
		buttons_click_flags[i] = false;
		buttons_press_flags[i] = false;
	}
}

void buttons_process() {
	for (uint_fast8_t i = 0; i < 16; i++) {
		if (buttons_input_states[i]) {
			buttons_counters[i]++;
			if (buttons_counters[i] > BUTTONS_MAX) {
				buttons_counters[i] = BUTTONS_MAX;
			}
			if (!buttons_press_flags[i]) {
				// Not pressed yet
				if (buttons_counters[i] > BUTTONS_TRESHOLD_HIGH) {
					buttons_press_flags[i] = true;
					buttons_click_flags[i] = true;
				}
			}
		} else {
			buttons_counters[i]--;
			if (buttons_counters[i] < 0) {
				buttons_counters[i] = 0;
			}
			if (buttons_press_flags[i]) {
				// Was pressed
				if (buttons_counters[i] <= BUTTONS_TRESHOLD_LOW) {
					buttons_press_flags[i] = false;
				}
			}
		}
	}
}

bool buttons_is_pressed(uint_fast8_t button) {
	return buttons_press_flags[button];
}

bool buttons_was_clicked(uint_fast8_t button) {
	bool ret = buttons_click_flags[button];
	buttons_click_flags[button] = 0;
	return ret;
}

