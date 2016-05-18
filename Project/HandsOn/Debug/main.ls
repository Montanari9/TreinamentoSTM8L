   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  54                     ; 17 void Delay(u16 nCount)
  54                     ; 18 {
  56                     	switch	.text
  57  0000               _Delay:
  59  0000 89            	pushw	x
  60       00000000      OFST:	set	0
  63  0001 2007          	jra	L13
  64  0003               L72:
  65                     ; 22     nCount--;
  67  0003 1e01          	ldw	x,(OFST+1,sp)
  68  0005 1d0001        	subw	x,#1
  69  0008 1f01          	ldw	(OFST+1,sp),x
  70  000a               L13:
  71                     ; 20   while (nCount != 0)
  73  000a 1e01          	ldw	x,(OFST+1,sp)
  74  000c 26f5          	jrne	L72
  75                     ; 24 }
  78  000e 85            	popw	x
  79  000f 81            	ret
 134                     ; 26 void Vref_show(float vdd)
 134                     ; 27 {
 135                     	switch	.text
 136  0010               _Vref_show:
 138  0010 520e          	subw	sp,#14
 139       0000000e      OFST:	set	14
 142                     ; 31   Vdd_mV = (uint16_t)vdd;
 144  0012 96            	ldw	x,sp
 145  0013 1c0011        	addw	x,#OFST+3
 146  0016 cd0000        	call	c_ltor
 148  0019 cd0000        	call	c_ftoi
 150  001c 1f01          	ldw	(OFST-13,sp),x
 151                     ; 33   convert_into_char (Vdd_mV, tab);
 153  001e 96            	ldw	x,sp
 154  001f 1c0003        	addw	x,#OFST-11
 155  0022 89            	pushw	x
 156  0023 1e03          	ldw	x,(OFST-11,sp)
 157  0025 cd0000        	call	_convert_into_char
 159  0028 85            	popw	x
 160                     ; 36   tab[5] = 'V';
 162  0029 ae0056        	ldw	x,#86
 163  002c 1f0d          	ldw	(OFST-1,sp),x
 164                     ; 37   tab[4] = ' ';
 166  002e ae0020        	ldw	x,#32
 167  0031 1f0b          	ldw	(OFST-3,sp),x
 168                     ; 38   tab[1] |= DOT; /* To add decimal point for display in volt */
 170  0033 7b05          	ld	a,(OFST-9,sp)
 171  0035 aa80          	or	a,#128
 172  0037 6b05          	ld	(OFST-9,sp),a
 173                     ; 39   tab[0] = ' ';
 175  0039 ae0020        	ldw	x,#32
 176  003c 1f03          	ldw	(OFST-11,sp),x
 177                     ; 41   LCD_GLASS_DisplayStrDeci(tab);
 179  003e 96            	ldw	x,sp
 180  003f 1c0003        	addw	x,#OFST-11
 181  0042 cd0000        	call	_LCD_GLASS_DisplayStrDeci
 183                     ; 43 }
 186  0045 5b0e          	addw	sp,#14
 187  0047 81            	ret
 226                     ; 45 main()
 226                     ; 46 {
 227                     	switch	.text
 228  0048               _main:
 230  0048 5204          	subw	sp,#4
 231       00000004      OFST:	set	4
 234                     ; 48   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 236  004a ae1001        	ldw	x,#4097
 237  004d cd0000        	call	_CLK_PeripheralClockConfig
 239                     ; 58 	ADC_VrefintCmd(ENABLE);
 241  0050 a601          	ld	a,#1
 242  0052 cd0000        	call	_ADC_VrefintCmd
 244                     ; 59   delay_10us(3);
 246  0055 ae0003        	ldw	x,#3
 247  0058 cd0000        	call	_delay_10us
 249                     ; 62   ADC_Cmd(ADC1, ENABLE);	 
 251  005b 4b01          	push	#1
 252  005d ae5340        	ldw	x,#21312
 253  0060 cd0000        	call	_ADC_Cmd
 255  0063 84            	pop	a
 256                     ; 63   ADC_Init(ADC1, ADC_ConversionMode_Single,
 256                     ; 64   ADC_Resolution_12Bit, ADC_Prescaler_1);
 258  0064 4b00          	push	#0
 259  0066 4b00          	push	#0
 260  0068 4b00          	push	#0
 261  006a ae5340        	ldw	x,#21312
 262  006d cd0000        	call	_ADC_Init
 264  0070 5b03          	addw	sp,#3
 265                     ; 66   ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_9Cycles);
 267  0072 4b01          	push	#1
 268  0074 4b01          	push	#1
 269  0076 ae5340        	ldw	x,#21312
 270  0079 cd0000        	call	_ADC_SamplingTimeConfig
 272  007c 85            	popw	x
 273                     ; 67   ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
 275  007d 4b01          	push	#1
 276  007f ae0010        	ldw	x,#16
 277  0082 89            	pushw	x
 278  0083 ae5340        	ldw	x,#21312
 279  0086 cd0000        	call	_ADC_ChannelCmd
 281  0089 5b03          	addw	sp,#3
 282                     ; 68   delay_10us(3);
 284  008b ae0003        	ldw	x,#3
 285  008e cd0000        	call	_delay_10us
 287                     ; 71 	LCD_GLASS_Init();
 289  0091 cd0000        	call	_LCD_GLASS_Init
 291  0094               L37:
 292                     ; 74     res = 0;
 294  0094 5f            	clrw	x
 295  0095 bf04          	ldw	_res,x
 296                     ; 75 		for(i=8; i>0; i--)
 298  0097 35080006      	mov	_i,#8
 299  009b               L77:
 300                     ; 78 			ADC_SoftwareStartConv(ADC1);
 302  009b ae5340        	ldw	x,#21312
 303  009e cd0000        	call	_ADC_SoftwareStartConv
 306  00a1               L701:
 307                     ; 80 			while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0 );
 309  00a1 4b01          	push	#1
 310  00a3 ae5340        	ldw	x,#21312
 311  00a6 cd0000        	call	_ADC_GetFlagStatus
 313  00a9 5b01          	addw	sp,#1
 314  00ab 4d            	tnz	a
 315  00ac 27f3          	jreq	L701
 316                     ; 82 			res += ADC_GetConversionValue(ADC1);
 318  00ae ae5340        	ldw	x,#21312
 319  00b1 cd0000        	call	_ADC_GetConversionValue
 321  00b4 72bb0004      	addw	x,_res
 322  00b8 bf04          	ldw	_res,x
 323                     ; 75 		for(i=8; i>0; i--)
 325  00ba 3a06          	dec	_i
 328  00bc 3d06          	tnz	_i
 329  00be 26db          	jrne	L77
 330                     ; 84 		res = res>>3;
 332  00c0 a603          	ld	a,#3
 333  00c2               L21:
 334  00c2 3404          	srl	_res
 335  00c4 3605          	rrc	_res+1
 336  00c6 4a            	dec	a
 337  00c7 26f9          	jrne	L21
 338                     ; 87     f_Vdd_appli = (1.224/res) * 4096;		
 340  00c9 be04          	ldw	x,_res
 341  00cb cd0000        	call	c_uitof
 343  00ce 96            	ldw	x,sp
 344  00cf 1c0001        	addw	x,#OFST-3
 345  00d2 cd0000        	call	c_rtol
 347  00d5 ae0004        	ldw	x,#L711
 348  00d8 cd0000        	call	c_ltor
 350  00db 96            	ldw	x,sp
 351  00dc 1c0001        	addw	x,#OFST-3
 352  00df cd0000        	call	c_fdiv
 354  00e2 ae0000        	ldw	x,#L721
 355  00e5 cd0000        	call	c_fmul
 357  00e8 ae0000        	ldw	x,#_f_Vdd_appli
 358  00eb cd0000        	call	c_rtol
 360                     ; 90 		f_Vdd_appli *= 1000L;
 362  00ee ae03e8        	ldw	x,#1000
 363  00f1 cd0000        	call	c_itof
 365  00f4 ae0000        	ldw	x,#_f_Vdd_appli
 366  00f7 cd0000        	call	c_fgmul
 368                     ; 91 		Vref_show(f_Vdd_appli);
 370  00fa be02          	ldw	x,_f_Vdd_appli+2
 371  00fc 89            	pushw	x
 372  00fd be00          	ldw	x,_f_Vdd_appli
 373  00ff 89            	pushw	x
 374  0100 cd0010        	call	_Vref_show
 376  0103 5b04          	addw	sp,#4
 377                     ; 93 		delay_ms(100);
 379  0105 ae0064        	ldw	x,#100
 380  0108 cd0000        	call	_delay_ms
 383  010b 2087          	jra	L37
 425                     	xdef	_main
 426                     	xdef	_Vref_show
 427                     	xdef	_Delay
 428                     	switch	.ubsct
 429  0000               _f_Vdd_appli:
 430  0000 00000000      	ds.b	4
 431                     	xdef	_f_Vdd_appli
 432  0004               _res:
 433  0004 0000          	ds.b	2
 434                     	xdef	_res
 435  0006               _i:
 436  0006 00            	ds.b	1
 437                     	xdef	_i
 438                     	xref	_convert_into_char
 439                     	xref	_delay_10us
 440                     	xref	_delay_ms
 441                     	xref	_LCD_GLASS_DisplayStrDeci
 442                     	xref	_LCD_GLASS_Init
 443                     	xref	_CLK_PeripheralClockConfig
 444                     	xref	_ADC_GetFlagStatus
 445                     	xref	_ADC_GetConversionValue
 446                     	xref	_ADC_SamplingTimeConfig
 447                     	xref	_ADC_ChannelCmd
 448                     	xref	_ADC_VrefintCmd
 449                     	xref	_ADC_SoftwareStartConv
 450                     	xref	_ADC_Cmd
 451                     	xref	_ADC_Init
 452                     .const:	section	.text
 453  0000               L721:
 454  0000 45800000      	dc.w	17792,0
 455  0004               L711:
 456  0004 3f9cac08      	dc.w	16284,-21496
 457                     	xref.b	c_x
 477                     	xref	c_fgmul
 478                     	xref	c_itof
 479                     	xref	c_fmul
 480                     	xref	c_fdiv
 481                     	xref	c_rtol
 482                     	xref	c_uitof
 483                     	xref	c_ftoi
 484                     	xref	c_ltor
 485                     	end
