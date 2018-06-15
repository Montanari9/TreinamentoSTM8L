   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     	bsct
  18  0000               _KeyPressed:
  19  0000 00            	dc.b	0
  68                     ; 101 void main(void)
  68                     ; 102 {
  70                     .text:	section	.text,new
  71  0000               _main:
  73  0000 89            	pushw	x
  74       00000002      OFST:	set	2
  77                     ; 106 	CONFIG_UNUSED_PINS_STM8L001;
  79  0001 c65002        	ld	a,20482
  80  0004 aa2a          	or	a,#42
  81  0006 c75002        	ld	20482,a
  84  0009 c65007        	ld	a,20487
  85  000c aa17          	or	a,#23
  86  000e c75007        	ld	20487,a
  89  0011 c6500c        	ld	a,20492
  90  0014 aa60          	or	a,#96
  91  0016 c7500c        	ld	20492,a
  94  0019 c65011        	ld	a,20497
  95  001c aafe          	or	a,#254
  96  001e c75011        	ld	20497,a
  97                     ; 108 	STARTUP_SWIM_DELAY_5S;
 101  0021 89             PUSHW X 
 102  0022 88             PUSH A 
 103  0023 aeffff         LDW X, #0xFFFF 
 104  0026 a632          loop1: LD A, #50 
 105  0028 4a            loop2: DEC A 
 106  0029 26fd           JRNE loop2 
 107  002b 5a             DECW X 
 108  002c 26f8           JRNE loop1 
 109  002e 84             POP A 
 110  002f 85             POPW X 
 112                     ; 111 	GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
 115  0030 ae00e0        	ldw	x,#224
 116  0033 89            	pushw	x
 117  0034 4b08          	push	#8
 118  0036 ae5005        	ldw	x,#20485
 119  0039 cd0000        	call	_GPIO_Init
 121  003c 5b03          	addw	sp,#3
 122                     ; 141 	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
 124  003e ae0001        	ldw	x,#1
 125  0041 89            	pushw	x
 126  0042 ae0040        	ldw	x,#64
 127  0045 cd0000        	call	_CLK_PeripheralClockConfig
 129  0048 85            	popw	x
 130                     ; 142 	GPIO_Init(KEY_PORT,KEY_PIN,GPIO_Mode_In_FL_IT);
 132  0049 ae0020        	ldw	x,#32
 133  004c 89            	pushw	x
 134  004d 4b80          	push	#128
 135  004f ae5005        	ldw	x,#20485
 136  0052 cd0000        	call	_GPIO_Init
 138  0055 5b03          	addw	sp,#3
 139                     ; 143 	EXTI_SetPinSensitivity(EXTI_Pin_7,EXTI_Trigger_Rising);
 141  0057 ae0001        	ldw	x,#1
 142  005a 89            	pushw	x
 143  005b ae0016        	ldw	x,#22
 144  005e cd0000        	call	_EXTI_SetPinSensitivity
 146  0061 85            	popw	x
 147                     ; 146   AWU_LSICalibrationConfig(38000);
 149  0062 ae9470        	ldw	x,#38000
 150  0065 89            	pushw	x
 151  0066 ae0000        	ldw	x,#0
 152  0069 89            	pushw	x
 153  006a cd0000        	call	_AWU_LSICalibrationConfig
 155  006d 5b04          	addw	sp,#4
 156                     ; 148   AWU_Init(AWU_Timebase_12s);	
 158  006f ae000f        	ldw	x,#15
 159  0072 cd0000        	call	_AWU_Init
 161                     ; 149 	enableInterrupts(); //enable interrupts
 164  0075 9a            rim
 166  0076               L72:
 167                     ; 188 	if((KEY_PORT->IDR & KEY_PIN)){
 169  0076 c65006        	ld	a,20486
 170  0079 a580          	bcp	a,#128
 171  007b 2711          	jreq	L33
 172                     ; 189 		GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
 174  007d ae00e0        	ldw	x,#224
 175  0080 89            	pushw	x
 176  0081 4b08          	push	#8
 177  0083 ae5005        	ldw	x,#20485
 178  0086 cd0000        	call	_GPIO_Init
 180  0089 5b03          	addw	sp,#3
 181                     ; 190 		halt(); /* Program halted */
 184  008b 8e            halt
 188  008c 20e8          	jra	L72
 189  008e               L33:
 190                     ; 193 		for(i=0; i<10000; i++);
 192  008e 5f            	clrw	x
 193  008f 1f01          	ldw	(OFST-1,sp),x
 195  0091               L73:
 199  0091 1e01          	ldw	x,(OFST-1,sp)
 200  0093 1c0001        	addw	x,#1
 201  0096 1f01          	ldw	(OFST-1,sp),x
 205  0098 1e01          	ldw	x,(OFST-1,sp)
 206  009a a32710        	cpw	x,#10000
 207  009d 25f2          	jrult	L73
 208                     ; 195 		GPIO_ToggleBits(LED_PORT, LED_PIN);
 210  009f 4b08          	push	#8
 211  00a1 ae5005        	ldw	x,#20485
 212  00a4 cd0000        	call	_GPIO_ToggleBits
 214  00a7 84            	pop	a
 215  00a8 20cc          	jra	L72
 249                     	xdef	_main
 250                     	switch	.ubsct
 251  0000               _recebe:
 252  0000 000000        	ds.b	3
 253                     	xdef	_recebe
 254                     	xdef	_KeyPressed
 255                     	xref	_GPIO_ToggleBits
 256                     	xref	_GPIO_Init
 257                     	xref	_EXTI_SetPinSensitivity
 258                     	xref	_CLK_PeripheralClockConfig
 259                     	xref	_AWU_LSICalibrationConfig
 260                     	xref	_AWU_Init
 280                     	end
