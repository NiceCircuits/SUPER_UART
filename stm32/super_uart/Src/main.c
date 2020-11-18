/**
 ******************************************************************************
 * File Name          : main.c
 * Description        : Main program body
 ******************************************************************************
 ** This notice applies to any and all portions of this file
 * that are not between comment pairs USER CODE BEGIN and
 * USER CODE END. Other portions of this file, whether
 * inserted by the user or by software development tools
 * are owned by their respective copyright owners.
 *
 * COPYRIGHT(c) 2017 STMicroelectronics
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of STMicroelectronics nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f0xx_hal.h"
#include "spi.h"
#include "tim.h"
#include "gpio.h"

/* USER CODE BEGIN Includes */
#include <stdbool.h>
#include <stdint.h>
#include <buttons.h>
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */
typedef enum {
	LED_TX,
	LED_1V8_1,
	LED_2V5_1,
	LED_SPI_A,
	LED_RX,
	LED_3V3_1,
	LED_5V_1,
	LED_I2C_A,
	LED_I2C_B,
	LED_ISO,
	LED_2V5_2,
	LED_1V8_2,
	LED_SPI_B,
	LED_SPY,
	LED_5V_2,
	LED_3V3_2,
	LED_EN_A,
	LED_EN_B,
	LED_EN_C,
	LED_EN_D
} led_number_t;
typedef enum {
	BUTTON_TX,
	BUTTON_1V8_1,
	BUTTON_2V5_1,
	BUTTON_I2C_A,
	BUTTON_RX,
	BUTTON_3V3_1,
	BUTTON_5V_1,
	BUTTON_SPI_A,
	BUTTON_I2C_B,
	BUTTON_ISO,
	BUTTON_2V5_2,
	BUTTON_1V8_2,
	BUTTON_SPI_B,
	BUTTON_SPY,
	BUTTON_5V_2,
	BUTTON_3V3_2,
} button_number_t;
volatile GPIO_PinState led_states[20];
typedef enum {
	VOLTAGE_1V8, VOLTAGE_2V5, VOLTAGE_3V3, VOLTAGE_5V0, VOLTAGE_NONE
} voltage_t;
enum {
	PWM_MAX = 479
};
static voltage_t voltages[] = { VOLTAGE_NONE, VOLTAGE_NONE };
typedef enum {
	CHANNEL_MODE_I2C, CHANNEL_MODE_SPI, CHANNEL_MODE_UART, CHANNEL_MODE_SPY
} channel_mode_t;
static channel_mode_t modes[] = { CHANNEL_MODE_UART, CHANNEL_MODE_UART,
		CHANNEL_MODE_UART, CHANNEL_MODE_UART };
static bool iso_enabled = true;

typedef enum {
	BUZZER_RX, BUZZER_TX
} buzzer_mode_t;
static bool buzzer_enable[] = { false, false };

static volatile bool button_process_flag = false;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	GPIO_TypeDef* col_ports[] = { COL1_GPIO_Port, COL2_GPIO_Port,
	COL3_GPIO_Port, COL4_GPIO_Port };
	uint16_t col_pins[] = { COL1_Pin, COL2_Pin, COL3_Pin, COL4_Pin };
	GPIO_TypeDef* led_ports[] = { LED1_GPIO_Port, LED2_GPIO_Port,
	LED3_GPIO_Port, LED4_GPIO_Port, LED5_GPIO_Port };
	uint16_t led_pins[] = { LED1_Pin, LED2_Pin, LED3_Pin, LED4_Pin,
	LED5_Pin };
	GPIO_TypeDef* sw_ports[] = { SW1_GPIO_Port, SW2_GPIO_Port,
	SW3_GPIO_Port, SW4_GPIO_Port };
	uint16_t sw_pins[] = { SW1_Pin, SW2_Pin, SW3_Pin, SW4_Pin };
	static uint_fast8_t col = 0;

	if (htim == &htim6) {
		for (uint_fast8_t row = 0; row < 4; row++) {
			buttons_input_states[row * 4 + col] = !HAL_GPIO_ReadPin(
					sw_ports[row], sw_pins[row]);
		}
		HAL_GPIO_WritePin(col_ports[col], col_pins[col], GPIO_PIN_SET);
		col++;
		if (col >= 4) {
			col = 0;
			button_process_flag = true;
		}
		for (uint_fast8_t row = 0; row < 5; row++) {
			HAL_GPIO_WritePin(led_ports[row], led_pins[row],
					led_states[row * 4 + col]);
		}
		HAL_GPIO_WritePin(col_ports[col], col_pins[col], GPIO_PIN_RESET);
	} else {

	}
}

void shift_register_write(uint8_t data) {
	HAL_SPI_Transmit(&hspi2, &data, 1, 10);
	for (int i = 0; i < 10; i++) { // for delay
		HAL_GPIO_WritePin(SR_LOAD_GPIO_Port, SR_LOAD_Pin, GPIO_PIN_SET);
	}
	HAL_GPIO_WritePin(SR_LOAD_GPIO_Port, SR_LOAD_Pin, GPIO_PIN_RESET);
}

void led_demo() {
	for (int j = 0; j < 20; j++) {
		for (int i = 0; i < 20; i++) {
			led_states[i] = !led_states[i];
			HAL_Delay(50);
		}
	}
}

void update_enable_leds() {
	uint8_t enable_leds[2][2] =
			{ { LED_EN_B, LED_EN_D }, { LED_EN_A, LED_EN_C } };
	bool enabled;
	for (int channel = 0; channel < 2; channel++) {
		enabled = voltages[channel] < VOLTAGE_NONE;
		for (uint8_t i = 0; i < 2; i++) {
			led_states[enable_leds[channel][i]] = enabled;
		}
	}
	if (modes[3] == CHANNEL_MODE_SPY) {
		led_states[LED_EN_B] = 0;
		led_states[LED_EN_C] = 0;
	}
}

void change_voltage(uint_fast8_t channel, voltage_t voltage) {
	uint8_t voltage_leds[2][4] = { { 1, 2, 5, 6 }, { 11, 10, 15, 14 } };
	uint16_t voltage_pwm[] = { PWM_MAX, PWM_MAX * 0.795, PWM_MAX * 0.553, 0,
			PWM_MAX };
	TIM_HandleTypeDef* voltage_timer[] = { &htim1, &htim3 };
	uint16_t voltage_channel[] = { TIM_CHANNEL_4,
	TIM_CHANNEL_1 };
	GPIO_TypeDef* enable_port[] = { N_VDD1_EN_GPIO_Port,
	N_VDD2_EN_GPIO_Port };
	uint16_t enable_pin[] = { N_VDD1_EN_Pin, N_VDD2_EN_Pin };
	if (voltage == voltages[channel]) {
		voltage = VOLTAGE_NONE;
	}
	voltages[channel] = voltage;
	for (voltage_t i = 0; i < VOLTAGE_NONE; i++) {
		led_states[voltage_leds[channel][i]] = (i == voltage);
	}
	bool enabled = voltage < VOLTAGE_NONE;
	__HAL_TIM_SET_COMPARE(voltage_timer[channel], voltage_channel[channel],
			voltage_pwm[voltage]);
	HAL_GPIO_WritePin(enable_port[channel], enable_pin[channel], !enabled);
	update_enable_leds();
}

void shift_register_update() {
	uint8_t data = ((buzzer_enable[0] & 1) << 7) | ((buzzer_enable[1] & 1) << 6)
			| ((!iso_enabled & 1) << 5)
			| (((modes[3] == CHANNEL_MODE_SPY) & 1) << 4)
			| (((modes[1] != CHANNEL_MODE_UART) & 3) << 3)
			| (((modes[1] == CHANNEL_MODE_I2C) & 1) << 2)
			| (((modes[0] != CHANNEL_MODE_UART) & 1) << 1)
			| (((modes[0] == CHANNEL_MODE_I2C) & 1) << 0);
	shift_register_write(data);
}

void change_mode(uint_fast8_t channel, channel_mode_t mode) {
	uint8_t mode_leds[2][2] = { { 7, 3 }, { 8, 12 } };
	GPIO_TypeDef* n_pullup_en_ports[] = { N_I2C_PU_EN_A_GPIO_Port,
	N_I2C_PU_EN_B_GPIO_Port };
	uint16_t n_pullup_en_pins[] = { N_I2C_PU_EN_A_Pin, N_I2C_PU_EN_B_Pin };
	GPIO_TypeDef* spi_en_ports[] = { SPI_EN_A_GPIO_Port,
	SPI_EN_B_GPIO_Port };
	uint16_t spi_en_pins[] = { SPI_EN_A_Pin, SPI_EN_B_Pin };
	if (mode == modes[channel]) {
		mode = CHANNEL_MODE_UART;
	}
	modes[channel] = mode;
	if (mode == CHANNEL_MODE_SPY) {
		// change to spy mode -> reset mode of B channel
		modes[1] = CHANNEL_MODE_UART;
	} else if ((channel = 1) && (modes[3] == CHANNEL_MODE_SPY)) {
		// change B or C channel mode - reset spy mode
		modes[3] = CHANNEL_MODE_UART;
	}
	for (int ch = 0; ch < 2; ch++) {
		for (channel_mode_t i = 0; i < CHANNEL_MODE_UART; i++) {
			led_states[mode_leds[ch][i]] = (i == modes[ch]);
		}
	}
	update_enable_leds();
	led_states[LED_SPY] = modes[3] == CHANNEL_MODE_SPY;
	// TODO: mode set
	if (channel < 2) {
		HAL_GPIO_WritePin(n_pullup_en_ports[channel], n_pullup_en_pins[channel],
				mode != CHANNEL_MODE_I2C);
		HAL_GPIO_WritePin(spi_en_ports[channel], spi_en_pins[channel],
				mode == CHANNEL_MODE_SPI);
	}
	shift_register_update();
}

void change_buzzer_mode(buzzer_mode_t mode) {
	static const uint8_t mode_leds[2] = { 4, 0 };
	buzzer_enable[mode] = !buzzer_enable[mode];
	led_states[mode_leds[mode]] = buzzer_enable[mode];
	shift_register_update();
}

void change_iso_mode() {
	iso_enabled = !iso_enabled;
	led_states[LED_ISO] = iso_enabled;
	shift_register_update();
}

/* USER CODE END 0 */

int main(void) {

	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */

	/* MCU Configuration----------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_SPI2_Init();
	MX_TIM6_Init();
	MX_TIM1_Init();
	MX_TIM3_Init();

	/* USER CODE BEGIN 2 */
	buttons_init();
	for (int i = 0; i < 20; i++) {
		led_states[i] = GPIO_PIN_RESET;
	}
	led_states[LED_ISO] = GPIO_PIN_SET;
	HAL_TIM_Base_Start_IT(&htim6);
	HAL_TIM_Base_Start(&htim1);
	HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_4);
	HAL_TIM_Base_Start(&htim3);
	HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
#if 1
		if (button_process_flag) {
			buttons_process();
			// Easter egg - led demo
			static int easter_cnt = 0;
			if (buttons_is_pressed(BUTTON_ISO) && buttons_is_pressed(BUTTON_TX)
					&& buttons_is_pressed(BUTTON_RX)) {
				easter_cnt++;
				if (easter_cnt >= 500) {
					led_demo();
					easter_cnt = 0;
				}
			} else {
				easter_cnt -= 10;
				if (easter_cnt < 0) {
					easter_cnt = 0;
				}
			}
			if (buttons_was_clicked(BUTTON_1V8_1)) {
				change_voltage(0, VOLTAGE_1V8);
			}
			if (buttons_was_clicked(BUTTON_1V8_2)) {
				change_voltage(1, VOLTAGE_1V8);
			}
			if (buttons_was_clicked(BUTTON_2V5_1)) {
				change_voltage(0, VOLTAGE_2V5);
			}
			if (buttons_was_clicked(BUTTON_2V5_2)) {
				change_voltage(1, VOLTAGE_2V5);
			}
			if (buttons_was_clicked(BUTTON_3V3_1)) {
				change_voltage(0, VOLTAGE_3V3);
			}
			if (buttons_was_clicked(BUTTON_3V3_2)) {
				change_voltage(1, VOLTAGE_3V3);
			}
			if (buttons_was_clicked(BUTTON_5V_1)) {
				change_voltage(0, VOLTAGE_5V0);
			}
			if (buttons_was_clicked(BUTTON_5V_2)) {
				change_voltage(1, VOLTAGE_5V0);
			}

			if (buttons_was_clicked(BUTTON_I2C_A)) {
				change_mode(0, CHANNEL_MODE_I2C);
			}
			if (buttons_was_clicked(BUTTON_I2C_B)) {
				change_mode(1, CHANNEL_MODE_I2C);
			}
			if (buttons_was_clicked(BUTTON_SPI_A)) {
				change_mode(0, CHANNEL_MODE_SPI);
			}
			if (buttons_was_clicked(BUTTON_SPI_B)) {
				change_mode(1, CHANNEL_MODE_SPI);
			}

			if (buttons_was_clicked(BUTTON_RX)) {
				change_buzzer_mode(BUZZER_RX);
			}
			if (buttons_was_clicked(BUTTON_TX)) {
				change_buzzer_mode(BUZZER_TX);
			}

			if (buttons_was_clicked(BUTTON_ISO)) {
				change_iso_mode();
			}
			if (buttons_was_clicked(BUTTON_SPY)) {
				change_mode(3, CHANNEL_MODE_SPY);
			}
			button_process_flag = false;
		}

#elif 0
		led_demo();
#endif
	}
	/* USER CODE END 3 */

}

/** System Clock Configuration
 */
void SystemClock_Config(void) {

	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = 16;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL12;
	RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV1;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	/**Configure the Systick interrupt time
	 */
	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000);

	/**Configure the Systick
	 */
	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void _Error_Handler(char * file, int line) {
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	while (1) {
	}
	/* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT

/**
 * @brief Reports the name of the source file and the source line number
 * where the assert_param error has occurred.
 * @param file: pointer to the source file name
 * @param line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t* file, uint32_t line)
{
	/* USER CODE BEGIN 6 */
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	/* USER CODE END 6 */

}

#endif

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
