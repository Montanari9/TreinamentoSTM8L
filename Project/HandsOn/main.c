/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
#include "stm8l_discovery_lcd.h"
#include "discover_board.h"
#include "delay.h"
#include "discover_functions.h"

uint8_t i;
uint16_t res;
float f_Vdd_appli ;


void Delay(u16 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

void Vref_show(float vdd)
{
  uint16_t tab[6];	
  uint16_t Vdd_mV ;
  
  Vdd_mV = (uint16_t)vdd;

  convert_into_char (Vdd_mV, tab);
	
  /* To add unit and decimal point  */
  tab[5] = 'V';
  tab[4] = ' ';
  tab[1] |= DOT; /* To add decimal point for display in volt */
  tab[0] = ' ';
	
  LCD_GLASS_DisplayStrDeci(tab);

}

main()
{
	/* Enable ADC clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
	
/*ADC configuration
  ADC configured as follow:
  - Channel VREF
  - Mode = Single ConversionMode(ContinuousConvMode disabled)
  - Resolution = 12Bit
  - Prescaler = /1
  - sampling time 9 */
	
	ADC_VrefintCmd(ENABLE);
  delay_10us(3);
  
  
  ADC_Cmd(ADC1, ENABLE);	 
  ADC_Init(ADC1, ADC_ConversionMode_Single,
  ADC_Resolution_12Bit, ADC_Prescaler_1);
  
  ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
  ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
  delay_10us(3);


	LCD_GLASS_Init();
	while (1){
		/* initialize result */
    res = 0;
		for(i=8; i>0; i--)
		{
			/* start ADC convertion by software */
			ADC_SoftwareStartConv(ADC1);
			/* wait until end-of-covertion */
			while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
			/* read ADC convertion result */
			res += ADC_GetConversionValue(ADC1);
		}
		res = res>>3;
		
    /* The theorical value 1.224 volt */
    f_Vdd_appli = (1.224/res) * 4096;		
		
		/* Vdd_appli in mV */  
		f_Vdd_appli *= 1000L;
		Vref_show(f_Vdd_appli);
		/* Tempo for display values*/
		delay_ms(100);
	}
}

