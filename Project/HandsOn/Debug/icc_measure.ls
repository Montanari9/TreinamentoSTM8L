   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  45                     ; 33 void GPIO_LowPower_Config(void)
  45                     ; 34 {
  47                     	switch	.text
  48  0000               _GPIO_LowPower_Config:
  52                     ; 37   GPIO_Init(GPIOA,GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7 ,GPIO_Mode_Out_PP_Low_Slow);
  54  0000 4bc0          	push	#192
  55  0002 4bfc          	push	#252
  56  0004 ae5000        	ldw	x,#20480
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 40   GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  62  000b 4bc0          	push	#192
  63  000d 4bff          	push	#255
  64  000f ae5005        	ldw	x,#20485
  65  0012 cd0000        	call	_GPIO_Init
  67  0015 85            	popw	x
  68                     ; 43   GPIO_Init(GPIOC, GPIO_Pin_0|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5|GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
  70  0016 4bc0          	push	#192
  71  0018 4b6d          	push	#109
  72  001a ae500a        	ldw	x,#20490
  73  001d cd0000        	call	_GPIO_Init
  75  0020 85            	popw	x
  76                     ; 46   GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  78  0021 4bc0          	push	#192
  79  0023 4bff          	push	#255
  80  0025 ae500f        	ldw	x,#20495
  81  0028 cd0000        	call	_GPIO_Init
  83  002b 85            	popw	x
  84                     ; 49   GPIO_Init(GPIOE, GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
  86  002c 4bc0          	push	#192
  87  002e 4b2f          	push	#47
  88  0030 ae5014        	ldw	x,#20500
  89  0033 cd0000        	call	_GPIO_Init
  91  0036 85            	popw	x
  92                     ; 53   GPIO_Init(GPIOF,GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7 ,GPIO_Mode_Out_PP_Low_Slow);
  94  0037 4bc0          	push	#192
  95  0039 4bee          	push	#238
  96  003b ae5019        	ldw	x,#20505
  97  003e cd0000        	call	_GPIO_Init
  99  0041 85            	popw	x
 100                     ; 55   GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_High_Slow);
 102  0042 4bd0          	push	#208
 103  0044 4b02          	push	#2
 104  0046 ae500a        	ldw	x,#20490
 105  0049 cd0000        	call	_GPIO_Init
 107  004c 85            	popw	x
 108                     ; 56 }
 111  004d 81            	ret
 166                     ; 64 u16 ADC_Supply(void)
 166                     ; 65 {
 167                     	switch	.text
 168  004e               _ADC_Supply:
 170  004e 5203          	subw	sp,#3
 171       00000003      OFST:	set	3
 174                     ; 70   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 176  0050 ae1001        	ldw	x,#4097
 177  0053 cd0000        	call	_CLK_PeripheralClockConfig
 179                     ; 73   ADC_DeInit(ADC1);
 181  0056 ae5340        	ldw	x,#21312
 182  0059 cd0000        	call	_ADC_DeInit
 184                     ; 83   ADC_VrefintCmd(ENABLE);
 186  005c a601          	ld	a,#1
 187  005e cd0000        	call	_ADC_VrefintCmd
 189                     ; 84   delay_10us(3);
 191  0061 ae0003        	ldw	x,#3
 192  0064 cd0000        	call	_delay_10us
 194                     ; 87   ADC_Cmd(ADC1, ENABLE);	 
 196  0067 4b01          	push	#1
 197  0069 ae5340        	ldw	x,#21312
 198  006c cd0000        	call	_ADC_Cmd
 200  006f 84            	pop	a
 201                     ; 88   ADC_Init(ADC1, ADC_ConversionMode_Single,
 201                     ; 89   ADC_Resolution_12Bit, ADC_Prescaler_1);
 203  0070 4b00          	push	#0
 204  0072 4b00          	push	#0
 205  0074 4b00          	push	#0
 206  0076 ae5340        	ldw	x,#21312
 207  0079 cd0000        	call	_ADC_Init
 209  007c 5b03          	addw	sp,#3
 210                     ; 91   ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
 212  007e 4b01          	push	#1
 213  0080 4b01          	push	#1
 214  0082 ae5340        	ldw	x,#21312
 215  0085 cd0000        	call	_ADC_SamplingTimeConfig
 217  0088 85            	popw	x
 218                     ; 92   ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
 220  0089 4b01          	push	#1
 221  008b ae0010        	ldw	x,#16
 222  008e 89            	pushw	x
 223  008f ae5340        	ldw	x,#21312
 224  0092 cd0000        	call	_ADC_ChannelCmd
 226  0095 5b03          	addw	sp,#3
 227                     ; 93   delay_10us(3);
 229  0097 ae0003        	ldw	x,#3
 230  009a cd0000        	call	_delay_10us
 232                     ; 96   res = 0;
 234  009d 5f            	clrw	x
 235  009e 1f01          	ldw	(OFST-2,sp),x
 236                     ; 97   for(i=8; i>0; i--)
 238  00a0 a608          	ld	a,#8
 239  00a2 6b03          	ld	(OFST+0,sp),a
 240  00a4               L34:
 241                     ; 100     ADC_SoftwareStartConv(ADC1);
 243  00a4 ae5340        	ldw	x,#21312
 244  00a7 cd0000        	call	_ADC_SoftwareStartConv
 247  00aa               L35:
 248                     ; 102     while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
 250  00aa 4b01          	push	#1
 251  00ac ae5340        	ldw	x,#21312
 252  00af cd0000        	call	_ADC_GetFlagStatus
 254  00b2 5b01          	addw	sp,#1
 255  00b4 4d            	tnz	a
 256  00b5 27f3          	jreq	L35
 257                     ; 104     res += ADC_GetConversionValue(ADC1);
 259  00b7 ae5340        	ldw	x,#21312
 260  00ba cd0000        	call	_ADC_GetConversionValue
 262  00bd 72fb01        	addw	x,(OFST-2,sp)
 263  00c0 1f01          	ldw	(OFST-2,sp),x
 264                     ; 97   for(i=8; i>0; i--)
 266  00c2 0a03          	dec	(OFST+0,sp)
 269  00c4 0d03          	tnz	(OFST+0,sp)
 270  00c6 26dc          	jrne	L34
 271                     ; 108   ADC_VrefintCmd(DISABLE);
 273  00c8 4f            	clr	a
 274  00c9 cd0000        	call	_ADC_VrefintCmd
 276                     ; 110   ADC_DeInit(ADC1);
 278  00cc ae5340        	ldw	x,#21312
 279  00cf cd0000        	call	_ADC_DeInit
 281                     ; 113   ADC_SchmittTriggerConfig(ADC1, ADC_Channel_24, DISABLE);
 283  00d2 4b00          	push	#0
 284  00d4 ae0001        	ldw	x,#1
 285  00d7 89            	pushw	x
 286  00d8 ae5340        	ldw	x,#21312
 287  00db cd0000        	call	_ADC_SchmittTriggerConfig
 289  00de 5b03          	addw	sp,#3
 290                     ; 115   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 292  00e0 ae1000        	ldw	x,#4096
 293  00e3 cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 116   ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, DISABLE);
 297  00e6 4b00          	push	#0
 298  00e8 ae0010        	ldw	x,#16
 299  00eb 89            	pushw	x
 300  00ec ae5340        	ldw	x,#21312
 301  00ef cd0000        	call	_ADC_ChannelCmd
 303  00f2 5b03          	addw	sp,#3
 304                     ; 118   return (res>>3);
 306  00f4 1e01          	ldw	x,(OFST-2,sp)
 307  00f6 54            	srlw	x
 308  00f7 54            	srlw	x
 309  00f8 54            	srlw	x
 312  00f9 5b03          	addw	sp,#3
 313  00fb 81            	ret
 344                     ; 127 void ADC_Icc_Init(void)
 344                     ; 128 {
 345                     	switch	.text
 346  00fc               _ADC_Icc_Init:
 350                     ; 131   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 352  00fc ae1001        	ldw	x,#4097
 353  00ff cd0000        	call	_CLK_PeripheralClockConfig
 355                     ; 134   ADC_DeInit(ADC1);
 357  0102 ae5340        	ldw	x,#21312
 358  0105 cd0000        	call	_ADC_DeInit
 360                     ; 144   ADC_Cmd(ADC1, ENABLE);
 362  0108 4b01          	push	#1
 363  010a ae5340        	ldw	x,#21312
 364  010d cd0000        	call	_ADC_Cmd
 366  0110 84            	pop	a
 367                     ; 145   ADC_Init(ADC1, ADC_ConversionMode_Single,ADC_Resolution_12Bit, ADC_Prescaler_1);
 369  0111 4b00          	push	#0
 370  0113 4b00          	push	#0
 371  0115 4b00          	push	#0
 372  0117 ae5340        	ldw	x,#21312
 373  011a cd0000        	call	_ADC_Init
 375  011d 5b03          	addw	sp,#3
 376                     ; 147   ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
 378  011f 4b01          	push	#1
 379  0121 4b01          	push	#1
 380  0123 ae5340        	ldw	x,#21312
 381  0126 cd0000        	call	_ADC_SamplingTimeConfig
 383  0129 85            	popw	x
 384                     ; 148   ADC_ChannelCmd(ADC1, ADC_Channel_24, ENABLE);
 386  012a 4b01          	push	#1
 387  012c ae0001        	ldw	x,#1
 388  012f 89            	pushw	x
 389  0130 ae5340        	ldw	x,#21312
 390  0133 cd0000        	call	_ADC_ChannelCmd
 392  0136 5b03          	addw	sp,#3
 393                     ; 151   ADC_SchmittTriggerConfig(ADC1, ADC_Channel_24, DISABLE);
 395  0138 4b00          	push	#0
 396  013a ae0001        	ldw	x,#1
 397  013d 89            	pushw	x
 398  013e ae5340        	ldw	x,#21312
 399  0141 cd0000        	call	_ADC_SchmittTriggerConfig
 401  0144 5b03          	addw	sp,#3
 402                     ; 154   delay_10us(3);
 404  0146 ae0003        	ldw	x,#3
 405  0149 cd0000        	call	_delay_10us
 407                     ; 156 }
 410  014c 81            	ret
 438                     ; 165 void Halt_Init(void)
 438                     ; 166 {
 439                     	switch	.text
 440  014d               _Halt_Init:
 444                     ; 169   PWR->CSR2 = 0x2;
 446  014d 350250b3      	mov	20659,#2
 447                     ; 171   LCD_Cmd(DISABLE);
 449  0151 4f            	clr	a
 450  0152 cd0000        	call	_LCD_Cmd
 453  0155               L101:
 454                     ; 174   while ((LCD->CR3 & 0x40) != 0x00);
 456  0155 c65402        	ld	a,21506
 457  0158 a540          	bcp	a,#64
 458  015a 26f9          	jrne	L101
 459                     ; 177   GPIO_LowPower_Config();
 461  015c cd0000        	call	_GPIO_LowPower_Config
 463                     ; 180   CLK_RTCClockConfig(CLK_RTCCLKSource_Off, CLK_RTCCLKDiv_1);
 465  015f 5f            	clrw	x
 466  0160 cd0000        	call	_CLK_RTCClockConfig
 468                     ; 186     CLK_LSICmd(DISABLE);
 470  0163 4f            	clr	a
 471  0164 cd0000        	call	_CLK_LSICmd
 474  0167               L701:
 475                     ; 187     while ((CLK->ICKCR & 0x04) != 0x00);
 477  0167 c650c2        	ld	a,20674
 478  016a a504          	bcp	a,#4
 479  016c 26f9          	jrne	L701
 480                     ; 191   CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 482  016e ae1200        	ldw	x,#4608
 483  0171 cd0000        	call	_CLK_PeripheralClockConfig
 485                     ; 192   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 487  0174 ae1300        	ldw	x,#4864
 488  0177 cd0000        	call	_CLK_PeripheralClockConfig
 490                     ; 193 }
 493  017a 81            	ret
 563                     ; 202 u16 ADC_Icc_Test(u8 Mcu_State)
 563                     ; 203 {
 564                     	switch	.text
 565  017b               _ADC_Icc_Test:
 567  017b 88            	push	a
 568  017c 5203          	subw	sp,#3
 569       00000003      OFST:	set	3
 572                     ; 208   switch (Mcu_State)
 575                     ; 254       break;		
 576  017e 4a            	dec	a
 577  017f 270b          	jreq	L511
 578  0181 a002          	sub	a,#2
 579  0183 2713          	jreq	L711
 580  0185 4a            	dec	a
 581  0186 2724          	jreq	L121
 582  0188 2031          	jra	L351
 583  018a               L311:
 584                     ; 211     case MCU_RUN:
 584                     ; 212       break;
 586  018a 202f          	jra	L351
 587  018c               L511:
 588                     ; 215     case MCU_LPR:
 588                     ; 216       Halt_Init();
 590  018c adbf          	call	_Halt_Init
 592                     ; 217       sim();
 595  018e 9b            sim
 597                     ; 219       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 600  018f 7218500a      	bset	20490,#4
 601                     ; 222       LPR_init();
 603  0193 cd0000        	call	_LPR_init
 605                     ; 223       break;
 607  0196 2023          	jra	L351
 608  0198               L711:
 609                     ; 226     case MCU_HALT:
 609                     ; 227       /* Init for Halt mode  */
 609                     ; 228       Halt_Init();
 611  0198 adb3          	call	_Halt_Init
 613                     ; 229       sim();	
 616  019a 9b            sim
 618                     ; 232       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 621  019b 7218500a      	bset	20490,#4
 622                     ; 235       GPIO_LOW(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 624  019f 7219500a      	bres	20490,#4
 625                     ; 236       delay_10us(1);
 627  01a3 ae0001        	ldw	x,#1
 628  01a6 cd0000        	call	_delay_10us
 630                     ; 240       halt();
 633  01a9 8e            halt
 635                     ; 241       break;
 638  01aa 200f          	jra	L351
 639  01ac               L121:
 640                     ; 243     case MCU_LPR_LCD:
 640                     ; 244       PWR->CSR2 = 0x2;
 642  01ac 350250b3      	mov	20659,#2
 643                     ; 245       sim();
 646  01b0 9b            sim
 648                     ; 247       GPIO_LowPower_Config();
 651  01b1 cd0000        	call	_GPIO_LowPower_Config
 653                     ; 250       GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 655  01b4 7218500a      	bset	20490,#4
 656                     ; 253       LPR_init();
 658  01b8 cd0000        	call	_LPR_init
 660                     ; 254       break;		
 662  01bb               L351:
 663                     ; 257   sim();
 666  01bb 9b            sim
 668                     ; 260   ADC_Icc_Init();	
 671  01bc cd00fc        	call	_ADC_Icc_Init
 673                     ; 264   res = 0;
 675  01bf 5f            	clrw	x
 676  01c0 1f01          	ldw	(OFST-2,sp),x
 677                     ; 266   for(i=8; i>0; i--)
 679  01c2 a608          	ld	a,#8
 680  01c4 6b03          	ld	(OFST+0,sp),a
 681  01c6               L551:
 682                     ; 269     ADC_SoftwareStartConv(ADC1);
 684  01c6 ae5340        	ldw	x,#21312
 685  01c9 cd0000        	call	_ADC_SoftwareStartConv
 688  01cc               L561:
 689                     ; 272     while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
 691  01cc 4b01          	push	#1
 692  01ce ae5340        	ldw	x,#21312
 693  01d1 cd0000        	call	_ADC_GetFlagStatus
 695  01d4 5b01          	addw	sp,#1
 696  01d6 4d            	tnz	a
 697  01d7 27f3          	jreq	L561
 698                     ; 275     res += ADC_GetConversionValue(ADC1);
 700  01d9 ae5340        	ldw	x,#21312
 701  01dc cd0000        	call	_ADC_GetConversionValue
 703  01df 72fb01        	addw	x,(OFST-2,sp)
 704  01e2 1f01          	ldw	(OFST-2,sp),x
 705                     ; 266   for(i=8; i>0; i--)
 707  01e4 0a03          	dec	(OFST+0,sp)
 710  01e6 0d03          	tnz	(OFST+0,sp)
 711  01e8 26dc          	jrne	L551
 712                     ; 279   GPIO_HIGH(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
 714  01ea 7218500a      	bset	20490,#4
 715                     ; 281   GPIO_Init(BUTTON_GPIO_PORT, USER_GPIO_PIN,GPIO_Mode_In_FL_IT);
 717  01ee 4b20          	push	#32
 718  01f0 4b02          	push	#2
 719  01f2 ae500a        	ldw	x,#20490
 720  01f5 cd0000        	call	_GPIO_Init
 722  01f8 85            	popw	x
 723                     ; 283   rim();
 726  01f9 9a            rim
 728                     ; 286   ADC_Cmd(ADC1, DISABLE);
 731  01fa 4b00          	push	#0
 732  01fc ae5340        	ldw	x,#21312
 733  01ff cd0000        	call	_ADC_Cmd
 735  0202 84            	pop	a
 736                     ; 288   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 738  0203 ae1000        	ldw	x,#4096
 739  0206 cd0000        	call	_CLK_PeripheralClockConfig
 741                     ; 290   if (Mcu_State !=MCU_LPR_LCD)
 743  0209 7b04          	ld	a,(OFST+1,sp)
 744  020b a104          	cp	a,#4
 745  020d 2709          	jreq	L171
 746                     ; 292     CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 748  020f ae1201        	ldw	x,#4609
 749  0212 cd0000        	call	_CLK_PeripheralClockConfig
 751                     ; 293     LCD_GLASS_Init();
 753  0215 cd0000        	call	_LCD_GLASS_Init
 755  0218               L171:
 756                     ; 296   return (res>>3);
 758  0218 1e01          	ldw	x,(OFST-2,sp)
 759  021a 54            	srlw	x
 760  021b 54            	srlw	x
 761  021c 54            	srlw	x
 764  021d 5b04          	addw	sp,#4
 765  021f 81            	ret
 778                     	xref	_LCD_GLASS_Init
 779                     	xdef	_Halt_Init
 780                     	xref	_LPR_init
 781                     	xref	_delay_10us
 782                     	xdef	_GPIO_LowPower_Config
 783                     	xdef	_ADC_Icc_Test
 784                     	xdef	_ADC_Icc_Init
 785                     	xdef	_ADC_Supply
 786                     	xref	_LCD_Cmd
 787                     	xref	_GPIO_Init
 788                     	xref	_CLK_PeripheralClockConfig
 789                     	xref	_CLK_RTCClockConfig
 790                     	xref	_CLK_LSICmd
 791                     	xref	_ADC_GetFlagStatus
 792                     	xref	_ADC_GetConversionValue
 793                     	xref	_ADC_SchmittTriggerConfig
 794                     	xref	_ADC_SamplingTimeConfig
 795                     	xref	_ADC_ChannelCmd
 796                     	xref	_ADC_VrefintCmd
 797                     	xref	_ADC_SoftwareStartConv
 798                     	xref	_ADC_Cmd
 799                     	xref	_ADC_Init
 800                     	xref	_ADC_DeInit
 819                     	end
