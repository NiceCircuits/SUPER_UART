/*
 * buttons.h
 *
 *  Created on: 29.10.2017
 *      Author: Masta
 */

#ifndef BUTTONS_H_
#define BUTTONS_H_

#include <stdbool.h>
#include <stdint.h>

extern volatile bool buttons_input_states[];
enum {
	BUTTON_COUNT = 16
};

void buttons_init();
void buttons_process();
bool buttons_is_pressed(uint_fast8_t button);
bool buttons_was_clicked(uint_fast8_t button);

#endif /* BUTTONS_H_ */
