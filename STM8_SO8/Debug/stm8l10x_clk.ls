   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  51                     ; 68 void CLK_DeInit(void)
  51                     ; 69 {
  53                     .text:	section	.text,new
  54  0000               _CLK_DeInit:
  58                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  60  0000 350350c0      	mov	20672,#3
  61                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  63  0004 725f50c3      	clr	20675
  64                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  66  0008 725f50c5      	clr	20677
  67                     ; 73 }
  70  000c 81            	ret
 125                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 125                     ; 81 {
 126                     .text:	section	.text,new
 127  0000               _CLK_CCOCmd:
 131                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 133                     ; 85   if (NewState != DISABLE)
 135  0000 a30000        	cpw	x,#0
 136  0003 2706          	jreq	L74
 137                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 139  0005 721050c5      	bset	20677,#0
 141  0009 2004          	jra	L15
 142  000b               L74:
 143                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 145  000b 721150c5      	bres	20677,#0
 146  000f               L15:
 147                     ; 96 }
 150  000f 81            	ret
 255                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 255                     ; 114 {
 256                     .text:	section	.text,new
 257  0000               _CLK_PeripheralClockConfig:
 259  0000 89            	pushw	x
 260       00000000      OFST:	set	0
 263                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 265                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 267                     ; 119     if (NewState != DISABLE)
 269  0001 1e05          	ldw	x,(OFST+5,sp)
 270  0003 270a          	jreq	L711
 271                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 273  0005 c650c3        	ld	a,20675
 274  0008 1a02          	or	a,(OFST+2,sp)
 275  000a c750c3        	ld	20675,a
 277  000d 2009          	jra	L121
 278  000f               L711:
 279                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 281  000f 7b02          	ld	a,(OFST+2,sp)
 282  0011 43            	cpl	a
 283  0012 c450c3        	and	a,20675
 284  0015 c750c3        	ld	20675,a
 285  0018               L121:
 286                     ; 129 }
 289  0018 85            	popw	x
 290  0019 81            	ret
 365                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 365                     ; 142 {
 366                     .text:	section	.text,new
 367  0000               _CLK_MasterPrescalerConfig:
 371                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 373                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 375  0000 c650c0        	ld	a,20672
 376  0003 a4fc          	and	a,#252
 377  0005 c750c0        	ld	20672,a
 378                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 380  0008 9f            	ld	a,xl
 381  0009 c750c0        	ld	20672,a
 382                     ; 148 }
 385  000c 81            	ret
 458                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 458                     ; 162 {
 459                     .text:	section	.text,new
 460  0000               _CLK_CCOConfig:
 464                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 466                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 468  0000 c650c5        	ld	a,20677
 469  0003 a4f9          	and	a,#249
 470  0005 c750c5        	ld	20677,a
 471                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 473  0008 9f            	ld	a,xl
 474  0009 ca50c5        	or	a,20677
 475  000c c750c5        	ld	20677,a
 476                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 478  000f 721050c5      	bset	20677,#0
 479                     ; 174 }
 482  0013 81            	ret
 535                     ; 181 uint32_t CLK_GetClockFreq(void)
 535                     ; 182 {
 536                     .text:	section	.text,new
 537  0000               _CLK_GetClockFreq:
 539  0000 5209          	subw	sp,#9
 540       00000009      OFST:	set	9
 543                     ; 183   uint32_t clockfrequency = 0;
 545                     ; 184   uint8_t tmp = 0, presc = 0;
 549                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 551  0002 c650c0        	ld	a,20672
 552  0005 a403          	and	a,#3
 553  0007 6b09          	ld	(OFST+0,sp),a
 555                     ; 187   presc = HSIDivFactor[tmp];
 557  0009 7b09          	ld	a,(OFST+0,sp)
 558  000b 5f            	clrw	x
 559  000c 97            	ld	xl,a
 560  000d d60000        	ld	a,(_HSIDivFactor,x)
 561  0010 6b09          	ld	(OFST+0,sp),a
 563                     ; 188   clockfrequency = HSI_VALUE / presc;
 565  0012 7b09          	ld	a,(OFST+0,sp)
 566  0014 b703          	ld	c_lreg+3,a
 567  0016 3f02          	clr	c_lreg+2
 568  0018 3f01          	clr	c_lreg+1
 569  001a 3f00          	clr	c_lreg
 570  001c 96            	ldw	x,sp
 571  001d 1c0001        	addw	x,#OFST-8
 572  0020 cd0000        	call	c_rtol
 575  0023 ae2400        	ldw	x,#9216
 576  0026 bf02          	ldw	c_lreg+2,x
 577  0028 ae00f4        	ldw	x,#244
 578  002b bf00          	ldw	c_lreg,x
 579  002d 96            	ldw	x,sp
 580  002e 1c0001        	addw	x,#OFST-8
 581  0031 cd0000        	call	c_ludv
 583  0034 96            	ldw	x,sp
 584  0035 1c0005        	addw	x,#OFST-4
 585  0038 cd0000        	call	c_rtol
 588                     ; 190   return((uint32_t)clockfrequency);
 590  003b 96            	ldw	x,sp
 591  003c 1c0005        	addw	x,#OFST-4
 592  003f cd0000        	call	c_ltor
 596  0042 5b09          	addw	sp,#9
 597  0044 81            	ret
 622                     	xdef	_HSIDivFactor
 623                     	xdef	_CLK_GetClockFreq
 624                     	xdef	_CLK_CCOConfig
 625                     	xdef	_CLK_MasterPrescalerConfig
 626                     	xdef	_CLK_PeripheralClockConfig
 627                     	xdef	_CLK_CCOCmd
 628                     	xdef	_CLK_DeInit
 629                     	xref.b	c_lreg
 630                     	xref.b	c_x
 649                     	xref	c_ltor
 650                     	xref	c_ludv
 651                     	xref	c_rtol
 652                     	end
