   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 59 void USART_DeInit(void)
  45                     ; 60 {
  47                     .text:	section	.text,new
  48  0000               _USART_DeInit:
  52                     ; 63   (void)USART->SR;
  54  0000 c65230        	ld	a,21040
  55                     ; 64   (void)USART->DR;
  57  0003 c65231        	ld	a,21041
  58                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  60  0006 725f5233      	clr	21043
  61                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  63  000a 725f5232      	clr	21042
  64                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  66  000e 725f5234      	clr	21044
  67                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  69  0012 725f5235      	clr	21045
  70                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  72  0016 725f5236      	clr	21046
  73                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  75  001a 725f5237      	clr	21047
  76                     ; 73 }
  79  001e 81            	ret
 252                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 252                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 252                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 252                     ; 103 {
 253                     .text:	section	.text,new
 254  0000               _USART_Init:
 256  0000 5204          	subw	sp,#4
 257       00000004      OFST:	set	4
 260                     ; 104   uint32_t BaudRate_Mantissa = 0;
 262                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 264                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 266                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 268                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 270                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 272                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 274  0002 c65234        	ld	a,21044
 275  0005 a4e9          	and	a,#233
 276  0007 c75234        	ld	21044,a
 277                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 279  000a 7b0c          	ld	a,(OFST+8,sp)
 280  000c 1a10          	or	a,(OFST+12,sp)
 281  000e ca5234        	or	a,21044
 282  0011 c75234        	ld	21044,a
 283                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 285  0014 c65236        	ld	a,21046
 286  0017 a4cf          	and	a,#207
 287  0019 c75236        	ld	21046,a
 288                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 290  001c c65236        	ld	a,21046
 291  001f 1a0e          	or	a,(OFST+10,sp)
 292  0021 c75236        	ld	21046,a
 293                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 295  0024 725f5232      	clr	21042
 296                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 298  0028 c65233        	ld	a,21043
 299  002b a40f          	and	a,#15
 300  002d c75233        	ld	21043,a
 301                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 303  0030 c65233        	ld	a,21043
 304  0033 a4f0          	and	a,#240
 305  0035 c75233        	ld	21043,a
 306                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 308  0038 cd0000        	call	_CLK_GetClockFreq
 310  003b 96            	ldw	x,sp
 311  003c 1c0007        	addw	x,#OFST+3
 312  003f cd0000        	call	c_ludv
 314  0042 96            	ldw	x,sp
 315  0043 1c0001        	addw	x,#OFST-3
 316  0046 cd0000        	call	c_rtol
 319                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 321  0049 7b03          	ld	a,(OFST-1,sp)
 322  004b a4f0          	and	a,#240
 323  004d c75233        	ld	21043,a
 324                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 326  0050 7b04          	ld	a,(OFST+0,sp)
 327  0052 a40f          	and	a,#15
 328  0054 ca5233        	or	a,21043
 329  0057 c75233        	ld	21043,a
 330                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 332  005a 96            	ldw	x,sp
 333  005b 1c0001        	addw	x,#OFST-3
 334  005e cd0000        	call	c_ltor
 336  0061 a604          	ld	a,#4
 337  0063 cd0000        	call	c_lursh
 339  0066 b603          	ld	a,c_lreg+3
 340  0068 c75232        	ld	21042,a
 341                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 343  006b c65235        	ld	a,21045
 344  006e a4f3          	and	a,#243
 345  0070 c75235        	ld	21045,a
 346                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 348  0073 c65235        	ld	a,21045
 349  0076 1a12          	or	a,(OFST+14,sp)
 350  0078 c75235        	ld	21045,a
 351                     ; 147 }
 354  007b 5b04          	addw	sp,#4
 355  007d 81            	ret
 503                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 503                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 503                     ; 173 {
 504                     .text:	section	.text,new
 505  0000               _USART_ClockInit:
 507  0000 89            	pushw	x
 508       00000000      OFST:	set	0
 511                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 513                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 515                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 517                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 519                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 521  0001 c65236        	ld	a,21046
 522  0004 a4f8          	and	a,#248
 523  0006 c75236        	ld	21046,a
 524                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 526  0009 7b06          	ld	a,(OFST+6,sp)
 527  000b 1a08          	or	a,(OFST+8,sp)
 528  000d 1a0a          	or	a,(OFST+10,sp)
 529  000f ca5236        	or	a,21046
 530  0012 c75236        	ld	21046,a
 531                     ; 185   if (USART_Clock != USART_Clock_Disable)
 533  0015 a30000        	cpw	x,#0
 534  0018 2706          	jreq	L712
 535                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 537  001a 72165236      	bset	21046,#3
 539  001e 2004          	jra	L122
 540  0020               L712:
 541                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 543  0020 72175236      	bres	21046,#3
 544  0024               L122:
 545                     ; 193 }
 548  0024 85            	popw	x
 549  0025 81            	ret
 604                     ; 201 void USART_Cmd(FunctionalState NewState)
 604                     ; 202 {
 605                     .text:	section	.text,new
 606  0000               _USART_Cmd:
 610                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 612                     ; 205   if (NewState != DISABLE)
 614  0000 a30000        	cpw	x,#0
 615  0003 2706          	jreq	L152
 616                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 618  0005 721b5234      	bres	21044,#5
 620  0009 2004          	jra	L352
 621  000b               L152:
 622                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 624  000b 721a5234      	bset	21044,#5
 625  000f               L352:
 626                     ; 213 }
 629  000f 81            	ret
 740                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 740                     ; 230 {
 741                     .text:	section	.text,new
 742  0000               _USART_ITConfig:
 744  0000 89            	pushw	x
 745  0001 89            	pushw	x
 746       00000002      OFST:	set	2
 749                     ; 231   uint8_t uartreg, itpos = 0x00;
 751                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 753                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 755                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 757  0002 4f            	clr	a
 758  0003 01            	rrwa	x,a
 759  0004 9f            	ld	a,xl
 760  0005 6b01          	ld	(OFST-1,sp),a
 762                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 764  0007 7b04          	ld	a,(OFST+2,sp)
 765  0009 a40f          	and	a,#15
 766  000b 5f            	clrw	x
 767  000c 97            	ld	xl,a
 768  000d a601          	ld	a,#1
 769  000f 5d            	tnzw	x
 770  0010 2704          	jreq	L61
 771  0012               L02:
 772  0012 48            	sll	a
 773  0013 5a            	decw	x
 774  0014 26fc          	jrne	L02
 775  0016               L61:
 776  0016 6b02          	ld	(OFST+0,sp),a
 778                     ; 240   if (NewState != DISABLE)
 780  0018 1e07          	ldw	x,(OFST+5,sp)
 781  001a 271a          	jreq	L723
 782                     ; 243     if (uartreg == 0x01)
 784  001c 7b01          	ld	a,(OFST-1,sp)
 785  001e a101          	cp	a,#1
 786  0020 260a          	jrne	L133
 787                     ; 245       USART->CR1 |= itpos;
 789  0022 c65234        	ld	a,21044
 790  0025 1a02          	or	a,(OFST+0,sp)
 791  0027 c75234        	ld	21044,a
 793  002a 2024          	jra	L533
 794  002c               L133:
 795                     ; 250       USART->CR2 |= itpos;
 797  002c c65235        	ld	a,21045
 798  002f 1a02          	or	a,(OFST+0,sp)
 799  0031 c75235        	ld	21045,a
 800  0034 201a          	jra	L533
 801  0036               L723:
 802                     ; 256     if (uartreg == 0x01)
 804  0036 7b01          	ld	a,(OFST-1,sp)
 805  0038 a101          	cp	a,#1
 806  003a 260b          	jrne	L733
 807                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 809  003c 7b02          	ld	a,(OFST+0,sp)
 810  003e 43            	cpl	a
 811  003f c45234        	and	a,21044
 812  0042 c75234        	ld	21044,a
 814  0045 2009          	jra	L533
 815  0047               L733:
 816                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 818  0047 7b02          	ld	a,(OFST+0,sp)
 819  0049 43            	cpl	a
 820  004a c45235        	and	a,21045
 821  004d c75235        	ld	21045,a
 822  0050               L533:
 823                     ; 267 }
 826  0050 5b04          	addw	sp,#4
 827  0052 81            	ret
 850                     ; 275 uint8_t USART_ReceiveData8(void)
 850                     ; 276 {
 851                     .text:	section	.text,new
 852  0000               _USART_ReceiveData8:
 856                     ; 277   return USART->DR;
 858  0000 c65231        	ld	a,21041
 861  0003 81            	ret
 895                     ; 287 uint16_t USART_ReceiveData9(void)
 895                     ; 288 {
 896                     .text:	section	.text,new
 897  0000               _USART_ReceiveData9:
 899  0000 89            	pushw	x
 900       00000002      OFST:	set	2
 903                     ; 289   uint16_t temp = 0;
 905                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 907  0001 c65234        	ld	a,21044
 908  0004 5f            	clrw	x
 909  0005 a480          	and	a,#128
 910  0007 5f            	clrw	x
 911  0008 02            	rlwa	x,a
 912  0009 58            	sllw	x
 913  000a 1f01          	ldw	(OFST-1,sp),x
 915                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 917  000c c65231        	ld	a,21041
 918  000f 5f            	clrw	x
 919  0010 97            	ld	xl,a
 920  0011 01            	rrwa	x,a
 921  0012 1a02          	or	a,(OFST+0,sp)
 922  0014 01            	rrwa	x,a
 923  0015 1a01          	or	a,(OFST-1,sp)
 924  0017 01            	rrwa	x,a
 925  0018 01            	rrwa	x,a
 926  0019 a4ff          	and	a,#255
 927  001b 01            	rrwa	x,a
 928  001c a401          	and	a,#1
 929  001e 01            	rrwa	x,a
 932  001f 5b02          	addw	sp,#2
 933  0021 81            	ret
 969                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 969                     ; 302 {
 970                     .text:	section	.text,new
 971  0000               _USART_ReceiverWakeUpCmd:
 975                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 977                     ; 305   if (NewState != DISABLE)
 979  0000 a30000        	cpw	x,#0
 980  0003 2706          	jreq	L704
 981                     ; 308     USART->CR2 |= USART_CR2_RWU;
 983  0005 72125235      	bset	21045,#1
 985  0009 2004          	jra	L114
 986  000b               L704:
 987                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 989  000b 72135235      	bres	21045,#1
 990  000f               L114:
 991                     ; 315 }
 994  000f 81            	ret
1017                     ; 322 void USART_SendBreak(void)
1017                     ; 323 {
1018                     .text:	section	.text,new
1019  0000               _USART_SendBreak:
1023                     ; 324   USART->CR2 |= USART_CR2_SBK;
1025  0000 72105235      	bset	21045,#0
1026                     ; 325 }
1029  0004 81            	ret
1063                     ; 332 void USART_SendData8(uint8_t Data)
1063                     ; 333 {
1064                     .text:	section	.text,new
1065  0000               _USART_SendData8:
1069                     ; 335   USART->DR = Data;
1071  0000 c75231        	ld	21041,a
1072                     ; 336 }
1075  0003 81            	ret
1109                     ; 344 void USART_SendData9(uint16_t Data)
1109                     ; 345 {
1110                     .text:	section	.text,new
1111  0000               _USART_SendData9:
1113  0000 89            	pushw	x
1114       00000000      OFST:	set	0
1117                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1119                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1121  0001 721d5234      	bres	21044,#6
1122                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1124  0005 54            	srlw	x
1125  0006 54            	srlw	x
1126  0007 9f            	ld	a,xl
1127  0008 a440          	and	a,#64
1128  000a ca5234        	or	a,21044
1129  000d c75234        	ld	21044,a
1130                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1132  0010 7b02          	ld	a,(OFST+2,sp)
1133  0012 c75231        	ld	21041,a
1134                     ; 352 }
1137  0015 85            	popw	x
1138  0016 81            	ret
1172                     ; 360 void USART_SetAddress(uint8_t Address)
1172                     ; 361 {
1173                     .text:	section	.text,new
1174  0000               _USART_SetAddress:
1176  0000 88            	push	a
1177       00000000      OFST:	set	0
1180                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1182                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1184  0001 c65237        	ld	a,21047
1185  0004 a4f0          	and	a,#240
1186  0006 c75237        	ld	21047,a
1187                     ; 368   USART->CR4 |= Address;
1189  0009 c65237        	ld	a,21047
1190  000c 1a01          	or	a,(OFST+1,sp)
1191  000e c75237        	ld	21047,a
1192                     ; 369 }
1195  0011 84            	pop	a
1196  0012 81            	ret
1253                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1253                     ; 380 {
1254                     .text:	section	.text,new
1255  0000               _USART_WakeUpConfig:
1259                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1261                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1263  0000 72175234      	bres	21044,#3
1264                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1266  0004 9f            	ld	a,xl
1267  0005 ca5234        	or	a,21044
1268  0008 c75234        	ld	21044,a
1269                     ; 385 }
1272  000b 81            	ret
1408                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1408                     ; 401 {
1409                     .text:	section	.text,new
1410  0000               _USART_GetFlagStatus:
1412  0000 89            	pushw	x
1413  0001 89            	pushw	x
1414       00000002      OFST:	set	2
1417                     ; 402   FlagStatus status = RESET;
1419                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1421                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1423  0002 a30101        	cpw	x,#257
1424  0005 2612          	jrne	L306
1425                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1427  0007 9f            	ld	a,xl
1428  0008 c45235        	and	a,21045
1429  000b 2707          	jreq	L506
1430                     ; 412       status = SET;
1432  000d ae0001        	ldw	x,#1
1433  0010 1f01          	ldw	(OFST-1,sp),x
1436  0012 2016          	jra	L116
1437  0014               L506:
1438                     ; 417       status = RESET;
1440  0014 5f            	clrw	x
1441  0015 1f01          	ldw	(OFST-1,sp),x
1443  0017 2011          	jra	L116
1444  0019               L306:
1445                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1447  0019 c65230        	ld	a,21040
1448  001c 1504          	bcp	a,(OFST+2,sp)
1449  001e 2707          	jreq	L316
1450                     ; 425       status = SET;
1452  0020 ae0001        	ldw	x,#1
1453  0023 1f01          	ldw	(OFST-1,sp),x
1456  0025 2003          	jra	L116
1457  0027               L316:
1458                     ; 430       status = RESET;
1460  0027 5f            	clrw	x
1461  0028 1f01          	ldw	(OFST-1,sp),x
1463  002a               L116:
1464                     ; 434   return status;
1466  002a 1e01          	ldw	x,(OFST-1,sp)
1469  002c 5b04          	addw	sp,#4
1470  002e 81            	ret
1493                     ; 454 void USART_ClearFlag(void)
1493                     ; 455 {
1494                     .text:	section	.text,new
1495  0000               _USART_ClearFlag:
1499                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1501  0000 35df5230      	mov	21040,#223
1502                     ; 458 }
1505  0004 81            	ret
1587                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1587                     ; 473 {
1588                     .text:	section	.text,new
1589  0000               _USART_GetITStatus:
1591  0000 89            	pushw	x
1592  0001 5204          	subw	sp,#4
1593       00000004      OFST:	set	4
1596                     ; 474   ITStatus pendingbitstatus = RESET;
1598                     ; 475   uint8_t itpos = 0;
1600                     ; 476   uint8_t itmask1 = 0;
1602                     ; 477   uint8_t itmask2 = 0;
1604                     ; 478   uint8_t enablestatus = 0;
1606                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1608                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1610  0003 9f            	ld	a,xl
1611  0004 a40f          	and	a,#15
1612  0006 5f            	clrw	x
1613  0007 97            	ld	xl,a
1614  0008 a601          	ld	a,#1
1615  000a 5d            	tnzw	x
1616  000b 2704          	jreq	L05
1617  000d               L25:
1618  000d 48            	sll	a
1619  000e 5a            	decw	x
1620  000f 26fc          	jrne	L25
1621  0011               L05:
1622  0011 6b01          	ld	(OFST-3,sp),a
1624                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1626  0013 7b06          	ld	a,(OFST+2,sp)
1627  0015 4e            	swap	a
1628  0016 a40f          	and	a,#15
1629  0018 6b04          	ld	(OFST+0,sp),a
1631                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1633  001a 7b04          	ld	a,(OFST+0,sp)
1634  001c 5f            	clrw	x
1635  001d 97            	ld	xl,a
1636  001e a601          	ld	a,#1
1637  0020 5d            	tnzw	x
1638  0021 2704          	jreq	L45
1639  0023               L65:
1640  0023 48            	sll	a
1641  0024 5a            	decw	x
1642  0025 26fc          	jrne	L65
1643  0027               L45:
1644  0027 6b04          	ld	(OFST+0,sp),a
1646                     ; 492   if (USART_IT == USART_IT_PE)
1648  0029 1e05          	ldw	x,(OFST+1,sp)
1649  002b a30100        	cpw	x,#256
1650  002e 261e          	jrne	L176
1651                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1653  0030 c65234        	ld	a,21044
1654  0033 1404          	and	a,(OFST+0,sp)
1655  0035 6b04          	ld	(OFST+0,sp),a
1657                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1659  0037 c65230        	ld	a,21040
1660  003a 1501          	bcp	a,(OFST-3,sp)
1661  003c 270b          	jreq	L376
1663  003e 0d04          	tnz	(OFST+0,sp)
1664  0040 2707          	jreq	L376
1665                     ; 501       pendingbitstatus = SET;
1667  0042 ae0001        	ldw	x,#1
1668  0045 1f02          	ldw	(OFST-2,sp),x
1671  0047 2021          	jra	L776
1672  0049               L376:
1673                     ; 506       pendingbitstatus = RESET;
1675  0049 5f            	clrw	x
1676  004a 1f02          	ldw	(OFST-2,sp),x
1678  004c 201c          	jra	L776
1679  004e               L176:
1680                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1682  004e c65235        	ld	a,21045
1683  0051 1404          	and	a,(OFST+0,sp)
1684  0053 6b04          	ld	(OFST+0,sp),a
1686                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1688  0055 c65230        	ld	a,21040
1689  0058 1501          	bcp	a,(OFST-3,sp)
1690  005a 270b          	jreq	L107
1692  005c 0d04          	tnz	(OFST+0,sp)
1693  005e 2707          	jreq	L107
1694                     ; 517       pendingbitstatus = SET;
1696  0060 ae0001        	ldw	x,#1
1697  0063 1f02          	ldw	(OFST-2,sp),x
1700  0065 2003          	jra	L776
1701  0067               L107:
1702                     ; 522       pendingbitstatus = RESET;
1704  0067 5f            	clrw	x
1705  0068 1f02          	ldw	(OFST-2,sp),x
1707  006a               L776:
1708                     ; 527   return  pendingbitstatus;
1710  006a 1e02          	ldw	x,(OFST-2,sp)
1713  006c 5b06          	addw	sp,#6
1714  006e 81            	ret
1738                     ; 546 void USART_ClearITPendingBit(void)
1738                     ; 547 {
1739                     .text:	section	.text,new
1740  0000               _USART_ClearITPendingBit:
1744                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1746  0000 35df5230      	mov	21040,#223
1747                     ; 550 }
1750  0004 81            	ret
1763                     	xdef	_USART_ClearITPendingBit
1764                     	xdef	_USART_GetITStatus
1765                     	xdef	_USART_ClearFlag
1766                     	xdef	_USART_GetFlagStatus
1767                     	xdef	_USART_WakeUpConfig
1768                     	xdef	_USART_SetAddress
1769                     	xdef	_USART_SendData9
1770                     	xdef	_USART_SendData8
1771                     	xdef	_USART_SendBreak
1772                     	xdef	_USART_ReceiverWakeUpCmd
1773                     	xdef	_USART_ReceiveData9
1774                     	xdef	_USART_ReceiveData8
1775                     	xdef	_USART_ITConfig
1776                     	xdef	_USART_Cmd
1777                     	xdef	_USART_ClockInit
1778                     	xdef	_USART_Init
1779                     	xdef	_USART_DeInit
1780                     	xref	_CLK_GetClockFreq
1781                     	xref.b	c_lreg
1782                     	xref.b	c_x
1801                     	xref	c_lursh
1802                     	xref	c_ltor
1803                     	xref	c_rtol
1804                     	xref	c_ludv
1805                     	end
