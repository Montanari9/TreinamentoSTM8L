   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 55 void EXTI_DeInit(void)
  45                     ; 56 {
  47                     .text:	section	.text,new
  48  0000               _EXTI_DeInit:
  52                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  60  0008 725f50a2      	clr	20642
  61                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  63  000c 725f50a3      	clr	20643
  64                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  66  0010 725f50a4      	clr	20644
  67                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  69  0014 725f50a5      	clr	20645
  70                     ; 63 }
  73  0018 81            	ret
 177                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 177                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 177                     ; 86 {
 178                     .text:	section	.text,new
 179  0000               _EXTI_SetPortSensitivity:
 181  0000 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 187                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 189                     ; 93   if (EXTI_Port != EXTI_Port_B)
 191  0001 a30000        	cpw	x,#0
 192  0004 270a          	jreq	L76
 193                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 195  0006 c650a2        	ld	a,20642
 196  0009 a4f3          	and	a,#243
 197  000b c750a2        	ld	20642,a
 199  000e 2008          	jra	L17
 200  0010               L76:
 201                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 203  0010 c650a2        	ld	a,20642
 204  0013 a4fc          	and	a,#252
 205  0015 c750a2        	ld	20642,a
 206  0018               L17:
 207                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 209  0018 7b02          	ld	a,(OFST+2,sp)
 210  001a 5f            	clrw	x
 211  001b 97            	ld	xl,a
 212  001c 7b06          	ld	a,(OFST+6,sp)
 213  001e 5d            	tnzw	x
 214  001f 2704          	jreq	L01
 215  0021               L21:
 216  0021 48            	sll	a
 217  0022 5a            	decw	x
 218  0023 26fc          	jrne	L21
 219  0025               L01:
 220  0025 ca50a2        	or	a,20642
 221  0028 c750a2        	ld	20642,a
 222                     ; 105 }
 225  002b 85            	popw	x
 226  002c 81            	ret
 334                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 334                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 334                     ; 134 {
 335                     .text:	section	.text,new
 336  0000               _EXTI_SetPinSensitivity:
 338  0000 89            	pushw	x
 339       00000000      OFST:	set	0
 342                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 344                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 346                     ; 141   switch (EXTI_PinNum)
 349                     ; 175     default:
 349                     ; 176       break;
 350  0001 5d            	tnzw	x
 351  0002 2736          	jreq	L37
 352  0004 1d0002        	subw	x,#2
 353  0007 2750          	jreq	L57
 354  0009 1d0002        	subw	x,#2
 355  000c 276a          	jreq	L77
 356  000e 1d0002        	subw	x,#2
 357  0011 2603          	jrne	L65
 358  0013 cc0097        	jp	L101
 359  0016               L65:
 360  0016 1d000a        	subw	x,#10
 361  0019 2603          	jrne	L06
 362  001b cc00b4        	jp	L301
 363  001e               L06:
 364  001e 1d0002        	subw	x,#2
 365  0021 2603          	jrne	L26
 366  0023 cc00d3        	jp	L501
 367  0026               L26:
 368  0026 1d0002        	subw	x,#2
 369  0029 2603          	jrne	L46
 370  002b cc00f2        	jp	L701
 371  002e               L46:
 372  002e 1d0002        	subw	x,#2
 373  0031 2603          	jrne	L66
 374  0033 cc0111        	jp	L111
 375  0036               L66:
 376  0036 ac2e012e      	jpf	L561
 377  003a               L37:
 378                     ; 143     case EXTI_Pin_0:
 378                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 380  003a c650a0        	ld	a,20640
 381  003d a4fc          	and	a,#252
 382  003f c750a0        	ld	20640,a
 383                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 385  0042 7b02          	ld	a,(OFST+2,sp)
 386  0044 5f            	clrw	x
 387  0045 97            	ld	xl,a
 388  0046 7b06          	ld	a,(OFST+6,sp)
 389  0048 5d            	tnzw	x
 390  0049 2704          	jreq	L61
 391  004b               L02:
 392  004b 48            	sll	a
 393  004c 5a            	decw	x
 394  004d 26fc          	jrne	L02
 395  004f               L61:
 396  004f ca50a0        	or	a,20640
 397  0052 c750a0        	ld	20640,a
 398                     ; 146       break;
 400  0055 ac2e012e      	jpf	L561
 401  0059               L57:
 402                     ; 147     case EXTI_Pin_1:
 402                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 404  0059 c650a0        	ld	a,20640
 405  005c a4f3          	and	a,#243
 406  005e c750a0        	ld	20640,a
 407                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 409  0061 7b02          	ld	a,(OFST+2,sp)
 410  0063 5f            	clrw	x
 411  0064 97            	ld	xl,a
 412  0065 7b06          	ld	a,(OFST+6,sp)
 413  0067 5d            	tnzw	x
 414  0068 2704          	jreq	L22
 415  006a               L42:
 416  006a 48            	sll	a
 417  006b 5a            	decw	x
 418  006c 26fc          	jrne	L42
 419  006e               L22:
 420  006e ca50a0        	or	a,20640
 421  0071 c750a0        	ld	20640,a
 422                     ; 150       break;
 424  0074 ac2e012e      	jpf	L561
 425  0078               L77:
 426                     ; 151     case EXTI_Pin_2:
 426                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 428  0078 c650a0        	ld	a,20640
 429  007b a4cf          	and	a,#207
 430  007d c750a0        	ld	20640,a
 431                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 433  0080 7b02          	ld	a,(OFST+2,sp)
 434  0082 5f            	clrw	x
 435  0083 97            	ld	xl,a
 436  0084 7b06          	ld	a,(OFST+6,sp)
 437  0086 5d            	tnzw	x
 438  0087 2704          	jreq	L62
 439  0089               L03:
 440  0089 48            	sll	a
 441  008a 5a            	decw	x
 442  008b 26fc          	jrne	L03
 443  008d               L62:
 444  008d ca50a0        	or	a,20640
 445  0090 c750a0        	ld	20640,a
 446                     ; 154       break;
 448  0093 ac2e012e      	jpf	L561
 449  0097               L101:
 450                     ; 155     case EXTI_Pin_3:
 450                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 452  0097 c650a0        	ld	a,20640
 453  009a a43f          	and	a,#63
 454  009c c750a0        	ld	20640,a
 455                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 457  009f 7b02          	ld	a,(OFST+2,sp)
 458  00a1 5f            	clrw	x
 459  00a2 97            	ld	xl,a
 460  00a3 7b06          	ld	a,(OFST+6,sp)
 461  00a5 5d            	tnzw	x
 462  00a6 2704          	jreq	L23
 463  00a8               L43:
 464  00a8 48            	sll	a
 465  00a9 5a            	decw	x
 466  00aa 26fc          	jrne	L43
 467  00ac               L23:
 468  00ac ca50a0        	or	a,20640
 469  00af c750a0        	ld	20640,a
 470                     ; 158       break;
 472  00b2 207a          	jra	L561
 473  00b4               L301:
 474                     ; 159     case EXTI_Pin_4:
 474                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 476  00b4 c650a1        	ld	a,20641
 477  00b7 a4fc          	and	a,#252
 478  00b9 c750a1        	ld	20641,a
 479                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 481  00bc 7b02          	ld	a,(OFST+2,sp)
 482  00be a4ef          	and	a,#239
 483  00c0 5f            	clrw	x
 484  00c1 97            	ld	xl,a
 485  00c2 7b06          	ld	a,(OFST+6,sp)
 486  00c4 5d            	tnzw	x
 487  00c5 2704          	jreq	L63
 488  00c7               L04:
 489  00c7 48            	sll	a
 490  00c8 5a            	decw	x
 491  00c9 26fc          	jrne	L04
 492  00cb               L63:
 493  00cb ca50a1        	or	a,20641
 494  00ce c750a1        	ld	20641,a
 495                     ; 162       break;
 497  00d1 205b          	jra	L561
 498  00d3               L501:
 499                     ; 163     case EXTI_Pin_5:
 499                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 501  00d3 c650a1        	ld	a,20641
 502  00d6 a4f3          	and	a,#243
 503  00d8 c750a1        	ld	20641,a
 504                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 506  00db 7b02          	ld	a,(OFST+2,sp)
 507  00dd a4ef          	and	a,#239
 508  00df 5f            	clrw	x
 509  00e0 97            	ld	xl,a
 510  00e1 7b06          	ld	a,(OFST+6,sp)
 511  00e3 5d            	tnzw	x
 512  00e4 2704          	jreq	L24
 513  00e6               L44:
 514  00e6 48            	sll	a
 515  00e7 5a            	decw	x
 516  00e8 26fc          	jrne	L44
 517  00ea               L24:
 518  00ea ca50a1        	or	a,20641
 519  00ed c750a1        	ld	20641,a
 520                     ; 166       break;
 522  00f0 203c          	jra	L561
 523  00f2               L701:
 524                     ; 167     case EXTI_Pin_6:
 524                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 526  00f2 c650a1        	ld	a,20641
 527  00f5 a4cf          	and	a,#207
 528  00f7 c750a1        	ld	20641,a
 529                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 531  00fa 7b02          	ld	a,(OFST+2,sp)
 532  00fc a4ef          	and	a,#239
 533  00fe 5f            	clrw	x
 534  00ff 97            	ld	xl,a
 535  0100 7b06          	ld	a,(OFST+6,sp)
 536  0102 5d            	tnzw	x
 537  0103 2704          	jreq	L64
 538  0105               L05:
 539  0105 48            	sll	a
 540  0106 5a            	decw	x
 541  0107 26fc          	jrne	L05
 542  0109               L64:
 543  0109 ca50a1        	or	a,20641
 544  010c c750a1        	ld	20641,a
 545                     ; 170       break;
 547  010f 201d          	jra	L561
 548  0111               L111:
 549                     ; 171     case EXTI_Pin_7:
 549                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 551  0111 c650a1        	ld	a,20641
 552  0114 a43f          	and	a,#63
 553  0116 c750a1        	ld	20641,a
 554                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 556  0119 7b02          	ld	a,(OFST+2,sp)
 557  011b a4ef          	and	a,#239
 558  011d 5f            	clrw	x
 559  011e 97            	ld	xl,a
 560  011f 7b06          	ld	a,(OFST+6,sp)
 561  0121 5d            	tnzw	x
 562  0122 2704          	jreq	L25
 563  0124               L45:
 564  0124 48            	sll	a
 565  0125 5a            	decw	x
 566  0126 26fc          	jrne	L45
 567  0128               L25:
 568  0128 ca50a1        	or	a,20641
 569  012b c750a1        	ld	20641,a
 570                     ; 174       break;
 572  012e               L311:
 573                     ; 175     default:
 573                     ; 176       break;
 575  012e               L561:
 576                     ; 178 }
 579  012e 85            	popw	x
 580  012f 81            	ret
 684                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 684                     ; 194                                FunctionalState NewState)
 684                     ; 195 {
 685                     .text:	section	.text,new
 686  0000               _EXTI_SetHalfPortSelection:
 688  0000 89            	pushw	x
 689       00000000      OFST:	set	0
 692                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 694                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 696                     ; 200   if (NewState != DISABLE)
 698  0001 1e05          	ldw	x,(OFST+5,sp)
 699  0003 270a          	jreq	L532
 700                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 702  0005 c650a5        	ld	a,20645
 703  0008 1a02          	or	a,(OFST+2,sp)
 704  000a c750a5        	ld	20645,a
 706  000d 2009          	jra	L732
 707  000f               L532:
 708                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 710  000f 7b02          	ld	a,(OFST+2,sp)
 711  0011 43            	cpl	a
 712  0012 c450a5        	and	a,20645
 713  0015 c750a5        	ld	20645,a
 714  0018               L732:
 715                     ; 208 }
 718  0018 85            	popw	x
 719  0019 81            	ret
 765                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 765                     ; 219 {
 766                     .text:	section	.text,new
 767  0000               _EXTI_GetPortSensitivity:
 769  0000 88            	push	a
 770       00000001      OFST:	set	1
 773                     ; 220   uint8_t value = 0;
 775                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 777                     ; 225   if (EXTI_Port != EXTI_Port_B)
 779  0001 a30000        	cpw	x,#0
 780  0004 270b          	jreq	L362
 781                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 783  0006 c650a2        	ld	a,20642
 784  0009 44            	srl	a
 785  000a 44            	srl	a
 786  000b a403          	and	a,#3
 787  000d 6b01          	ld	(OFST+0,sp),a
 790  000f 2007          	jra	L562
 791  0011               L362:
 792                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 794  0011 c650a2        	ld	a,20642
 795  0014 a403          	and	a,#3
 796  0016 6b01          	ld	(OFST+0,sp),a
 798  0018               L562:
 799                     ; 233   return((EXTI_Trigger_TypeDef)value);
 801  0018 7b01          	ld	a,(OFST+0,sp)
 802  001a 5f            	clrw	x
 803  001b 97            	ld	xl,a
 806  001c 84            	pop	a
 807  001d 81            	ret
 853                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 853                     ; 251 {
 854                     .text:	section	.text,new
 855  0000               _EXTI_GetPinSensitivity:
 857  0000 88            	push	a
 858       00000001      OFST:	set	1
 861                     ; 252   uint8_t value = 0;
 863  0001 0f01          	clr	(OFST+0,sp)
 865                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 867                     ; 257   switch (EXTI_PinNum)
 870                     ; 283     default:
 870                     ; 284       break;
 871  0003 5d            	tnzw	x
 872  0004 2725          	jreq	L762
 873  0006 1d0002        	subw	x,#2
 874  0009 2729          	jreq	L172
 875  000b 1d0002        	subw	x,#2
 876  000e 272f          	jreq	L372
 877  0010 1d0002        	subw	x,#2
 878  0013 2736          	jreq	L572
 879  0015 1d000a        	subw	x,#10
 880  0018 273d          	jreq	L772
 881  001a 1d0002        	subw	x,#2
 882  001d 2741          	jreq	L103
 883  001f 1d0002        	subw	x,#2
 884  0022 2747          	jreq	L303
 885  0024 1d0002        	subw	x,#2
 886  0027 274e          	jreq	L503
 887  0029 2056          	jra	L533
 888  002b               L762:
 889                     ; 259     case EXTI_Pin_0:
 889                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 891  002b c650a0        	ld	a,20640
 892  002e a403          	and	a,#3
 893  0030 6b01          	ld	(OFST+0,sp),a
 895                     ; 261       break;
 897  0032 204d          	jra	L533
 898  0034               L172:
 899                     ; 262     case EXTI_Pin_1:
 899                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 901  0034 c650a0        	ld	a,20640
 902  0037 44            	srl	a
 903  0038 44            	srl	a
 904  0039 a403          	and	a,#3
 905  003b 6b01          	ld	(OFST+0,sp),a
 907                     ; 264       break;
 909  003d 2042          	jra	L533
 910  003f               L372:
 911                     ; 265     case EXTI_Pin_2:
 911                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 913  003f c650a0        	ld	a,20640
 914  0042 4e            	swap	a
 915  0043 a40f          	and	a,#15
 916  0045 a403          	and	a,#3
 917  0047 6b01          	ld	(OFST+0,sp),a
 919                     ; 267       break;
 921  0049 2036          	jra	L533
 922  004b               L572:
 923                     ; 268     case EXTI_Pin_3:
 923                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 925  004b c650a0        	ld	a,20640
 926  004e 4e            	swap	a
 927  004f 44            	srl	a
 928  0050 44            	srl	a
 929  0051 a403          	and	a,#3
 930  0053 6b01          	ld	(OFST+0,sp),a
 932                     ; 270       break;
 934  0055 202a          	jra	L533
 935  0057               L772:
 936                     ; 271     case EXTI_Pin_4:
 936                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 938  0057 c650a1        	ld	a,20641
 939  005a a403          	and	a,#3
 940  005c 6b01          	ld	(OFST+0,sp),a
 942                     ; 273       break;
 944  005e 2021          	jra	L533
 945  0060               L103:
 946                     ; 274     case EXTI_Pin_5:
 946                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 948  0060 c650a1        	ld	a,20641
 949  0063 44            	srl	a
 950  0064 44            	srl	a
 951  0065 a403          	and	a,#3
 952  0067 6b01          	ld	(OFST+0,sp),a
 954                     ; 276       break;
 956  0069 2016          	jra	L533
 957  006b               L303:
 958                     ; 277     case EXTI_Pin_6:
 958                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 960  006b c650a1        	ld	a,20641
 961  006e 4e            	swap	a
 962  006f a40f          	and	a,#15
 963  0071 a403          	and	a,#3
 964  0073 6b01          	ld	(OFST+0,sp),a
 966                     ; 279       break;
 968  0075 200a          	jra	L533
 969  0077               L503:
 970                     ; 280     case EXTI_Pin_7:
 970                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 972  0077 c650a1        	ld	a,20641
 973  007a 4e            	swap	a
 974  007b 44            	srl	a
 975  007c 44            	srl	a
 976  007d a403          	and	a,#3
 977  007f 6b01          	ld	(OFST+0,sp),a
 979                     ; 282       break;
 981  0081               L703:
 982                     ; 283     default:
 982                     ; 284       break;
 984  0081               L533:
 985                     ; 286   return((EXTI_Trigger_TypeDef)value);
 987  0081 7b01          	ld	a,(OFST+0,sp)
 988  0083 5f            	clrw	x
 989  0084 97            	ld	xl,a
 992  0085 84            	pop	a
 993  0086 81            	ret
1040                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
1040                     ; 300 {
1041                     .text:	section	.text,new
1042  0000               _EXTI_GetHalfPortSelection:
1044  0000 89            	pushw	x
1045       00000002      OFST:	set	2
1048                     ; 301   FunctionalState value = DISABLE;
1050                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
1052                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
1054  0001 9f            	ld	a,xl
1055  0002 c450a5        	and	a,20645
1056  0005 2707          	jreq	L163
1057                     ; 306     value = ENABLE;
1059  0007 ae0001        	ldw	x,#1
1060  000a 1f01          	ldw	(OFST-1,sp),x
1063  000c 2003          	jra	L363
1064  000e               L163:
1065                     ; 310     value = DISABLE;
1067  000e 5f            	clrw	x
1068  000f 1f01          	ldw	(OFST-1,sp),x
1070  0011               L363:
1071                     ; 313   return(value);
1073  0011 1e01          	ldw	x,(OFST-1,sp)
1076  0013 5b02          	addw	sp,#2
1077  0015 81            	ret
1219                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1219                     ; 333 {
1220                     .text:	section	.text,new
1221  0000               _EXTI_GetITStatus:
1223  0000 89            	pushw	x
1224  0001 5204          	subw	sp,#4
1225       00000004      OFST:	set	4
1228                     ; 334   ITStatus status = RESET;
1230                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1232                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1234  0003 9f            	ld	a,xl
1235  0004 a4f0          	and	a,#240
1236  0006 a1f0          	cp	a,#240
1237  0008 2618          	jrne	L744
1238                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1240  000a c650a4        	ld	a,20644
1241  000d 5f            	clrw	x
1242  000e 97            	ld	xl,a
1243  000f 1f01          	ldw	(OFST-3,sp),x
1245  0011 7b06          	ld	a,(OFST+2,sp)
1246  0013 a40f          	and	a,#15
1247  0015 5f            	clrw	x
1248  0016 97            	ld	xl,a
1249  0017 01            	rrwa	x,a
1250  0018 1402          	and	a,(OFST-2,sp)
1251  001a 01            	rrwa	x,a
1252  001b 1401          	and	a,(OFST-3,sp)
1253  001d 01            	rrwa	x,a
1254  001e 1f03          	ldw	(OFST-1,sp),x
1257  0020 2014          	jra	L154
1258  0022               L744:
1259                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1261  0022 7b06          	ld	a,(OFST+2,sp)
1262  0024 5f            	clrw	x
1263  0025 97            	ld	xl,a
1264  0026 1f01          	ldw	(OFST-3,sp),x
1266  0028 c650a3        	ld	a,20643
1267  002b 5f            	clrw	x
1268  002c 97            	ld	xl,a
1269  002d 01            	rrwa	x,a
1270  002e 1402          	and	a,(OFST-2,sp)
1271  0030 01            	rrwa	x,a
1272  0031 1401          	and	a,(OFST-3,sp)
1273  0033 01            	rrwa	x,a
1274  0034 1f03          	ldw	(OFST-1,sp),x
1276  0036               L154:
1277                     ; 346   return((ITStatus)status);
1279  0036 1e03          	ldw	x,(OFST-1,sp)
1282  0038 5b06          	addw	sp,#6
1283  003a 81            	ret
1319                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1319                     ; 366 {
1320                     .text:	section	.text,new
1321  0000               _EXTI_ClearITPendingBit:
1323  0000 89            	pushw	x
1324       00000000      OFST:	set	0
1327                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1329                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1331  0001 9f            	ld	a,xl
1332  0002 a4f0          	and	a,#240
1333  0004 a1f0          	cp	a,#240
1334  0006 2609          	jrne	L174
1335                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1337  0008 7b02          	ld	a,(OFST+2,sp)
1338  000a a40f          	and	a,#15
1339  000c c750a4        	ld	20644,a
1341  000f 2005          	jra	L374
1342  0011               L174:
1343                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1345  0011 7b02          	ld	a,(OFST+2,sp)
1346  0013 c750a3        	ld	20643,a
1347  0016               L374:
1348                     ; 378 }
1351  0016 85            	popw	x
1352  0017 81            	ret
1365                     	xdef	_EXTI_ClearITPendingBit
1366                     	xdef	_EXTI_GetITStatus
1367                     	xdef	_EXTI_GetHalfPortSelection
1368                     	xdef	_EXTI_GetPinSensitivity
1369                     	xdef	_EXTI_GetPortSensitivity
1370                     	xdef	_EXTI_SetHalfPortSelection
1371                     	xdef	_EXTI_SetPinSensitivity
1372                     	xdef	_EXTI_SetPortSensitivity
1373                     	xdef	_EXTI_DeInit
1392                     	end
