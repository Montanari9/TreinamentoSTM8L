   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     .const:	section	.text
  18  0000               _APR_Array:
  19  0000 00            	dc.b	0
  20  0001 08            	dc.b	8
  21  0002 10            	dc.b	16
  22  0003 20            	dc.b	32
  23  0004 3e            	dc.b	62
  24  0005 3e            	dc.b	62
  25  0006 3e            	dc.b	62
  26  0007 3e            	dc.b	62
  27  0008 3e            	dc.b	62
  28  0009 3e            	dc.b	62
  29  000a 3e            	dc.b	62
  30  000b 3e            	dc.b	62
  31  000c 3e            	dc.b	62
  32  000d 3d            	dc.b	61
  33  000e 3d            	dc.b	61
  34  000f 24            	dc.b	36
  35  0010 0e            	dc.b	14
  36  0011               _TBR_Array:
  37  0011 00            	dc.b	0
  38  0012 01            	dc.b	1
  39  0013 01            	dc.b	1
  40  0014 01            	dc.b	1
  41  0015 01            	dc.b	1
  42  0016 02            	dc.b	2
  43  0017 03            	dc.b	3
  44  0018 04            	dc.b	4
  45  0019 05            	dc.b	5
  46  001a 06            	dc.b	6
  47  001b 07            	dc.b	7
  48  001c 08            	dc.b	8
  49  001d 09            	dc.b	9
  50  001e 0a            	dc.b	10
  51  001f 0b            	dc.b	11
  52  0020 0e            	dc.b	14
  53  0021 0f            	dc.b	15
  82                     ; 73 void AWU_DeInit(void)
  82                     ; 74 {
  84                     .text:	section	.text,new
  85  0000               _AWU_DeInit:
  89                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  91  0000 725f50f0      	clr	20720
  92                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  94  0004 353f50f1      	mov	20721,#63
  95                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  97  0008 725f50f2      	clr	20722
  98                     ; 78 }
 101  000c 81            	ret
 263                     ; 86 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 87 {
 264                     .text:	section	.text,new
 265  0000               _AWU_Init:
 267  0000 89            	pushw	x
 268       00000000      OFST:	set	0
 271                     ; 89   assert_param(IS_AWU_TIMEBASE(AWU_TimeBase));
 273                     ; 92   AWU->CSR |= AWU_CSR_AWUEN;
 275  0001 721850f0      	bset	20720,#4
 276                     ; 95   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 278  0005 c650f2        	ld	a,20722
 279  0008 a4f0          	and	a,#240
 280  000a c750f2        	ld	20722,a
 281                     ; 96   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 283  000d 9f            	ld	a,xl
 284  000e 5f            	clrw	x
 285  000f 97            	ld	xl,a
 286  0010 c650f2        	ld	a,20722
 287  0013 da0011        	or	a,(_TBR_Array,x)
 288  0016 c750f2        	ld	20722,a
 289                     ; 99   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 291  0019 c650f1        	ld	a,20721
 292  001c a4c0          	and	a,#192
 293  001e c750f1        	ld	20721,a
 294                     ; 100   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 296  0021 7b02          	ld	a,(OFST+2,sp)
 297  0023 5f            	clrw	x
 298  0024 97            	ld	xl,a
 299  0025 c650f1        	ld	a,20721
 300  0028 da0000        	or	a,(_APR_Array,x)
 301  002b c750f1        	ld	20721,a
 302                     ; 102 }
 305  002e 85            	popw	x
 306  002f 81            	ret
 361                     ; 110 void AWU_Cmd(FunctionalState NewState)
 361                     ; 111 {
 362                     .text:	section	.text,new
 363  0000               _AWU_Cmd:
 367                     ; 112   assert_param(IS_FUNCTIONAL_STATE(NewState));
 369                     ; 114   if (NewState != DISABLE)
 371  0000 a30000        	cpw	x,#0
 372  0003 2706          	jreq	L331
 373                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 375  0005 721850f0      	bset	20720,#4
 377  0009 2004          	jra	L531
 378  000b               L331:
 379                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 381  000b 721950f0      	bres	20720,#4
 382  000f               L531:
 383                     ; 124 }
 386  000f 81            	ret
 439                     	switch	.const
 440  0022               L41:
 441  0022 000003e8      	dc.l	1000
 442                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 442                     ; 140 {
 443                     .text:	section	.text,new
 444  0000               _AWU_LSICalibrationConfig:
 446  0000 5206          	subw	sp,#6
 447       00000006      OFST:	set	6
 450                     ; 142   uint16_t lsifreqkhz = 0x0;
 452                     ; 143   uint16_t A = 0x0;
 454                     ; 146   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 456                     ; 148   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 458  0002 96            	ldw	x,sp
 459  0003 1c0009        	addw	x,#OFST+3
 460  0006 cd0000        	call	c_ltor
 462  0009 ae0022        	ldw	x,#L41
 463  000c cd0000        	call	c_ludv
 465  000f be02          	ldw	x,c_lreg+2
 466  0011 1f03          	ldw	(OFST-3,sp),x
 468                     ; 152   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 470  0013 1e03          	ldw	x,(OFST-3,sp)
 471  0015 54            	srlw	x
 472  0016 54            	srlw	x
 473  0017 1f05          	ldw	(OFST-1,sp),x
 475                     ; 154   if ((4U * A) >= ((lsifreqkhz - (4U * A)) *(1U + (2U * A))))
 477  0019 1e05          	ldw	x,(OFST-1,sp)
 478  001b 58            	sllw	x
 479  001c 58            	sllw	x
 480  001d 1f01          	ldw	(OFST-5,sp),x
 482  001f 1e03          	ldw	x,(OFST-3,sp)
 483  0021 72f001        	subw	x,(OFST-5,sp)
 484  0024 1605          	ldw	y,(OFST-1,sp)
 485  0026 9058          	sllw	y
 486  0028 905c          	incw	y
 487  002a cd0000        	call	c_imul
 489  002d 1605          	ldw	y,(OFST-1,sp)
 490  002f 9058          	sllw	y
 491  0031 9058          	sllw	y
 492  0033 bf00          	ldw	c_x,x
 493  0035 90b300        	cpw	y,c_x
 494  0038 2509          	jrult	L561
 495                     ; 156     AWU->APR = (uint8_t)(A - 2U);
 497  003a 7b06          	ld	a,(OFST+0,sp)
 498  003c a002          	sub	a,#2
 499  003e c750f1        	ld	20721,a
 501  0041 2006          	jra	L761
 502  0043               L561:
 503                     ; 160     AWU->APR = (uint8_t)(A - 1U);
 505  0043 7b06          	ld	a,(OFST+0,sp)
 506  0045 4a            	dec	a
 507  0046 c750f1        	ld	20721,a
 508  0049               L761:
 509                     ; 163 }
 512  0049 5b06          	addw	sp,#6
 513  004b 81            	ret
 536                     ; 170 void AWU_IdleModeEnable(void)
 536                     ; 171 {
 537                     .text:	section	.text,new
 538  0000               _AWU_IdleModeEnable:
 542                     ; 174   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 544  0000 721950f0      	bres	20720,#4
 545                     ; 177   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 547  0004 35f050f2      	mov	20722,#240
 548                     ; 179 }
 551  0008 81            	ret
 595                     ; 186 FlagStatus AWU_GetFlagStatus(void)
 595                     ; 187 {
 596                     .text:	section	.text,new
 597  0000               _AWU_GetFlagStatus:
 601                     ; 188   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 603  0000 c650f0        	ld	a,20720
 604  0003 a520          	bcp	a,#32
 605  0005 2603          	jrne	L22
 606  0007 5f            	clrw	x
 607  0008 2003          	jra	L42
 608  000a               L22:
 609  000a ae0001        	ldw	x,#1
 610  000d               L42:
 613  000d 81            	ret
 648                     	xdef	_TBR_Array
 649                     	xdef	_APR_Array
 650                     	xdef	_AWU_GetFlagStatus
 651                     	xdef	_AWU_IdleModeEnable
 652                     	xdef	_AWU_LSICalibrationConfig
 653                     	xdef	_AWU_Cmd
 654                     	xdef	_AWU_Init
 655                     	xdef	_AWU_DeInit
 656                     	xref.b	c_lreg
 657                     	xref.b	c_x
 676                     	xref	c_imul
 677                     	xref	c_ludv
 678                     	xref	c_ltor
 679                     	end
