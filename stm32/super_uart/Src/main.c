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

/* USER CODE BEGIN Includes */
#include <stdbool.h>
#include <stdint.h>
#include <buttons.h>
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
SPI_HandleTypeDef hspi2;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim6;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_SPI2_Init(void);
static void MX_TIM6_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM3_Init(void);

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

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

static volatile bool button_process_flag = false;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	static GPIO_TypeDef* col_ports[] = { COL1_GPIO_Port, COL2_GPIO_Port,
	COL3_GPIO_Port, COL4_GPIO_Port };
	static uint16_t col_pins[] = { COL1_Pin, COL2_Pin, COL3_Pin, COL4_Pin };
	static GPIO_TypeDef* led_ports[] = { LED1_GPIO_Port, LED2_GPIO_Port,
	LED3_GPIO_Port, LED4_GPIO_Port, LED5_GPIO_Port };
	static uint16_t led_pins[] = { LED1_Pin, LED2_Pin, LED3_Pin, LED4_Pin,
	LED5_Pin };
	static GPIO_TypeDef* sw_ports[] = { SW1_GPIO_Port, SW2_GPIO_Port,
	SW3_GPIO_Port, SW4_GPIO_Port };
	static uint16_t sw_pins[] = { SW1_Pin, SW2_Pin, SW3_Pin, SW4_Pin };
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

typedef enum {
	VOLTAGE_1V8, VOLTAGE_2V5, VOLTAGE_3V3, VOLTAGE_5V0, VOLTAGE_NONE
} voltage_t;
enum {
	PWM_MAX = 479
};
static voltage_t voltages[] = { VOLTAGE_NONE, VOLTAGE_NONE };
void change_voltage(uint_fast8_t channel, voltage_t voltage) {
	uint8_t voltage_leds[2][4] = { { 1, 2, 5, 6 }, { 11, 10, 15, 14 } };
	uint8_t enable_leds[2][2] =
			{ { LED_EN_B, LED_EN_D }, { LED_EN_A, LED_EN_C } };
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
	for (uint8_t i = 0; i < 2; i++) {
		led_states[enable_leds[channel][i]] = enabled;
	}
}

static bool spy_enabled = false;
void change_spy_mode();

typedef enum {
	CHANNEL_MODE_I2C, CHANNEL_MODE_SPI, CHANNEL_MODE_UART
} channel_mode_t;
static channel_mode_t modes[] = { CHANNEL_MODE_UART, CHANNEL_MODE_UART };
void change_mode(uint_fast8_t channel, channel_mode_t mode) {
	static const uint8_t mode_leds[2][2] = { { 7, 3 }, { 8, 12 } };
	if (mode == modes[channel]) {
		mode = CHANNEL_MODE_UART;
	}
	modes[channel] = mode;
	for (channel_mode_t i = 0; i < CHANNEL_MODE_UART; i++) {
		led_states[mode_leds[channel][i]] = (i == mode);
	}
	if ((channel == 1) && (mode != CHANNEL_MODE_UART) && spy_enabled) {
		change_spy_mode();
	}
	// TODO: mode set
}

static bool iso_enabled = true;

typedef enum {
	BUZZER_RX, BUZZER_TX
} buzzer_mode_t;
static bool buzzer_enable[] = { false, false };

shift_register_update() {
	uint8_t data = ((!iso_enabled & 1) << 5) | ((buzzer_enable[0] & 1) << 7)
			| ((buzzer_enable[1] & 1) << 6);
	shift_register_write(data);
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

void change_spy_mode() {
	spy_enabled = !spy_enabled;
	led_states[LED_SPY] = spy_enabled;
	if (spy_enabled) {
		change_mode(1, CHANNEL_MODE_UART);
	}
	// TODO: mode set
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
				change_spy_mode();
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

/* SPI2 init function */
static void MX_SPI2_Init(void) {

	/* SPI2 parameter configuration*/
	hspi2.Instance = SPI2;
	hspi2.Init.Mode = SPI_MODE_MASTER;
	hspi2.Init.Direction = SPI_DIRECTION_2LINES;
	hspi2.Init.DataSize = SPI_DATASIZE_8BIT;
	hspi2.Init.CLKPolarity = SPI_POLARITY_LOW;
	hspi2.Init.CLKPhase = SPI_PHASE_1EDGE;
	hspi2.Init.NSS = SPI_NSS_SOFT;
	hspi2.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_256;
	hspi2.Init.FirstBit = SPI_FIRSTBIT_MSB;
	hspi2.Init.TIMode = SPI_TIMODE_DISABLE;
	hspi2.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
	hspi2.Init.CRCPolynomial = 7;
	hspi2.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
	hspi2.Init.NSSPMode = SPI_NSS_PULSE_DISABLE;
	if (HAL_SPI_Init(&hspi2) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

}

/* TIM1 init function */
static void MX_TIM1_Init(void) {

	TIM_MasterConfigTypeDef sMasterConfig;
	TIM_OC_InitTypeDef sConfigOC;
	TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig;

	htim1.Instance = TIM1;
	htim1.Init.Prescaler = 0;
	htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim1.Init.Period = 479;
	htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim1.Init.RepetitionCounter = 0;
	htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	if (HAL_TIM_PWM_Init(&htim1) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig)
			!= HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 479;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
	sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
	if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_4)
			!= HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
	sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
	sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
	sBreakDeadTimeConfig.DeadTime = 0;
	sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
	sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
	sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
	if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig)
			!= HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	HAL_TIM_MspPostInit(&htim1);

}

/* TIM3 init function */
static void MX_TIM3_Init(void) {

	TIM_MasterConfigTypeDef sMasterConfig;
	TIM_OC_InitTypeDef sConfigOC;

	htim3.Instance = TIM3;
	htim3.Init.Prescaler = 0;
	htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim3.Init.Period = 479;
	htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	if (HAL_TIM_PWM_Init(&htim3) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig)
			!= HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 479;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1)
			!= HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

	HAL_TIM_MspPostInit(&htim3);

}

/* TIM6 init function */
static void MX_TIM6_Init(void) {

	htim6.Instance = TIM6;
	htim6.Init.Prescaler = 0;
	htim6.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim6.Init.Period = 47999;
	htim6.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	if (HAL_TIM_Base_Init(&htim6) != HAL_OK) {
		_Error_Handler(__FILE__, __LINE__);
	}

}

/** Configure pins as 
 * Analog
 * Input
 * Output
 * EVENT_OUT
 * EXTI
 * Free pins are configured automatically as Analog (this feature is enabled through
 * the Code Generation settings)
 */
static void MX_GPIO_Init(void) {

	GPIO_InitTypeDef GPIO_InitStruct;

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOC_CLK_ENABLE()
	;
	__HAL_RCC_GPIOF_CLK_ENABLE()
	;
	__HAL_RCC_GPIOA_CLK_ENABLE()
	;
	__HAL_RCC_GPIOB_CLK_ENABLE()
	;
	__HAL_RCC_GPIOD_CLK_ENABLE()
	;

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOC, COL2_Pin | CPLD_OE_Pin | COL3_Pin | COL4_Pin,
			GPIO_PIN_SET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOF, I2C_PU_EN_B_Pin | VDD1_SEL2_Pin | VDD1_SEL3_Pin,
			GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOC, SPI_EN_B_Pin | I2C_PU_EN_A_Pin | VDD2_SEL3_Pin,
			GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOA, N_VDD1_EN_Pin | N_FTDI_RESET_Pin | TXD_Pin,
			GPIO_PIN_SET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOA, LED1_Pin | LED2_Pin | LED5_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOB,
	LED3_Pin | LED4_Pin | SR_LOAD_Pin | VDD2_SEL2_Pin | SPI_EN_A_Pin,
			GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOB, N_ENUMERATE_Pin | N_VDD2_EN_Pin | COL1_Pin,
			GPIO_PIN_SET);

	/*Configure GPIO pins : N_PWREN_Pin SW2_Pin N_USB_SUSPEND_Pin SW1_Pin */
	GPIO_InitStruct.Pin = N_PWREN_Pin | SW2_Pin | N_USB_SUSPEND_Pin | SW1_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	/*Configure GPIO pins : PC14 PC5 PC6 PC10
	 PC11 */
	GPIO_InitStruct.Pin = GPIO_PIN_14 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_10
			| GPIO_PIN_11;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	/*Configure GPIO pins : COL2_Pin CPLD_OE_Pin SPI_EN_B_Pin COL3_Pin
	 COL4_Pin I2C_PU_EN_A_Pin VDD2_SEL3_Pin */
	GPIO_InitStruct.Pin = COL2_Pin | CPLD_OE_Pin | SPI_EN_B_Pin | COL3_Pin
			| COL4_Pin | I2C_PU_EN_A_Pin | VDD2_SEL3_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	/*Configure GPIO pins : I2C_PU_EN_B_Pin VDD1_SEL2_Pin VDD1_SEL3_Pin */
	GPIO_InitStruct.Pin = I2C_PU_EN_B_Pin | VDD1_SEL2_Pin | VDD1_SEL3_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOF, &GPIO_InitStruct);

	/*Configure GPIO pin : N_VDD1_ERR_Pin */
	GPIO_InitStruct.Pin = N_VDD1_ERR_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(N_VDD1_ERR_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pins : N_VDD1_EN_Pin N_FTDI_RESET_Pin LED1_Pin LED2_Pin
	 LED5_Pin TXD_Pin */
	GPIO_InitStruct.Pin = N_VDD1_EN_Pin | N_FTDI_RESET_Pin | LED1_Pin | LED2_Pin
			| LED5_Pin | TXD_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pins : SW3_Pin RXD_Pin SW4_Pin */
	GPIO_InitStruct.Pin = SW3_Pin | RXD_Pin | SW4_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pins : PA3 PA4 PA5 PA15 */
	GPIO_InitStruct.Pin = GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_15;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pins : PF4 PF5 */
	GPIO_InitStruct.Pin = GPIO_PIN_4 | GPIO_PIN_5;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOF, &GPIO_InitStruct);

	/*Configure GPIO pins : LED3_Pin LED4_Pin N_ENUMERATE_Pin SR_LOAD_Pin
	 VDD2_SEL2_Pin SPI_EN_A_Pin N_VDD2_EN_Pin COL1_Pin */
	GPIO_InitStruct.Pin = LED3_Pin | LED4_Pin | N_ENUMERATE_Pin | SR_LOAD_Pin
			| VDD2_SEL2_Pin | SPI_EN_A_Pin | N_VDD2_EN_Pin | COL1_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	/*Configure GPIO pins : PB2 PB11 PB14 PB9 */
	GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_11 | GPIO_PIN_14 | GPIO_PIN_9;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	/*Configure GPIO pin : PD2 */
	GPIO_InitStruct.Pin = GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

	/*Configure GPIO pin : N_VDD2_ERR_Pin */
	GPIO_InitStruct.Pin = N_VDD2_ERR_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(N_VDD2_ERR_GPIO_Port, &GPIO_InitStruct);

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
