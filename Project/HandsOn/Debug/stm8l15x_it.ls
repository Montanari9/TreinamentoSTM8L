   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  44                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  44                     ; 53 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 57 }
  53  0000 80            	iret
  75                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 68 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 72 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 106                     ; 79 {
 107                     	switch	.text
 108  0002               f_FLASH_IRQHandler:
 112                     ; 83 }
 115  0002 80            	iret
 138                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 138                     ; 90 {
 139                     	switch	.text
 140  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 144                     ; 94 }
 147  0003 80            	iret
 170                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 170                     ; 101 {
 171                     	switch	.text
 172  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 176                     ; 105 }
 179  0004 80            	iret
 202                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 202                     ; 112 {
 203                     	switch	.text
 204  0005               f_RTC_CSSLSE_IRQHandler:
 208                     ; 116 }
 211  0005 80            	iret
 234                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 234                     ; 123 {
 235                     	switch	.text
 236  0006               f_EXTIE_F_PVD_IRQHandler:
 240                     ; 127 }
 243  0006 80            	iret
 265                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 265                     ; 135 {
 266                     	switch	.text
 267  0007               f_EXTIB_G_IRQHandler:
 271                     ; 139 }
 274  0007 80            	iret
 296                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 296                     ; 147 {
 297                     	switch	.text
 298  0008               f_EXTID_H_IRQHandler:
 302                     ; 151 }
 305  0008 80            	iret
 327                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 327                     ; 159 {
 328                     	switch	.text
 329  0009               f_EXTI0_IRQHandler:
 333                     ; 163 }
 336  0009 80            	iret
 360                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 360                     ; 171 {
 361                     	switch	.text
 362  000a               f_EXTI1_IRQHandler:
 364  000a 8a            	push	cc
 365  000b 84            	pop	a
 366  000c a4bf          	and	a,#191
 367  000e 88            	push	a
 368  000f 86            	pop	cc
 369  0010 3b0002        	push	c_x+2
 370  0013 be00          	ldw	x,c_x
 371  0015 89            	pushw	x
 372  0016 3b0002        	push	c_y+2
 373  0019 be00          	ldw	x,c_y
 374  001b 89            	pushw	x
 377                     ; 175 	EXTI_ClearITPendingBit(EXTI_IT_Pin1);
 379  001c ae0002        	ldw	x,#2
 380  001f cd0000        	call	_EXTI_ClearITPendingBit
 382                     ; 176 	GPIO_ToggleBits(GPIOC,GPIO_Pin_7);	
 384  0022 4b80          	push	#128
 385  0024 ae500a        	ldw	x,#20490
 386  0027 cd0000        	call	_GPIO_ToggleBits
 388  002a 84            	pop	a
 389                     ; 177 }
 392  002b 85            	popw	x
 393  002c bf00          	ldw	c_y,x
 394  002e 320002        	pop	c_y+2
 395  0031 85            	popw	x
 396  0032 bf00          	ldw	c_x,x
 397  0034 320002        	pop	c_x+2
 398  0037 80            	iret
 420                     ; 184 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 420                     ; 185 {
 421                     	switch	.text
 422  0038               f_EXTI2_IRQHandler:
 426                     ; 189 }
 429  0038 80            	iret
 451                     ; 196 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 451                     ; 197 {
 452                     	switch	.text
 453  0039               f_EXTI3_IRQHandler:
 457                     ; 201 }
 460  0039 80            	iret
 482                     ; 208 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 482                     ; 209 {
 483                     	switch	.text
 484  003a               f_EXTI4_IRQHandler:
 488                     ; 213 }
 491  003a 80            	iret
 513                     ; 220 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 513                     ; 221 {
 514                     	switch	.text
 515  003b               f_EXTI5_IRQHandler:
 519                     ; 225 }
 522  003b 80            	iret
 544                     ; 232 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 544                     ; 233 {
 545                     	switch	.text
 546  003c               f_EXTI6_IRQHandler:
 550                     ; 237 }
 553  003c 80            	iret
 575                     ; 244 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 575                     ; 245 {
 576                     	switch	.text
 577  003d               f_EXTI7_IRQHandler:
 581                     ; 249 }
 584  003d 80            	iret
 606                     ; 255 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 606                     ; 256 {
 607                     	switch	.text
 608  003e               f_LCD_AES_IRQHandler:
 612                     ; 260 }
 615  003e 80            	iret
 638                     ; 266 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 638                     ; 267 {
 639                     	switch	.text
 640  003f               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 644                     ; 271 }
 647  003f 80            	iret
 670                     ; 278 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 670                     ; 279 {
 671                     	switch	.text
 672  0040               f_ADC1_COMP_IRQHandler:
 676                     ; 283 }
 679  0040 80            	iret
 703                     ; 290 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 703                     ; 291 {
 704                     	switch	.text
 705  0041               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 709                     ; 295 }
 712  0041 80            	iret
 735                     ; 302 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 735                     ; 303 {
 736                     	switch	.text
 737  0042               f_TIM2_CC_USART2_RX_IRQHandler:
 741                     ; 307 }
 744  0042 80            	iret
 768                     ; 315 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 768                     ; 316 {
 769                     	switch	.text
 770  0043               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 774                     ; 320 }
 777  0043 80            	iret
 800                     ; 326 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 800                     ; 327 {
 801                     	switch	.text
 802  0044               f_TIM3_CC_USART3_RX_IRQHandler:
 806                     ; 331 }
 809  0044 80            	iret
 832                     ; 337 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 832                     ; 338 {
 833                     	switch	.text
 834  0045               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 838                     ; 342 }
 841  0045 80            	iret
 863                     ; 348 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 863                     ; 349 {
 864                     	switch	.text
 865  0046               f_TIM1_CC_IRQHandler:
 869                     ; 353 }
 872  0046 80            	iret
 895                     ; 360 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 895                     ; 361 {
 896                     	switch	.text
 897  0047               f_TIM4_UPD_OVF_TRG_IRQHandler:
 901                     ; 365 }
 904  0047 80            	iret
 926                     ; 371 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 926                     ; 372 {
 927                     	switch	.text
 928  0048               f_SPI1_IRQHandler:
 932                     ; 376 }
 935  0048 80            	iret
 959                     ; 383 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 959                     ; 384 {
 960                     	switch	.text
 961  0049               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 965                     ; 388 }
 968  0049 80            	iret
 991                     ; 395 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 991                     ; 396 {
 992                     	switch	.text
 993  004a               f_USART1_RX_TIM5_CC_IRQHandler:
 997                     ; 400 }
1000  004a 80            	iret
1023                     ; 407 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1023                     ; 408 {
1024                     	switch	.text
1025  004b               f_I2C1_SPI2_IRQHandler:
1029                     ; 412 }
1032  004b 80            	iret
1044                     	xdef	f_I2C1_SPI2_IRQHandler
1045                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1046                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1047                     	xdef	f_SPI1_IRQHandler
1048                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1049                     	xdef	f_TIM1_CC_IRQHandler
1050                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1051                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1052                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1053                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1054                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1055                     	xdef	f_ADC1_COMP_IRQHandler
1056                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1057                     	xdef	f_LCD_AES_IRQHandler
1058                     	xdef	f_EXTI7_IRQHandler
1059                     	xdef	f_EXTI6_IRQHandler
1060                     	xdef	f_EXTI5_IRQHandler
1061                     	xdef	f_EXTI4_IRQHandler
1062                     	xdef	f_EXTI3_IRQHandler
1063                     	xdef	f_EXTI2_IRQHandler
1064                     	xdef	f_EXTI1_IRQHandler
1065                     	xdef	f_EXTI0_IRQHandler
1066                     	xdef	f_EXTID_H_IRQHandler
1067                     	xdef	f_EXTIB_G_IRQHandler
1068                     	xdef	f_EXTIE_F_PVD_IRQHandler
1069                     	xdef	f_RTC_CSSLSE_IRQHandler
1070                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1071                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1072                     	xdef	f_FLASH_IRQHandler
1073                     	xdef	f_TRAP_IRQHandler
1074                     	xdef	f_NonHandledInterrupt
1075                     	xref	_GPIO_ToggleBits
1076                     	xref	_EXTI_ClearITPendingBit
1077                     	xref.b	c_x
1078                     	xref.b	c_y
1097                     	end
