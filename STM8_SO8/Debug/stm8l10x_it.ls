   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  46                     ; 48 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  46                     ; 49 {
  47                     .text:	section	.text,new
  48  0000               f_NonHandledInterrupt:
  52                     ; 53 }
  55  0000 80            	iret
  77                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 62 {
  78                     .text:	section	.text,new
  79  0000               f_TRAP_IRQHandler:
  83                     ; 66 }
  86  0000 80            	iret
 108                     ; 73 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 108                     ; 74 {
 109                     .text:	section	.text,new
 110  0000               f_FLASH_IRQHandler:
 114                     ; 78 }
 117  0000 80            	iret
 140                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 140                     ; 86 {
 141                     .text:	section	.text,new
 142  0000               f_AWU_IRQHandler:
 144  0000 8a            	push	cc
 145  0001 84            	pop	a
 146  0002 a4bf          	and	a,#191
 147  0004 88            	push	a
 148  0005 86            	pop	cc
 149  0006 3b0002        	push	c_x+2
 150  0009 be00          	ldw	x,c_x
 151  000b 89            	pushw	x
 152  000c 3b0002        	push	c_y+2
 153  000f be00          	ldw	x,c_y
 154  0011 89            	pushw	x
 157                     ; 88   AWU_GetFlagStatus();
 159  0012 cd0000        	call	_AWU_GetFlagStatus
 161                     ; 89 }
 164  0015 85            	popw	x
 165  0016 bf00          	ldw	c_y,x
 166  0018 320002        	pop	c_y+2
 167  001b 85            	popw	x
 168  001c bf00          	ldw	c_x,x
 169  001e 320002        	pop	c_x+2
 170  0021 80            	iret
 192                     ; 96 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 192                     ; 97 {
 193                     .text:	section	.text,new
 194  0000               f_EXTIB_IRQHandler:
 198                     ; 101 }
 201  0000 80            	iret
 223                     ; 108 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 223                     ; 109 {
 224                     .text:	section	.text,new
 225  0000               f_EXTID_IRQHandler:
 229                     ; 113 }
 232  0000 80            	iret
 254                     ; 120 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 254                     ; 121 {
 255                     .text:	section	.text,new
 256  0000               f_EXTI0_IRQHandler:
 260                     ; 125 }
 263  0000 80            	iret
 285                     ; 132 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 285                     ; 133 {
 286                     .text:	section	.text,new
 287  0000               f_EXTI1_IRQHandler:
 291                     ; 137 }
 294  0000 80            	iret
 316                     ; 144 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 316                     ; 145 {
 317                     .text:	section	.text,new
 318  0000               f_EXTI2_IRQHandler:
 322                     ; 149 }
 325  0000 80            	iret
 347                     ; 156 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 347                     ; 157 {
 348                     .text:	section	.text,new
 349  0000               f_EXTI3_IRQHandler:
 353                     ; 161 }
 356  0000 80            	iret
 378                     ; 168 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 378                     ; 169 {
 379                     .text:	section	.text,new
 380  0000               f_EXTI4_IRQHandler:
 384                     ; 173 }
 387  0000 80            	iret
 409                     ; 180 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 409                     ; 181 {
 410                     .text:	section	.text,new
 411  0000               f_EXTI5_IRQHandler:
 415                     ; 185 }
 418  0000 80            	iret
 440                     ; 192 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 440                     ; 193 
 440                     ; 194 {
 441                     .text:	section	.text,new
 442  0000               f_EXTI6_IRQHandler:
 446                     ; 198 }
 449  0000 80            	iret
 473                     ; 206 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 473                     ; 207 {
 474                     .text:	section	.text,new
 475  0000               f_EXTI7_IRQHandler:
 477  0000 8a            	push	cc
 478  0001 84            	pop	a
 479  0002 a4bf          	and	a,#191
 480  0004 88            	push	a
 481  0005 86            	pop	cc
 482  0006 3b0002        	push	c_x+2
 483  0009 be00          	ldw	x,c_x
 484  000b 89            	pushw	x
 485  000c 3b0002        	push	c_y+2
 486  000f be00          	ldw	x,c_y
 487  0011 89            	pushw	x
 490                     ; 208 	EXTI_ClearITPendingBit(EXTI_IT_Pin7);
 492  0012 ae0080        	ldw	x,#128
 493  0015 cd0000        	call	_EXTI_ClearITPendingBit
 495                     ; 209 	KeyPressed = 1;
 497  0018 35010000      	mov	_KeyPressed,#1
 498                     ; 210 }
 501  001c 85            	popw	x
 502  001d bf00          	ldw	c_y,x
 503  001f 320002        	pop	c_y+2
 504  0022 85            	popw	x
 505  0023 bf00          	ldw	c_x,x
 506  0025 320002        	pop	c_x+2
 507  0028 80            	iret
 529                     ; 217 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 529                     ; 218 {
 530                     .text:	section	.text,new
 531  0000               f_COMP_IRQHandler:
 535                     ; 222 }
 538  0000 80            	iret
 561                     ; 229 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 561                     ; 230 {
 562                     .text:	section	.text,new
 563  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 567                     ; 234 }
 570  0000 80            	iret
 593                     ; 241 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 593                     ; 242 {
 594                     .text:	section	.text,new
 595  0000               f_TIM2_CAP_IRQHandler:
 599                     ; 246 }
 602  0000 80            	iret
 625                     ; 254 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 625                     ; 255 {
 626                     .text:	section	.text,new
 627  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 631                     ; 259 }
 634  0000 80            	iret
 657                     ; 265 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 657                     ; 266 {
 658                     .text:	section	.text,new
 659  0000               f_TIM3_CAP_IRQHandler:
 663                     ; 270 }
 666  0000 80            	iret
 668                     	bsct
 669  0000               L142_TimerUpDate:
 670  0000 03e8          	dc.w	1000
 705                     ; 279 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 705                     ; 280 {
 706                     .text:	section	.text,new
 707  0000               f_TIM4_UPD_OVF_IRQHandler:
 709  0000 8a            	push	cc
 710  0001 84            	pop	a
 711  0002 a4bf          	and	a,#191
 712  0004 88            	push	a
 713  0005 86            	pop	cc
 714  0006 3b0002        	push	c_x+2
 715  0009 be00          	ldw	x,c_x
 716  000b 89            	pushw	x
 717  000c 3b0002        	push	c_y+2
 718  000f be00          	ldw	x,c_y
 719  0011 89            	pushw	x
 722                     ; 282 	TIM4_ClearITPendingBit(TIM4_IT_Update);//clear interrupt request
 724  0012 ae0001        	ldw	x,#1
 725  0015 cd0000        	call	_TIM4_ClearITPendingBit
 727                     ; 283 	if(!TimerUpDate){
 729  0018 be00          	ldw	x,L142_TimerUpDate
 730  001a 2610          	jrne	L162
 731                     ; 284 		TimerUpDate = 1000;
 733  001c ae03e8        	ldw	x,#1000
 734  001f bf00          	ldw	L142_TimerUpDate,x
 735                     ; 286 		GPIO_ToggleBits(LED_PORT, LED_PIN);
 737  0021 4b08          	push	#8
 738  0023 ae5005        	ldw	x,#20485
 739  0026 cd0000        	call	_GPIO_ToggleBits
 741  0029 84            	pop	a
 743  002a 2007          	jra	L362
 744  002c               L162:
 745                     ; 288 		TimerUpDate--;
 747  002c be00          	ldw	x,L142_TimerUpDate
 748  002e 1d0001        	subw	x,#1
 749  0031 bf00          	ldw	L142_TimerUpDate,x
 750  0033               L362:
 751                     ; 290 }
 754  0033 85            	popw	x
 755  0034 bf00          	ldw	c_y,x
 756  0036 320002        	pop	c_y+2
 757  0039 85            	popw	x
 758  003a bf00          	ldw	c_x,x
 759  003c 320002        	pop	c_x+2
 760  003f 80            	iret
 782                     ; 297 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
 782                     ; 298 {
 783                     .text:	section	.text,new
 784  0000               f_SPI_IRQHandler:
 788                     ; 302 }
 791  0000 80            	iret
 814                     ; 308 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
 814                     ; 309 {
 815                     .text:	section	.text,new
 816  0000               f_USART_TX_IRQHandler:
 820                     ; 313 }
 823  0000 80            	iret
 849                     ; 321 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
 849                     ; 322 {
 850                     .text:	section	.text,new
 851  0000               f_USART_RX_IRQHandler:
 853  0000 8a            	push	cc
 854  0001 84            	pop	a
 855  0002 a4bf          	and	a,#191
 856  0004 88            	push	a
 857  0005 86            	pop	cc
 858  0006 3b0002        	push	c_x+2
 859  0009 be00          	ldw	x,c_x
 860  000b 89            	pushw	x
 861  000c 3b0002        	push	c_y+2
 862  000f be00          	ldw	x,c_y
 863  0011 89            	pushw	x
 866                     ; 323 	recebe[0] = USART_ReceiveData8();
 868  0012 cd0000        	call	_USART_ReceiveData8
 870  0015 b700          	ld	_recebe,a
 871                     ; 324 	USART_ClearITPendingBit();
 873  0017 cd0000        	call	_USART_ClearITPendingBit
 875                     ; 325 }
 878  001a 85            	popw	x
 879  001b bf00          	ldw	c_y,x
 880  001d 320002        	pop	c_y+2
 881  0020 85            	popw	x
 882  0021 bf00          	ldw	c_x,x
 883  0023 320002        	pop	c_x+2
 884  0026 80            	iret
 906                     ; 333 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
 906                     ; 334 {
 907                     .text:	section	.text,new
 908  0000               f_I2C_IRQHandler:
 912                     ; 338 }
 915  0000 80            	iret
 927                     	xref.b	_recebe
 928                     	xref.b	_KeyPressed
 929                     	xdef	f_I2C_IRQHandler
 930                     	xdef	f_USART_RX_IRQHandler
 931                     	xdef	f_USART_TX_IRQHandler
 932                     	xdef	f_SPI_IRQHandler
 933                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 934                     	xdef	f_TIM3_CAP_IRQHandler
 935                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 936                     	xdef	f_TIM2_CAP_IRQHandler
 937                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 938                     	xdef	f_COMP_IRQHandler
 939                     	xdef	f_EXTI7_IRQHandler
 940                     	xdef	f_EXTI6_IRQHandler
 941                     	xdef	f_EXTI5_IRQHandler
 942                     	xdef	f_EXTI4_IRQHandler
 943                     	xdef	f_EXTI3_IRQHandler
 944                     	xdef	f_EXTI2_IRQHandler
 945                     	xdef	f_EXTI1_IRQHandler
 946                     	xdef	f_EXTI0_IRQHandler
 947                     	xdef	f_EXTID_IRQHandler
 948                     	xdef	f_EXTIB_IRQHandler
 949                     	xdef	f_AWU_IRQHandler
 950                     	xdef	f_FLASH_IRQHandler
 951                     	xdef	f_TRAP_IRQHandler
 952                     	xdef	f_NonHandledInterrupt
 953                     	xref	_USART_ClearITPendingBit
 954                     	xref	_USART_ReceiveData8
 955                     	xref	_TIM4_ClearITPendingBit
 956                     	xref	_GPIO_ToggleBits
 957                     	xref	_EXTI_ClearITPendingBit
 958                     	xref	_AWU_GetFlagStatus
 959                     	xref.b	c_x
 960                     	xref.b	c_y
 979                     	end
