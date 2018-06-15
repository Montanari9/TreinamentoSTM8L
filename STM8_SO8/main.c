/**
  ******************************************************************************
  * @file     Project/STM8L10x_StdPeriph_Templates/main.c
  * @author   MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief    This file contains the firmware main function.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l10x.h"

/** @addtogroup STM8L10x_StdPeriph_Templates
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* MAIN.C file */
#include "stm8l10x.h"
#include "stm8l10x_gpio.h"
#include "stm8l10x_clk.h"
#ifdef _COSMIC_
 #define ASM _asm
#endif
#ifdef _IAR_
 #define ASM asm
#endif
/* This delay should be added just after reset to have access to SWIM pin
 and to be able to reprogram the device after power on (otherwise the
 device will be locked) */
#define STARTUP_SWIM_DELAY_5S \
 { \
 ASM(" PUSHW X \n" \
 " PUSH A \n" \
 " LDW X, #0xFFFF \n" \
 "loop1: LD A, #50 \n" \
 \
 "loop2: DEC A \n" \
 " JRNE loop2 \n" \
 \
 " DECW X \n" \
 " JRNE loop1 \n" \
 \
 " POP A \n" \
 " POPW X " );\
 }
/* not connected pins as output low state (the best EMC immunity)
(PA1, PA3, PA5, PB0, PB1, PB2, PB4, PC5, PC6, PD1, PD2, PD3, PD4, PD5,
 PD6, PD7)*/
#define CONFIG_UNUSED_PINS_STM8L001 							  \
{  																  \
 GPIOA->DDR |= GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5; 			  \
 GPIOB->DDR |= GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_4; \
 GPIOC->DDR |= GPIO_Pin_5 | GPIO_Pin_6; 						  \
 GPIOD->DDR |= GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 |\
 GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7; 							  \
}

/* example defines*/
//#define GPIO_LAB 
//#define EXTI_LAB 
//#define TIM4_LAB 
//#define UART_LAB 
#define LP_ACTIVE_HALT

/* pin for testing */
#define LED_PORT GPIOB
#define LED_PIN GPIO_Pin_3
#define KEY_PORT GPIOB
#define KEY_PIN GPIO_Pin_7


uint8_t KeyPressed = 0;
char recebe[3];
/* Example of firmware for STM8L001: recommended startup + test of pins
 functionality */
void main(void)
{
	uint16_t i;
	/* -------------STM8L001 startup-------------- */
	/* configure unbonded pins */
	CONFIG_UNUSED_PINS_STM8L001;
	/* delay for SWIM connection: ~5seconds */
	STARTUP_SWIM_DELAY_5S;
	/* ------------------------------------------- */
	/* initialize tested pin */
	GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Fast);


#ifdef EXTI_LAB	
	GPIO_Init(KEY_PORT,KEY_PIN,GPIO_Mode_In_FL_IT);
	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);
	enableInterrupts(); //enable interrupts
#endif

#ifdef TIM4_LAB	
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE); //enable TIM4 clock
	TIM4_TimeBaseInit(TIM4_Prescaler_16,124); //1KHz Time base
	TIM4_ITConfig(TIM4_IT_Update, ENABLE); //Enable overflow interrupt
	TIM4_Cmd(ENABLE); //start timer counter
	enableInterrupts(); //enable interrupts
#endif	

#ifdef UART_LAB	
 /* initialize UART */
	GPIO_Init(KEY_PORT,KEY_PIN,GPIO_Mode_In_FL_IT);
	GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//Rx: Input
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_High_Fast); // TxD: output
	CLK_PeripheralClockConfig(CLK_Peripheral_USART, ENABLE);
	USART_Init(9600, USART_WordLength_8D, USART_StopBits_1, USART_Parity_No,
	(USART_Mode_TypeDef)(USART_Mode_Rx | USART_Mode_Tx));
	USART_ITConfig(USART_IT_RXNE,ENABLE);
	USART_Cmd(ENABLE);
#endif

#ifdef LP_ACTIVE_HALT
	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
	GPIO_Init(KEY_PORT,KEY_PIN,GPIO_Mode_In_FL_IT);
	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);
	/* Initialization of AWU */
  /* LSI calibration for accurate auto wake up time base*/
  AWU_LSICalibrationConfig(38000);
  /* The delay corresponds to the time we will stay in Halt mode */
  AWU_Init(AWU_Timebase_12s);	
	enableInterrupts(); //enable interrupts
#endif
	/* Infinite loop */
	while (1)
	{			
#ifdef GPIO_LAB			
		/* delay */
		for(i=0; i<10000; i++);
		/* toggle with tested pin */
		GPIO_ToggleBits(LED_PORT, LED_PIN);
#endif 		

#ifdef EXTI_LAB	
	  if(KeyPressed){
			KeyPressed = 0;
			/* toggle with tested pin */
			GPIO_ToggleBits(LED_PORT, LED_PIN);
		}
#endif 

#ifdef UART_LAB 
		if((KEY_PORT->IDR & KEY_PIN)){
			USART_SendData8(0x55);
			while(USART_GetFlagStatus(USART_FLAG_TC) == RESET);
		}
		if(recebe[0] == 0x55){
			GPIO_SetBits(LED_PORT, LED_PIN);
			for(i=0; i<50000; i++);
			GPIO_ResetBits(LED_PORT, LED_PIN);
			for(i=0; i<50000; i++);
		}else{
			GPIO_SetBits(LED_PORT, LED_PIN);
			for(i=0; i<10000; i++);
			GPIO_ResetBits(LED_PORT, LED_PIN);
			for(i=0; i<10000; i++);
		}
#endif 		

#ifdef LP_ACTIVE_HALT
	if((KEY_PORT->IDR & KEY_PIN)){
		GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
		halt(); /* Program halted */
	}else{
		/* delay */
		for(i=0; i<10000; i++);
		/* toggle with tested pin */
		GPIO_ToggleBits(LED_PORT, LED_PIN);
	}
#endif
	}
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
       ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

    /* Infinite loop */
    while (1)
    {
    }
}
#endif

/**
  * @}
  */
  
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/