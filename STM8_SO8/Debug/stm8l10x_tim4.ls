   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 56 void TIM4_DeInit(void)
  45                     ; 57 {
  47                     .text:	section	.text,new
  48  0000               _TIM4_DeInit:
  52                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  54  0000 725f52e0      	clr	21216
  55                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  57  0004 725f52e1      	clr	21217
  58                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  60  0008 725f52e2      	clr	21218
  61                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  63  000c 725f52e3      	clr	21219
  64                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  66  0010 725f52e6      	clr	21222
  67                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  69  0014 725f52e7      	clr	21223
  70                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  72  0018 35ff52e8      	mov	21224,#255
  73                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  75  001c 725f52e4      	clr	21220
  76                     ; 66 }
  79  0020 81            	ret
 247                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 247                     ; 92                        uint8_t TIM4_Period)
 247                     ; 93 {
 248                     .text:	section	.text,new
 249  0000               _TIM4_TimeBaseInit:
 251  0000 89            	pushw	x
 252       00000000      OFST:	set	0
 255                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 257                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 259  0001 7b05          	ld	a,(OFST+5,sp)
 260  0003 c752e8        	ld	21224,a
 261                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 263  0006 9f            	ld	a,xl
 264  0007 c752e7        	ld	21223,a
 265                     ; 100 }
 268  000a 85            	popw	x
 269  000b 81            	ret
 324                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 324                     ; 109 {
 325                     .text:	section	.text,new
 326  0000               _TIM4_Cmd:
 330                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 332                     ; 114   if (NewState != DISABLE)
 334  0000 a30000        	cpw	x,#0
 335  0003 2706          	jreq	L531
 336                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 338  0005 721052e0      	bset	21216,#0
 340  0009 2004          	jra	L731
 341  000b               L531:
 342                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 344  000b 721152e0      	bres	21216,#0
 345  000f               L731:
 346                     ; 122 }
 349  000f 81            	ret
 414                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 414                     ; 135 {
 415                     .text:	section	.text,new
 416  0000               _TIM4_ITConfig:
 418  0000 89            	pushw	x
 419       00000000      OFST:	set	0
 422                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 424                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 426                     ; 140   if (NewState != DISABLE)
 428  0001 1e05          	ldw	x,(OFST+5,sp)
 429  0003 270a          	jreq	L371
 430                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 432  0005 c652e3        	ld	a,21219
 433  0008 1a02          	or	a,(OFST+2,sp)
 434  000a c752e3        	ld	21219,a
 436  000d 2009          	jra	L571
 437  000f               L371:
 438                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 440  000f 7b02          	ld	a,(OFST+2,sp)
 441  0011 43            	cpl	a
 442  0012 c452e3        	and	a,21219
 443  0015 c752e3        	ld	21219,a
 444  0018               L571:
 445                     ; 150 }
 448  0018 85            	popw	x
 449  0019 81            	ret
 473                     ; 157 void TIM4_InternalClockConfig(void)
 473                     ; 158 {
 474                     .text:	section	.text,new
 475  0000               _TIM4_InternalClockConfig:
 479                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 481  0000 c652e2        	ld	a,21218
 482  0003 a4f8          	and	a,#248
 483  0005 c752e2        	ld	21218,a
 484                     ; 161 }
 487  0008 81            	ret
 555                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 555                     ; 172 {
 556                     .text:	section	.text,new
 557  0000               _TIM4_SelectInputTrigger:
 559  0000 88            	push	a
 560       00000001      OFST:	set	1
 563                     ; 173   uint8_t tmpsmcr = 0;
 565                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 567                     ; 178   tmpsmcr = TIM4->SMCR;
 569  0001 c652e2        	ld	a,21218
 570  0004 6b01          	ld	(OFST+0,sp),a
 572                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 574  0006 7b01          	ld	a,(OFST+0,sp)
 575  0008 a48f          	and	a,#143
 576  000a 6b01          	ld	(OFST+0,sp),a
 578                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 580  000c 9f            	ld	a,xl
 581  000d 1a01          	or	a,(OFST+0,sp)
 582  000f 6b01          	ld	(OFST+0,sp),a
 584                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 586  0011 7b01          	ld	a,(OFST+0,sp)
 587  0013 c752e2        	ld	21218,a
 588                     ; 185 }
 591  0016 84            	pop	a
 592  0017 81            	ret
 628                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 628                     ; 194 {
 629                     .text:	section	.text,new
 630  0000               _TIM4_UpdateDisableConfig:
 634                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 636                     ; 199   if (NewState != DISABLE)
 638  0000 a30000        	cpw	x,#0
 639  0003 2706          	jreq	L752
 640                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 642  0005 721252e0      	bset	21216,#1
 644  0009 2004          	jra	L162
 645  000b               L752:
 646                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 648  000b 721352e0      	bres	21216,#1
 649  000f               L162:
 650                     ; 207 }
 653  000f 81            	ret
 711                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 711                     ; 218 {
 712                     .text:	section	.text,new
 713  0000               _TIM4_UpdateRequestConfig:
 717                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 719                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 721  0000 a30001        	cpw	x,#1
 722  0003 2606          	jrne	L113
 723                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 725  0005 721452e0      	bset	21216,#2
 727  0009 2004          	jra	L313
 728  000b               L113:
 729                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 731  000b 721552e0      	bres	21216,#2
 732  000f               L313:
 733                     ; 231 }
 736  000f 81            	ret
 793                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 793                     ; 242 {
 794                     .text:	section	.text,new
 795  0000               _TIM4_SelectOnePulseMode:
 799                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 801                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 803  0000 a30001        	cpw	x,#1
 804  0003 2606          	jrne	L343
 805                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 807  0005 721652e0      	bset	21216,#3
 809  0009 2004          	jra	L543
 810  000b               L343:
 811                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 813  000b 721752e0      	bres	21216,#3
 814  000f               L543:
 815                     ; 256 }
 818  000f 81            	ret
 893                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 893                     ; 268 {
 894                     .text:	section	.text,new
 895  0000               _TIM4_SelectOutputTrigger:
 897  0000 88            	push	a
 898       00000001      OFST:	set	1
 901                     ; 269   uint8_t tmpcr2 = 0;
 903                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 905                     ; 274   tmpcr2 = TIM4->CR2;
 907  0001 c652e1        	ld	a,21217
 908  0004 6b01          	ld	(OFST+0,sp),a
 910                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 912  0006 7b01          	ld	a,(OFST+0,sp)
 913  0008 a48f          	and	a,#143
 914  000a 6b01          	ld	(OFST+0,sp),a
 916                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 918  000c 9f            	ld	a,xl
 919  000d 1a01          	or	a,(OFST+0,sp)
 920  000f 6b01          	ld	(OFST+0,sp),a
 922                     ; 282   TIM4->CR2 = tmpcr2;
 924  0011 7b01          	ld	a,(OFST+0,sp)
 925  0013 c752e1        	ld	21217,a
 926                     ; 283 }
 929  0016 84            	pop	a
 930  0017 81            	ret
1021                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1021                     ; 298 {
1022                     .text:	section	.text,new
1023  0000               _TIM4_SelectSlaveMode:
1025  0000 88            	push	a
1026       00000001      OFST:	set	1
1029                     ; 299   uint8_t tmpsmcr = 0;
1031                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1033                     ; 304   tmpsmcr = TIM4->SMCR;
1035  0001 c652e2        	ld	a,21218
1036  0004 6b01          	ld	(OFST+0,sp),a
1038                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1040  0006 7b01          	ld	a,(OFST+0,sp)
1041  0008 a4f8          	and	a,#248
1042  000a 6b01          	ld	(OFST+0,sp),a
1044                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1046  000c 9f            	ld	a,xl
1047  000d 1a01          	or	a,(OFST+0,sp)
1048  000f 6b01          	ld	(OFST+0,sp),a
1050                     ; 312   TIM4->SMCR = tmpsmcr;
1052  0011 7b01          	ld	a,(OFST+0,sp)
1053  0013 c752e2        	ld	21218,a
1054                     ; 313 }
1057  0016 84            	pop	a
1058  0017 81            	ret
1094                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1094                     ; 322 {
1095                     .text:	section	.text,new
1096  0000               _TIM4_SelectMasterSlaveMode:
1100                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1102                     ; 327   if (NewState != DISABLE)
1104  0000 a30000        	cpw	x,#0
1105  0003 2706          	jreq	L164
1106                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1108  0005 721e52e2      	bset	21218,#7
1110  0009 2004          	jra	L364
1111  000b               L164:
1112                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1114  000b 721f52e2      	bres	21218,#7
1115  000f               L364:
1116                     ; 335 }
1119  000f 81            	ret
1187                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1187                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1187                     ; 365 {
1188                     .text:	section	.text,new
1189  0000               _TIM4_PrescalerConfig:
1191  0000 89            	pushw	x
1192       00000000      OFST:	set	0
1195                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1197                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1199                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1201  0001 9f            	ld	a,xl
1202  0002 c752e7        	ld	21223,a
1203                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1205  0005 1e05          	ldw	x,(OFST+5,sp)
1206  0007 a30001        	cpw	x,#1
1207  000a 2606          	jrne	L715
1208                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1210  000c 721052e5      	bset	21221,#0
1212  0010 2004          	jra	L125
1213  0012               L715:
1214                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1216  0012 721152e5      	bres	21221,#0
1217  0016               L125:
1218                     ; 382 }
1221  0016 85            	popw	x
1222  0017 81            	ret
1258                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1258                     ; 391 {
1259                     .text:	section	.text,new
1260  0000               _TIM4_ARRPreloadConfig:
1264                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1266                     ; 396   if (NewState != DISABLE)
1268  0000 a30000        	cpw	x,#0
1269  0003 2706          	jreq	L145
1270                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1272  0005 721e52e0      	bset	21216,#7
1274  0009 2004          	jra	L345
1275  000b               L145:
1276                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1278  000b 721f52e0      	bres	21216,#7
1279  000f               L345:
1280                     ; 404 }
1283  000f 81            	ret
1340                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1340                     ; 415 {
1341                     .text:	section	.text,new
1342  0000               _TIM4_GenerateEvent:
1346                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1348                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1350  0000 9f            	ld	a,xl
1351  0001 ca52e5        	or	a,21221
1352  0004 c752e5        	ld	21221,a
1353                     ; 421 }
1356  0007 81            	ret
1390                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1390                     ; 430 {
1391                     .text:	section	.text,new
1392  0000               _TIM4_SetCounter:
1396                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1398  0000 c752e6        	ld	21222,a
1399                     ; 433 }
1402  0003 81            	ret
1436                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1436                     ; 442 {
1437                     .text:	section	.text,new
1438  0000               _TIM4_SetAutoreload:
1442                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1444  0000 c752e8        	ld	21224,a
1445                     ; 446 }
1448  0003 81            	ret
1482                     ; 453 uint8_t TIM4_GetCounter(void)
1482                     ; 454 {
1483                     .text:	section	.text,new
1484  0000               _TIM4_GetCounter:
1486  0000 88            	push	a
1487       00000001      OFST:	set	1
1490                     ; 455   uint8_t tmpcntr = 0;
1492                     ; 456   tmpcntr = TIM4->CNTR;
1494  0001 c652e6        	ld	a,21222
1495  0004 6b01          	ld	(OFST+0,sp),a
1497                     ; 458   return ((uint8_t)tmpcntr);
1499  0006 7b01          	ld	a,(OFST+0,sp)
1502  0008 5b01          	addw	sp,#1
1503  000a 81            	ret
1527                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1527                     ; 483 {
1528                     .text:	section	.text,new
1529  0000               _TIM4_GetPrescaler:
1533                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1535  0000 c652e7        	ld	a,21223
1536  0003 5f            	clrw	x
1537  0004 97            	ld	xl,a
1540  0005 81            	ret
1564                     ; 493 FunctionalState TIM4_GetStatus(void)
1564                     ; 494 {
1565                     .text:	section	.text,new
1566  0000               _TIM4_GetStatus:
1570                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1572  0000 c652e0        	ld	a,21216
1573  0003 5f            	clrw	x
1574  0004 a401          	and	a,#1
1575  0006 5f            	clrw	x
1576  0007 02            	rlwa	x,a
1579  0008 81            	ret
1665                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1665                     ; 508 {
1666                     .text:	section	.text,new
1667  0000               _TIM4_GetFlagStatus:
1669  0000 89            	pushw	x
1670  0001 89            	pushw	x
1671       00000002      OFST:	set	2
1674                     ; 509   __IO FlagStatus bitstatus = RESET;
1676  0002 5f            	clrw	x
1677  0003 1f01          	ldw	(OFST-1,sp),x
1679                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1681                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1683  0005 c652e4        	ld	a,21220
1684  0008 1504          	bcp	a,(OFST+2,sp)
1685  000a 2707          	jreq	L727
1686                     ; 516     bitstatus = SET;
1688  000c ae0001        	ldw	x,#1
1689  000f 1f01          	ldw	(OFST-1,sp),x
1692  0011 2003          	jra	L137
1693  0013               L727:
1694                     ; 520     bitstatus = RESET;
1696  0013 5f            	clrw	x
1697  0014 1f01          	ldw	(OFST-1,sp),x
1699  0016               L137:
1700                     ; 522   return ((FlagStatus)bitstatus);
1702  0016 1e01          	ldw	x,(OFST-1,sp)
1705  0018 5b04          	addw	sp,#4
1706  001a 81            	ret
1741                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1741                     ; 534 {
1742                     .text:	section	.text,new
1743  0000               _TIM4_ClearFlag:
1747                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1749                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1751  0000 9f            	ld	a,xl
1752  0001 43            	cpl	a
1753  0002 c752e4        	ld	21220,a
1754                     ; 539 }
1757  0005 81            	ret
1821                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1821                     ; 551 {
1822                     .text:	section	.text,new
1823  0000               _TIM4_GetITStatus:
1825  0000 89            	pushw	x
1826  0001 5204          	subw	sp,#4
1827       00000004      OFST:	set	4
1830                     ; 552   __IO ITStatus bitstatus = RESET;
1832  0003 5f            	clrw	x
1833  0004 1f03          	ldw	(OFST-1,sp),x
1835                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1837  0006 0f01          	clr	(OFST-3,sp)
1841  0008 0f02          	clr	(OFST-2,sp)
1843                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1845                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1847  000a c652e4        	ld	a,21220
1848  000d 1406          	and	a,(OFST+2,sp)
1849  000f 6b01          	ld	(OFST-3,sp),a
1851                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1853  0011 c652e3        	ld	a,21219
1854  0014 1406          	and	a,(OFST+2,sp)
1855  0016 6b02          	ld	(OFST-2,sp),a
1857                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1859  0018 0d01          	tnz	(OFST-3,sp)
1860  001a 270b          	jreq	L3001
1862  001c 0d02          	tnz	(OFST-2,sp)
1863  001e 2707          	jreq	L3001
1864                     ; 565     bitstatus = (ITStatus)SET;
1866  0020 ae0001        	ldw	x,#1
1867  0023 1f03          	ldw	(OFST-1,sp),x
1870  0025 2003          	jra	L5001
1871  0027               L3001:
1872                     ; 569     bitstatus = (ITStatus)RESET;
1874  0027 5f            	clrw	x
1875  0028 1f03          	ldw	(OFST-1,sp),x
1877  002a               L5001:
1878                     ; 571   return ((ITStatus)bitstatus);
1880  002a 1e03          	ldw	x,(OFST-1,sp)
1883  002c 5b06          	addw	sp,#6
1884  002e 81            	ret
1920                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1920                     ; 583 {
1921                     .text:	section	.text,new
1922  0000               _TIM4_ClearITPendingBit:
1926                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1928                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1930  0000 9f            	ld	a,xl
1931  0001 43            	cpl	a
1932  0002 c752e4        	ld	21220,a
1933                     ; 589 }
1936  0005 81            	ret
1949                     	xdef	_TIM4_ClearITPendingBit
1950                     	xdef	_TIM4_GetITStatus
1951                     	xdef	_TIM4_ClearFlag
1952                     	xdef	_TIM4_GetFlagStatus
1953                     	xdef	_TIM4_GetStatus
1954                     	xdef	_TIM4_GetPrescaler
1955                     	xdef	_TIM4_GetCounter
1956                     	xdef	_TIM4_SetAutoreload
1957                     	xdef	_TIM4_SetCounter
1958                     	xdef	_TIM4_GenerateEvent
1959                     	xdef	_TIM4_ARRPreloadConfig
1960                     	xdef	_TIM4_PrescalerConfig
1961                     	xdef	_TIM4_SelectMasterSlaveMode
1962                     	xdef	_TIM4_SelectSlaveMode
1963                     	xdef	_TIM4_SelectOutputTrigger
1964                     	xdef	_TIM4_SelectOnePulseMode
1965                     	xdef	_TIM4_UpdateRequestConfig
1966                     	xdef	_TIM4_UpdateDisableConfig
1967                     	xdef	_TIM4_SelectInputTrigger
1968                     	xdef	_TIM4_InternalClockConfig
1969                     	xdef	_TIM4_ITConfig
1970                     	xdef	_TIM4_Cmd
1971                     	xdef	_TIM4_TimeBaseInit
1972                     	xdef	_TIM4_DeInit
1991                     	end
