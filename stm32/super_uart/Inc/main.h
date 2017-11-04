/**
  ******************************************************************************
  * File Name          : main.hpp
  * Description        : This file contains the common defines of the application
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
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H
  /* Includes ------------------------------------------------------------------*/

/* Includes ------------------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/

#define N_PWREN_Pin GPIO_PIN_13
#define N_PWREN_GPIO_Port GPIOC
#define COL2_Pin GPIO_PIN_15
#define COL2_GPIO_Port GPIOC
#define I2C_PU_EN_B_Pin GPIO_PIN_0
#define I2C_PU_EN_B_GPIO_Port GPIOF
#define N_VDD1_ERR_Pin GPIO_PIN_1
#define N_VDD1_ERR_GPIO_Port GPIOF
#define SW2_Pin GPIO_PIN_0
#define SW2_GPIO_Port GPIOC
#define CPLD_OE_Pin GPIO_PIN_1
#define CPLD_OE_GPIO_Port GPIOC
#define SPI_EN_B_Pin GPIO_PIN_2
#define SPI_EN_B_GPIO_Port GPIOC
#define N_USB_SUSPEND_Pin GPIO_PIN_3
#define N_USB_SUSPEND_GPIO_Port GPIOC
#define N_VDD1_EN_Pin GPIO_PIN_0
#define N_VDD1_EN_GPIO_Port GPIOA
#define SW3_Pin GPIO_PIN_1
#define SW3_GPIO_Port GPIOA
#define N_FTDI_RESET_Pin GPIO_PIN_2
#define N_FTDI_RESET_GPIO_Port GPIOA
#define LED1_Pin GPIO_PIN_6
#define LED1_GPIO_Port GPIOA
#define LED2_Pin GPIO_PIN_7
#define LED2_GPIO_Port GPIOA
#define SW1_Pin GPIO_PIN_4
#define SW1_GPIO_Port GPIOC
#define LED3_Pin GPIO_PIN_0
#define LED3_GPIO_Port GPIOB
#define LED4_Pin GPIO_PIN_1
#define LED4_GPIO_Port GPIOB
#define N_ENUMERATE_Pin GPIO_PIN_10
#define N_ENUMERATE_GPIO_Port GPIOB
#define SR_LOAD_Pin GPIO_PIN_12
#define SR_LOAD_GPIO_Port GPIOB
#define SR_CLK_Pin GPIO_PIN_13
#define SR_CLK_GPIO_Port GPIOB
#define SR_DATA_Pin GPIO_PIN_15
#define SR_DATA_GPIO_Port GPIOB
#define COL3_Pin GPIO_PIN_7
#define COL3_GPIO_Port GPIOC
#define COL4_Pin GPIO_PIN_8
#define COL4_GPIO_Port GPIOC
#define I2C_PU_EN_A_Pin GPIO_PIN_9
#define I2C_PU_EN_A_GPIO_Port GPIOC
#define LED5_Pin GPIO_PIN_8
#define LED5_GPIO_Port GPIOA
#define TXD_Pin GPIO_PIN_9
#define TXD_GPIO_Port GPIOA
#define RXD_Pin GPIO_PIN_10
#define RXD_GPIO_Port GPIOA
#define VDD1_SEL1_Pin GPIO_PIN_11
#define VDD1_SEL1_GPIO_Port GPIOA
#define SW4_Pin GPIO_PIN_12
#define SW4_GPIO_Port GPIOA
#define VDD1_SEL2_Pin GPIO_PIN_6
#define VDD1_SEL2_GPIO_Port GPIOF
#define VDD1_SEL3_Pin GPIO_PIN_7
#define VDD1_SEL3_GPIO_Port GPIOF
#define VDD2_SEL3_Pin GPIO_PIN_12
#define VDD2_SEL3_GPIO_Port GPIOC
#define VDD2_SEL2_Pin GPIO_PIN_3
#define VDD2_SEL2_GPIO_Port GPIOB
#define VDD2_SEL1_Pin GPIO_PIN_4
#define VDD2_SEL1_GPIO_Port GPIOB
#define SPI_EN_A_Pin GPIO_PIN_5
#define SPI_EN_A_GPIO_Port GPIOB
#define N_VDD2_EN_Pin GPIO_PIN_6
#define N_VDD2_EN_GPIO_Port GPIOB
#define N_VDD2_ERR_Pin GPIO_PIN_7
#define N_VDD2_ERR_GPIO_Port GPIOB
#define COL1_Pin GPIO_PIN_8
#define COL1_GPIO_Port GPIOB

/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the 
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
 extern "C" {
#endif
void _Error_Handler(char *, int);

#define Error_Handler() _Error_Handler(__FILE__, __LINE__)
#ifdef __cplusplus
}
#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

#endif /* __MAIN_H */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
