   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 111                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 111                     ; 58 {
 113                     .text:	section	.text,new
 114  0000               _GPIO_DeInit:
 118                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0000 7f            	clr	(x)
 121                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0001 6f02          	clr	(2,x)
 124                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0003 6f03          	clr	(3,x)
 127                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 129  0005 6f04          	clr	(4,x)
 130                     ; 63 }
 133  0007 81            	ret
 289                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 289                     ; 99                uint8_t GPIO_Pin,
 289                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 289                     ; 101 {
 290                     .text:	section	.text,new
 291  0000               _GPIO_Init:
 293  0000 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 299                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 301                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 303  0001 7b07          	ld	a,(OFST+7,sp)
 304  0003 a580          	bcp	a,#128
 305  0005 271d          	jreq	L541
 306                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 308  0007 7b07          	ld	a,(OFST+7,sp)
 309  0009 a510          	bcp	a,#16
 310  000b 2706          	jreq	L741
 311                     ; 117       GPIOx->ODR |= GPIO_Pin;
 313  000d f6            	ld	a,(x)
 314  000e 1a05          	or	a,(OFST+5,sp)
 315  0010 f7            	ld	(x),a
 317  0011 2007          	jra	L151
 318  0013               L741:
 319                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 321  0013 1e01          	ldw	x,(OFST+1,sp)
 322  0015 7b05          	ld	a,(OFST+5,sp)
 323  0017 43            	cpl	a
 324  0018 f4            	and	a,(x)
 325  0019 f7            	ld	(x),a
 326  001a               L151:
 327                     ; 123     GPIOx->DDR |= GPIO_Pin;
 329  001a 1e01          	ldw	x,(OFST+1,sp)
 330  001c e602          	ld	a,(2,x)
 331  001e 1a05          	or	a,(OFST+5,sp)
 332  0020 e702          	ld	(2,x),a
 334  0022 2009          	jra	L351
 335  0024               L541:
 336                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 338  0024 1e01          	ldw	x,(OFST+1,sp)
 339  0026 7b05          	ld	a,(OFST+5,sp)
 340  0028 43            	cpl	a
 341  0029 e402          	and	a,(2,x)
 342  002b e702          	ld	(2,x),a
 343  002d               L351:
 344                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 346  002d 7b07          	ld	a,(OFST+7,sp)
 347  002f a540          	bcp	a,#64
 348  0031 270a          	jreq	L551
 349                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 351  0033 1e01          	ldw	x,(OFST+1,sp)
 352  0035 e603          	ld	a,(3,x)
 353  0037 1a05          	or	a,(OFST+5,sp)
 354  0039 e703          	ld	(3,x),a
 356  003b 2009          	jra	L751
 357  003d               L551:
 358                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 360  003d 1e01          	ldw	x,(OFST+1,sp)
 361  003f 7b05          	ld	a,(OFST+5,sp)
 362  0041 43            	cpl	a
 363  0042 e403          	and	a,(3,x)
 364  0044 e703          	ld	(3,x),a
 365  0046               L751:
 366                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 368  0046 7b07          	ld	a,(OFST+7,sp)
 369  0048 a520          	bcp	a,#32
 370  004a 270a          	jreq	L161
 371                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 373  004c 1e01          	ldw	x,(OFST+1,sp)
 374  004e e604          	ld	a,(4,x)
 375  0050 1a05          	or	a,(OFST+5,sp)
 376  0052 e704          	ld	(4,x),a
 378  0054 2009          	jra	L361
 379  0056               L161:
 380                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 382  0056 1e01          	ldw	x,(OFST+1,sp)
 383  0058 7b05          	ld	a,(OFST+5,sp)
 384  005a 43            	cpl	a
 385  005b e404          	and	a,(4,x)
 386  005d e704          	ld	(4,x),a
 387  005f               L361:
 388                     ; 154 }
 391  005f 85            	popw	x
 392  0060 81            	ret
 438                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 438                     ; 164 {
 439                     .text:	section	.text,new
 440  0000               _GPIO_Write:
 442  0000 89            	pushw	x
 443       00000000      OFST:	set	0
 446                     ; 165   GPIOx->ODR = GPIO_PortVal;
 448  0001 7b05          	ld	a,(OFST+5,sp)
 449  0003 1e01          	ldw	x,(OFST+1,sp)
 450  0005 f7            	ld	(x),a
 451                     ; 166 }
 454  0006 85            	popw	x
 455  0007 81            	ret
 615                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 615                     ; 186 {
 616                     .text:	section	.text,new
 617  0000               _GPIO_WriteBit:
 619  0000 89            	pushw	x
 620       00000000      OFST:	set	0
 623                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 625                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 627                     ; 191   if (GPIO_BitVal != RESET)
 629  0001 1e07          	ldw	x,(OFST+7,sp)
 630  0003 2717          	jreq	L303
 631                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 633  0005 1e01          	ldw	x,(OFST+1,sp)
 634  0007 7b06          	ld	a,(OFST+6,sp)
 635  0009 905f          	clrw	y
 636  000b 9097          	ld	yl,a
 637  000d a601          	ld	a,#1
 638  000f 905d          	tnzw	y
 639  0011 2705          	jreq	L41
 640  0013               L61:
 641  0013 48            	sll	a
 642  0014 905a          	decw	y
 643  0016 26fb          	jrne	L61
 644  0018               L41:
 645  0018 fa            	or	a,(x)
 646  0019 f7            	ld	(x),a
 648  001a 2017          	jra	L503
 649  001c               L303:
 650                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 652  001c 1e01          	ldw	x,(OFST+1,sp)
 653  001e 7b06          	ld	a,(OFST+6,sp)
 654  0020 905f          	clrw	y
 655  0022 9097          	ld	yl,a
 656  0024 a601          	ld	a,#1
 657  0026 905d          	tnzw	y
 658  0028 2705          	jreq	L02
 659  002a               L22:
 660  002a 48            	sll	a
 661  002b 905a          	decw	y
 662  002d 26fb          	jrne	L22
 663  002f               L02:
 664  002f a8ff          	xor	a,#255
 665  0031 f4            	and	a,(x)
 666  0032 f7            	ld	(x),a
 667  0033               L503:
 668                     ; 200 }
 671  0033 85            	popw	x
 672  0034 81            	ret
 718                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 718                     ; 219 {
 719                     .text:	section	.text,new
 720  0000               _GPIO_SetBits:
 722  0000 89            	pushw	x
 723       00000000      OFST:	set	0
 726                     ; 220   GPIOx->ODR |= GPIO_Pin;
 728  0001 f6            	ld	a,(x)
 729  0002 1a05          	or	a,(OFST+5,sp)
 730  0004 f7            	ld	(x),a
 731                     ; 221 }
 734  0005 85            	popw	x
 735  0006 81            	ret
 781                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 781                     ; 240 {
 782                     .text:	section	.text,new
 783  0000               _GPIO_ResetBits:
 785  0000 89            	pushw	x
 786       00000000      OFST:	set	0
 789                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 791  0001 7b05          	ld	a,(OFST+5,sp)
 792  0003 43            	cpl	a
 793  0004 f4            	and	a,(x)
 794  0005 f7            	ld	(x),a
 795                     ; 242 }
 798  0006 85            	popw	x
 799  0007 81            	ret
 845                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 845                     ; 252 {
 846                     .text:	section	.text,new
 847  0000               _GPIO_ToggleBits:
 849  0000 89            	pushw	x
 850       00000000      OFST:	set	0
 853                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 855  0001 f6            	ld	a,(x)
 856  0002 1805          	xor	a,	(OFST+5,sp)
 857  0004 f7            	ld	(x),a
 858                     ; 254 }
 861  0005 85            	popw	x
 862  0006 81            	ret
 899                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 899                     ; 263 {
 900                     .text:	section	.text,new
 901  0000               _GPIO_ReadInputData:
 905                     ; 264   return ((uint8_t)GPIOx->IDR);
 907  0000 e601          	ld	a,(1,x)
 910  0002 81            	ret
 948                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 948                     ; 274 {
 949                     .text:	section	.text,new
 950  0000               _GPIO_ReadOutputData:
 954                     ; 275   return ((uint8_t)GPIOx->ODR);
 956  0000 f6            	ld	a,(x)
 959  0001 81            	ret
1008                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1008                     ; 295 {
1009                     .text:	section	.text,new
1010  0000               _GPIO_ReadInputDataBit:
1012  0000 89            	pushw	x
1013  0001 89            	pushw	x
1014       00000002      OFST:	set	2
1017                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1019  0002 7b08          	ld	a,(OFST+6,sp)
1020  0004 5f            	clrw	x
1021  0005 97            	ld	xl,a
1022  0006 1f01          	ldw	(OFST-1,sp),x
1024  0008 1e03          	ldw	x,(OFST+1,sp)
1025  000a e601          	ld	a,(1,x)
1026  000c 5f            	clrw	x
1027  000d 97            	ld	xl,a
1028  000e 01            	rrwa	x,a
1029  000f 1402          	and	a,(OFST+0,sp)
1030  0011 01            	rrwa	x,a
1031  0012 1401          	and	a,(OFST-1,sp)
1032  0014 01            	rrwa	x,a
1035  0015 5b04          	addw	sp,#4
1036  0017 81            	ret
1085                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1085                     ; 316 {
1086                     .text:	section	.text,new
1087  0000               _GPIO_ReadOutputDataBit:
1089  0000 89            	pushw	x
1090  0001 89            	pushw	x
1091       00000002      OFST:	set	2
1094                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1096  0002 7b08          	ld	a,(OFST+6,sp)
1097  0004 5f            	clrw	x
1098  0005 97            	ld	xl,a
1099  0006 1f01          	ldw	(OFST-1,sp),x
1101  0008 1e03          	ldw	x,(OFST+1,sp)
1102  000a f6            	ld	a,(x)
1103  000b 5f            	clrw	x
1104  000c 97            	ld	xl,a
1105  000d 01            	rrwa	x,a
1106  000e 1402          	and	a,(OFST+0,sp)
1107  0010 01            	rrwa	x,a
1108  0011 1401          	and	a,(OFST-1,sp)
1109  0013 01            	rrwa	x,a
1112  0014 5b04          	addw	sp,#4
1113  0016 81            	ret
1190                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1190                     ; 338 {
1191                     .text:	section	.text,new
1192  0000               _GPIO_ExternalPullUpConfig:
1194  0000 89            	pushw	x
1195       00000000      OFST:	set	0
1198                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1200                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1202                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1204  0001 1e06          	ldw	x,(OFST+6,sp)
1205  0003 270a          	jreq	L355
1206                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1208  0005 1e01          	ldw	x,(OFST+1,sp)
1209  0007 e603          	ld	a,(3,x)
1210  0009 1a05          	or	a,(OFST+5,sp)
1211  000b e703          	ld	(3,x),a
1213  000d 2009          	jra	L555
1214  000f               L355:
1215                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1217  000f 1e01          	ldw	x,(OFST+1,sp)
1218  0011 7b05          	ld	a,(OFST+5,sp)
1219  0013 43            	cpl	a
1220  0014 e403          	and	a,(3,x)
1221  0016 e703          	ld	(3,x),a
1222  0018               L555:
1223                     ; 350 }
1226  0018 85            	popw	x
1227  0019 81            	ret
1240                     	xdef	_GPIO_ExternalPullUpConfig
1241                     	xdef	_GPIO_ReadOutputDataBit
1242                     	xdef	_GPIO_ReadInputDataBit
1243                     	xdef	_GPIO_ReadOutputData
1244                     	xdef	_GPIO_ReadInputData
1245                     	xdef	_GPIO_ToggleBits
1246                     	xdef	_GPIO_ResetBits
1247                     	xdef	_GPIO_SetBits
1248                     	xdef	_GPIO_WriteBit
1249                     	xdef	_GPIO_Write
1250                     	xdef	_GPIO_Init
1251                     	xdef	_GPIO_DeInit
1270                     	end
