   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  15                     .dataeeprom:	section	.bss
  16  0000               _Bias_Current:
  17  0000 00            	ds.b	1
  62                     ; 58 void FLASH_ProgramBias(uint8_t Data)
  62                     ; 59 {
  64                     	switch	.text
  65  0000               _FLASH_ProgramBias:
  67  0000 88            	push	a
  68       00000000      OFST:	set	0
  71                     ; 60   FLASH_Unlock(FLASH_MemType_Data);
  73  0001 a6f7          	ld	a,#247
  74  0003 cd0000        	call	_FLASH_Unlock
  76                     ; 61   Bias_Current = Data;
  78  0006 7b01          	ld	a,(OFST+1,sp)
  79  0008 c70000        	ld	_Bias_Current,a
  80                     ; 62   FLASH_WaitForLastOperation(FLASH_MemType_Data);
  82  000b a6f7          	ld	a,#247
  83  000d cd0000        	call	_FLASH_WaitForLastOperation
  85                     ; 63   FLASH_Lock(FLASH_MemType_Data);
  87  0010 a6f7          	ld	a,#247
  88  0012 cd0000        	call	_FLASH_Lock
  90                     ; 64 }	
  93  0015 84            	pop	a
  94  0016 81            	ret
 133                     ; 72 void test_vdd(void)
 133                     ; 73 {
 134                     	switch	.text
 135  0017               _test_vdd:
 137  0017 89            	pushw	x
 138       00000002      OFST:	set	2
 141                     ; 76   LCD_GLASS_DisplayString("VDD");
 143  0018 ae00c4        	ldw	x,#L54
 144  001b cd0000        	call	_LCD_GLASS_DisplayString
 146                     ; 77   delay_ms(200);
 148  001e ae00c8        	ldw	x,#200
 149  0021 cd0000        	call	_delay_ms
 151                     ; 79   vdd_test = (int)Vref_measure();
 153  0024 cd049b        	call	_Vref_measure
 155  0027 1f01          	ldw	(OFST-1,sp),x
 156                     ; 80   delay_ms(200);
 158  0029 ae00c8        	ldw	x,#200
 159  002c cd0000        	call	_delay_ms
 161                     ; 83   if ((vdd_test>VCC_MAX) || (vdd_test<VCC_MIN))
 163  002f 1e01          	ldw	x,(OFST-1,sp)
 164  0031 a30c1d        	cpw	x,#3101
 165  0034 2407          	jruge	L35
 167  0036 1e01          	ldw	x,(OFST-1,sp)
 168  0038 a30b63        	cpw	x,#2915
 169  003b 2414          	jruge	L74
 170  003d               L35:
 171                     ; 87       LCD_GLASS_ScrollSentence("VDD Not OK ",1,SCROLL_SPEED); //Press reset for exit
 173  003d ae0028        	ldw	x,#40
 174  0040 89            	pushw	x
 175  0041 ae0001        	ldw	x,#1
 176  0044 89            	pushw	x
 177  0045 ae00b8        	ldw	x,#L75
 178  0048 cd0000        	call	_LCD_GLASS_ScrollSentence
 180  004b 5b04          	addw	sp,#4
 181                     ; 88       KeyPressed = FALSE;
 183  004d 3f00          	clr	_KeyPressed
 185  004f 20ec          	jra	L35
 186  0051               L74:
 187                     ; 92   LCD_GLASS_DisplayString("VDD OK");
 189  0051 ae00b1        	ldw	x,#L16
 190  0054 cd0000        	call	_LCD_GLASS_DisplayString
 192                     ; 93   delay_ms(200);
 194  0057 ae00c8        	ldw	x,#200
 195  005a cd0000        	call	_delay_ms
 197                     ; 94 }
 200  005d 85            	popw	x
 201  005e 81            	ret
 240                     ; 102 void test_icc_Run(void)
 240                     ; 103 {
 241                     	switch	.text
 242  005f               _test_icc_Run:
 244  005f 89            	pushw	x
 245       00000002      OFST:	set	2
 248                     ; 106   LCD_GLASS_DisplayString("RUN");
 250  0060 ae00ad        	ldw	x,#L101
 251  0063 cd0000        	call	_LCD_GLASS_DisplayString
 253                     ; 107   delay_ms(200);
 255  0066 ae00c8        	ldw	x,#200
 256  0069 cd0000        	call	_delay_ms
 258                     ; 109   icc_test = (int)Icc_measure_RUN();
 260  006c cd0519        	call	_Icc_measure_RUN
 262  006f cd0000        	call	c_ftoi
 264  0072 1f01          	ldw	(OFST-1,sp),x
 265                     ; 110   delay_ms(200);
 267  0074 ae00c8        	ldw	x,#200
 268  0077 cd0000        	call	_delay_ms
 270                     ; 112   if ((icc_test>ICC_RUN_MAX) || (icc_test<ICC_RUN_MIN))
 272  007a 1e01          	ldw	x,(OFST-1,sp)
 273  007c a30641        	cpw	x,#1601
 274  007f 2407          	jruge	L701
 276  0081 1e01          	ldw	x,(OFST-1,sp)
 277  0083 a303e8        	cpw	x,#1000
 278  0086 2414          	jruge	L301
 279  0088               L701:
 280                     ; 116       LCD_GLASS_ScrollSentence("RUN Not OK ",1,SCROLL_SPEED); //Press reset for exit
 282  0088 ae0028        	ldw	x,#40
 283  008b 89            	pushw	x
 284  008c ae0001        	ldw	x,#1
 285  008f 89            	pushw	x
 286  0090 ae00a1        	ldw	x,#L311
 287  0093 cd0000        	call	_LCD_GLASS_ScrollSentence
 289  0096 5b04          	addw	sp,#4
 290                     ; 117       KeyPressed = FALSE;
 292  0098 3f00          	clr	_KeyPressed
 294  009a 20ec          	jra	L701
 295  009c               L301:
 296                     ; 121   LCD_GLASS_DisplayString("RUN OK");
 298  009c ae009a        	ldw	x,#L511
 299  009f cd0000        	call	_LCD_GLASS_DisplayString
 301                     ; 122   delay_ms(200);
 303  00a2 ae00c8        	ldw	x,#200
 304  00a5 cd0000        	call	_delay_ms
 306                     ; 123 }
 309  00a8 85            	popw	x
 310  00a9 81            	ret
 349                     ; 131 void test_icc_HALT(void)
 349                     ; 132 {
 350                     	switch	.text
 351  00aa               _test_icc_HALT:
 353  00aa 89            	pushw	x
 354       00000002      OFST:	set	2
 357                     ; 135   LCD_GLASS_DisplayString("HALT");
 359  00ab ae0095        	ldw	x,#L531
 360  00ae cd0000        	call	_LCD_GLASS_DisplayString
 362                     ; 136   delay_ms(200);
 364  00b1 ae00c8        	ldw	x,#200
 365  00b4 cd0000        	call	_delay_ms
 367                     ; 139   icc_test = (int)Icc_measure_HALT();
 369  00b7 cd058f        	call	_Icc_measure_HALT
 371  00ba cd0000        	call	c_ftoi
 373  00bd 1f01          	ldw	(OFST-1,sp),x
 374                     ; 140   delay_ms(200);
 376  00bf ae00c8        	ldw	x,#200
 377  00c2 cd0000        	call	_delay_ms
 379                     ; 143   if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 381  00c5 1e01          	ldw	x,(OFST-1,sp)
 382  00c7 a30321        	cpw	x,#801
 383  00ca 2407          	jruge	L141
 385  00cc 1e01          	ldw	x,(OFST-1,sp)
 386  00ce a3012c        	cpw	x,#300
 387  00d1 2436          	jruge	L731
 388  00d3               L141:
 389                     ; 145     delay_ms(400);	
 391  00d3 ae0190        	ldw	x,#400
 392  00d6 cd0000        	call	_delay_ms
 394                     ; 146     icc_test = (int)Icc_measure_HALT();
 396  00d9 cd058f        	call	_Icc_measure_HALT
 398  00dc cd0000        	call	c_ftoi
 400  00df 1f01          	ldw	(OFST-1,sp),x
 401                     ; 147     delay_ms(200);		
 403  00e1 ae00c8        	ldw	x,#200
 404  00e4 cd0000        	call	_delay_ms
 406                     ; 150     if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 408  00e7 1e01          	ldw	x,(OFST-1,sp)
 409  00e9 a30321        	cpw	x,#801
 410  00ec 2407          	jruge	L741
 412  00ee 1e01          	ldw	x,(OFST-1,sp)
 413  00f0 a3012c        	cpw	x,#300
 414  00f3 2414          	jruge	L731
 415  00f5               L741:
 416                     ; 154         LCD_GLASS_ScrollSentence("ICC HALT Not OK ",1,SCROLL_SPEED); //Press reset for exit
 418  00f5 ae0028        	ldw	x,#40
 419  00f8 89            	pushw	x
 420  00f9 ae0001        	ldw	x,#1
 421  00fc 89            	pushw	x
 422  00fd ae0084        	ldw	x,#L351
 423  0100 cd0000        	call	_LCD_GLASS_ScrollSentence
 425  0103 5b04          	addw	sp,#4
 426                     ; 155         KeyPressed = FALSE;
 428  0105 3f00          	clr	_KeyPressed
 430  0107 20ec          	jra	L741
 431  0109               L731:
 432                     ; 160   LCD_GLASS_DisplayString("HALTOK");
 434  0109 ae007d        	ldw	x,#L551
 435  010c cd0000        	call	_LCD_GLASS_DisplayString
 437                     ; 161   delay_ms(200);
 439  010f ae00c8        	ldw	x,#200
 440  0112 cd0000        	call	_delay_ms
 442                     ; 162 }
 445  0115 85            	popw	x
 446  0116 81            	ret
 485                     ; 170 void test_icc_LP(void)
 485                     ; 171 {
 486                     	switch	.text
 487  0117               _test_icc_LP:
 489  0117 89            	pushw	x
 490       00000002      OFST:	set	2
 493                     ; 174   LCD_GLASS_DisplayString("LP");
 495  0118 ae007a        	ldw	x,#L571
 496  011b cd0000        	call	_LCD_GLASS_DisplayString
 498                     ; 175   delay_ms(200);
 500  011e ae00c8        	ldw	x,#200
 501  0121 cd0000        	call	_delay_ms
 503                     ; 178   icc_test = (int)Icc_measure_LPR();
 505  0124 cd0607        	call	_Icc_measure_LPR
 507  0127 cd0000        	call	c_ftoi
 509  012a 1f01          	ldw	(OFST-1,sp),x
 510                     ; 179   delay_ms(200);
 512  012c ae00c8        	ldw	x,#200
 513  012f cd0000        	call	_delay_ms
 515                     ; 182   if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 517  0132 1e01          	ldw	x,(OFST-1,sp)
 518  0134 a30fdd        	cpw	x,#4061
 519  0137 2407          	jruge	L102
 521  0139 1e01          	ldw	x,(OFST-1,sp)
 522  013b a309c4        	cpw	x,#2500
 523  013e 2436          	jruge	L771
 524  0140               L102:
 525                     ; 185     delay_ms(400);
 527  0140 ae0190        	ldw	x,#400
 528  0143 cd0000        	call	_delay_ms
 530                     ; 186     icc_test = (int)Icc_measure_LPR();
 532  0146 cd0607        	call	_Icc_measure_LPR
 534  0149 cd0000        	call	c_ftoi
 536  014c 1f01          	ldw	(OFST-1,sp),x
 537                     ; 187     delay_ms(200);			
 539  014e ae00c8        	ldw	x,#200
 540  0151 cd0000        	call	_delay_ms
 542                     ; 190     if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 544  0154 1e01          	ldw	x,(OFST-1,sp)
 545  0156 a30fdd        	cpw	x,#4061
 546  0159 2407          	jruge	L702
 548  015b 1e01          	ldw	x,(OFST-1,sp)
 549  015d a309c4        	cpw	x,#2500
 550  0160 2414          	jruge	L771
 551  0162               L702:
 552                     ; 194         LCD_GLASS_ScrollSentence("LP Not OK ",1,SCROLL_SPEED); //press reset for exit
 554  0162 ae0028        	ldw	x,#40
 555  0165 89            	pushw	x
 556  0166 ae0001        	ldw	x,#1
 557  0169 89            	pushw	x
 558  016a ae006f        	ldw	x,#L312
 559  016d cd0000        	call	_LCD_GLASS_ScrollSentence
 561  0170 5b04          	addw	sp,#4
 562                     ; 195         KeyPressed = FALSE;
 564  0172 3f00          	clr	_KeyPressed
 566  0174 20ec          	jra	L702
 567  0176               L771:
 568                     ; 200   LCD_GLASS_DisplayString("LP OK");
 570  0176 ae0069        	ldw	x,#L512
 571  0179 cd0000        	call	_LCD_GLASS_DisplayString
 573                     ; 201   delay_ms(200);
 575  017c ae00c8        	ldw	x,#200
 576  017f cd0000        	call	_delay_ms
 578                     ; 202 }
 581  0182 85            	popw	x
 582  0183 81            	ret
 614                     ; 210 void test_LSE(void)
 614                     ; 211 {
 615                     	switch	.text
 616  0184               _test_LSE:
 620                     ; 215   LCD_GLASS_DisplayString("LSE");
 622  0184 ae0065        	ldw	x,#L722
 623  0187 cd0000        	call	_LCD_GLASS_DisplayString
 625                     ; 217   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 627  018a 4f            	clr	a
 628  018b cd0000        	call	_CLK_SYSCLKDivConfig
 630                     ; 218   CLK_LSEConfig(CLK_LSE_ON);
 632  018e a604          	ld	a,#4
 633  0190 cd0000        	call	_CLK_LSEConfig
 635                     ; 219   delay_ms(LSE_DELAY);	
 637  0193 ae07d0        	ldw	x,#2000
 638  0196 cd0000        	call	_delay_ms
 640                     ; 221   if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 642  0199 c650c6        	ld	a,20678
 643  019c a508          	bcp	a,#8
 644  019e 2664          	jrne	L362
 645                     ; 223     LCD_GLASS_DisplayString("LSE");
 647  01a0 ae0065        	ldw	x,#L722
 648  01a3 cd0000        	call	_LCD_GLASS_DisplayString
 650                     ; 224     delay_ms(LSE_DELAY);
 652  01a6 ae07d0        	ldw	x,#2000
 653  01a9 cd0000        	call	_delay_ms
 655                     ; 225     if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 657  01ac c650c6        	ld	a,20678
 658  01af a508          	bcp	a,#8
 659  01b1 2651          	jrne	L362
 660                     ; 227       LCD_GLASS_DisplayString("LSE");
 662  01b3 ae0065        	ldw	x,#L722
 663  01b6 cd0000        	call	_LCD_GLASS_DisplayString
 665                     ; 228       delay_ms(LSE_DELAY);
 667  01b9 ae07d0        	ldw	x,#2000
 668  01bc cd0000        	call	_delay_ms
 670                     ; 229       if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 672  01bf c650c6        	ld	a,20678
 673  01c2 a508          	bcp	a,#8
 674  01c4 263e          	jrne	L362
 675                     ; 232         CLK_LSEConfig(CLK_LSE_OFF);
 677  01c6 4f            	clr	a
 678  01c7 cd0000        	call	_CLK_LSEConfig
 680                     ; 233         CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 682  01ca a603          	ld	a,#3
 683  01cc cd0000        	call	_CLK_SYSCLKDivConfig
 685                     ; 234         CLK_HSICmd(ENABLE);
 687  01cf a601          	ld	a,#1
 688  01d1 cd0000        	call	_CLK_HSICmd
 691  01d4               L142:
 692                     ; 235         while (((CLK->ICKCR)& 0x02)!=0x02);
 694  01d4 c650c2        	ld	a,20674
 695  01d7 a402          	and	a,#2
 696  01d9 a102          	cp	a,#2
 697  01db 26f7          	jrne	L142
 698                     ; 236         CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 700  01dd a601          	ld	a,#1
 701  01df cd0000        	call	_CLK_SYSCLKSourceConfig
 703                     ; 237         CLK_SYSCLKSourceSwitchCmd(ENABLE);
 705  01e2 a601          	ld	a,#1
 706  01e4 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 709  01e7               L742:
 710                     ; 238         while (((CLK->SWCR)& 0x01)==0x01);
 712  01e7 c650c9        	ld	a,20681
 713  01ea a401          	and	a,#1
 714  01ec a101          	cp	a,#1
 715  01ee 27f7          	jreq	L742
 716  01f0               L352:
 717                     ; 242           LCD_GLASS_ScrollSentence("LSE Not OK ",1,SCROLL_SPEED); //Press reset for exit
 719  01f0 ae0028        	ldw	x,#40
 720  01f3 89            	pushw	x
 721  01f4 ae0001        	ldw	x,#1
 722  01f7 89            	pushw	x
 723  01f8 ae0059        	ldw	x,#L752
 724  01fb cd0000        	call	_LCD_GLASS_ScrollSentence
 726  01fe 5b04          	addw	sp,#4
 727                     ; 243           KeyPressed = FALSE;
 729  0200 3f00          	clr	_KeyPressed
 731  0202 20ec          	jra	L352
 732  0204               L362:
 733                     ; 250   while (!((CLK->ECKCR)& CLK_ECKCR_LSERDY));	
 735  0204 c650c6        	ld	a,20678
 736  0207 a508          	bcp	a,#8
 737  0209 27f9          	jreq	L362
 738                     ; 253   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);
 740  020b a608          	ld	a,#8
 741  020d cd0000        	call	_CLK_SYSCLKSourceConfig
 743                     ; 254   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 745  0210 a601          	ld	a,#1
 746  0212 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 749  0215               L172:
 750                     ; 255   while (((CLK->SWCR)& 0x01)==0x01);
 752  0215 c650c9        	ld	a,20681
 753  0218 a401          	and	a,#1
 754  021a a101          	cp	a,#1
 755  021c 27f7          	jreq	L172
 756                     ; 257   LCD_GLASS_DisplayString("LSE OK");
 758  021e ae0052        	ldw	x,#L572
 759  0221 cd0000        	call	_LCD_GLASS_DisplayString
 761                     ; 261   CLK_LSEConfig(CLK_LSE_OFF);
 763  0224 4f            	clr	a
 764  0225 cd0000        	call	_CLK_LSEConfig
 766                     ; 262   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 768  0228 a603          	ld	a,#3
 769  022a cd0000        	call	_CLK_SYSCLKDivConfig
 771                     ; 263   CLK_HSICmd(ENABLE);
 773  022d a601          	ld	a,#1
 774  022f cd0000        	call	_CLK_HSICmd
 777  0232               L103:
 778                     ; 264   while (((CLK->ICKCR)& 0x02)!=0x02);
 780  0232 c650c2        	ld	a,20674
 781  0235 a402          	and	a,#2
 782  0237 a102          	cp	a,#2
 783  0239 26f7          	jrne	L103
 784                     ; 265   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 786  023b a601          	ld	a,#1
 787  023d cd0000        	call	_CLK_SYSCLKSourceConfig
 789                     ; 266   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 791  0240 a601          	ld	a,#1
 792  0242 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 795  0245               L703:
 796                     ; 267   while (((CLK->SWCR)& 0x01)==0x01);
 798  0245 c650c9        	ld	a,20681
 799  0248 a401          	and	a,#1
 800  024a a101          	cp	a,#1
 801  024c 27f7          	jreq	L703
 802                     ; 268   delay_ms(100);
 804  024e ae0064        	ldw	x,#100
 805  0251 cd0000        	call	_delay_ms
 807                     ; 269 }
 810  0254 81            	ret
 813                     .const:	section	.text
 814  0000               L313_tab:
 815  0000 0020          	dc.w	32
 816  0002 0020          	dc.w	32
 817  0004 0020          	dc.w	32
 818  0006 0020          	dc.w	32
 819  0008 0020          	dc.w	32
 820  000a 0020          	dc.w	32
 864                     ; 277 void auto_test(void)
 864                     ; 278 {
 865                     	switch	.text
 866  0255               _auto_test:
 868  0255 520c          	subw	sp,#12
 869       0000000c      OFST:	set	12
 872                     ; 279   uint16_t tab[6]={0x20,0x20,0x20,0x20,0x20,0x20};
 874  0257 96            	ldw	x,sp
 875  0258 1c0001        	addw	x,#OFST-11
 876  025b 90ae0000      	ldw	y,#L313_tab
 877  025f a60c          	ld	a,#12
 878  0261 cd0000        	call	c_xymvx
 880                     ; 281   Auto_test = TRUE;
 882  0264 35010000      	mov	_Auto_test,#1
 883                     ; 284   GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 885  0268 721f5014      	bres	20500,#7
 886                     ; 285   GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 888  026c 721f500a      	bres	20490,#7
 889                     ; 288   LCD_GLASS_DisplayString(" TEST ");
 891  0270 ae004b        	ldw	x,#L333
 892  0273 cd0000        	call	_LCD_GLASS_DisplayString
 894                     ; 289   delay_ms(150);
 896  0276 ae0096        	ldw	x,#150
 897  0279 cd0000        	call	_delay_ms
 899                     ; 290   STR_VERSION;
 901  027c ae0056        	ldw	x,#86
 902  027f 1f03          	ldw	(OFST-9,sp),x
 905  0281 ae8031        	ldw	x,#32817
 906  0284 1f05          	ldw	(OFST-7,sp),x
 909  0286 ae8032        	ldw	x,#32818
 910  0289 1f07          	ldw	(OFST-5,sp),x
 913  028b ae0034        	ldw	x,#52
 914  028e 1f09          	ldw	(OFST-3,sp),x
 915                     ; 291   LCD_GLASS_DisplayStrDeci(tab);
 917  0290 96            	ldw	x,sp
 918  0291 1c0001        	addw	x,#OFST-11
 919  0294 cd0000        	call	_LCD_GLASS_DisplayStrDeci
 921                     ; 292   delay_ms(200);
 923  0297 ae00c8        	ldw	x,#200
 924  029a cd0000        	call	_delay_ms
 926                     ; 295   test_LSE();
 928  029d cd0184        	call	_test_LSE
 930                     ; 296   test_vdd();
 932  02a0 cd0017        	call	_test_vdd
 934                     ; 297   test_icc_Run();
 936  02a3 cd005f        	call	_test_icc_Run
 938                     ; 298   test_icc_HALT();
 940  02a6 cd00aa        	call	_test_icc_HALT
 942                     ; 299   test_icc_LP();
 944  02a9 cd0117        	call	_test_icc_LP
 946                     ; 301   Auto_test = FALSE;
 948  02ac 3f00          	clr	_Auto_test
 949  02ae               L533:
 950                     ; 306     LCD_GLASS_ScrollSentence("TEST OK ",1,SCROLL_SPEED);
 952  02ae ae0028        	ldw	x,#40
 953  02b1 89            	pushw	x
 954  02b2 ae0001        	ldw	x,#1
 955  02b5 89            	pushw	x
 956  02b6 ae0042        	ldw	x,#L143
 957  02b9 cd0000        	call	_LCD_GLASS_ScrollSentence
 959  02bc 5b04          	addw	sp,#4
 960                     ; 307     KeyPressed = FALSE;
 962  02be 3f00          	clr	_KeyPressed
 964  02c0 20ec          	jra	L533
1013                     ; 317 void Bias_measurement(void)
1013                     ; 318 {
1014                     	switch	.text
1015  02c2               _Bias_measurement:
1017  02c2 5207          	subw	sp,#7
1018       00000007      OFST:	set	7
1021                     ; 322   LCD_GLASS_ScrollSentence("      ** BIAS CURRENT ** JP1 OFF **",1,SCROLL_SPEED);	
1023  02c4 ae0028        	ldw	x,#40
1024  02c7 89            	pushw	x
1025  02c8 ae0001        	ldw	x,#1
1026  02cb 89            	pushw	x
1027  02cc ae001e        	ldw	x,#L563
1028  02cf cd0000        	call	_LCD_GLASS_ScrollSentence
1030  02d2 5b04          	addw	sp,#4
1031                     ; 324   B_Current = ADC_Icc_Test(MCU_HALT);
1033  02d4 a603          	ld	a,#3
1034  02d6 cd0000        	call	_ADC_Icc_Test
1036  02d9 01            	rrwa	x,a
1037  02da 6b05          	ld	(OFST-2,sp),a
1038  02dc 02            	rlwa	x,a
1039                     ; 325   V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1041  02dd 7b05          	ld	a,(OFST-2,sp)
1042  02df 5f            	clrw	x
1043  02e0 97            	ld	xl,a
1044  02e1 cd0000        	call	c_itof
1046  02e4 96            	ldw	x,sp
1047  02e5 1c0001        	addw	x,#OFST-6
1048  02e8 cd0000        	call	c_rtol
1050  02eb cd0457        	call	_Vdd_appli
1052  02ee ae001a        	ldw	x,#L373
1053  02f1 cd0000        	call	c_fdiv
1055  02f4 96            	ldw	x,sp
1056  02f5 1c0001        	addw	x,#OFST-6
1057  02f8 cd0000        	call	c_fmul
1059  02fb cd0000        	call	c_ftoi
1061  02fe 1f06          	ldw	(OFST-1,sp),x
1062                     ; 326   V_Current *= 10L;
1064  0300 1e06          	ldw	x,(OFST-1,sp)
1065  0302 90ae000a      	ldw	y,#10
1066  0306 cd0000        	call	c_imul
1068  0309 1f06          	ldw	(OFST-1,sp),x
1069                     ; 327   display_MuAmp(V_Current);
1071  030b 1e06          	ldw	x,(OFST-1,sp)
1072  030d cd04d0        	call	_display_MuAmp
1074                     ; 330   FLASH_ProgramBias(B_Current);
1076  0310 7b05          	ld	a,(OFST-2,sp)
1077  0312 cd0000        	call	_FLASH_ProgramBias
1079  0315               L773:
1080                     ; 334     B_Current = ADC_Icc_Test(MCU_HALT);
1082  0315 a603          	ld	a,#3
1083  0317 cd0000        	call	_ADC_Icc_Test
1085  031a 01            	rrwa	x,a
1086  031b 6b05          	ld	(OFST-2,sp),a
1087  031d 02            	rlwa	x,a
1088                     ; 335     V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1090  031e 7b05          	ld	a,(OFST-2,sp)
1091  0320 5f            	clrw	x
1092  0321 97            	ld	xl,a
1093  0322 cd0000        	call	c_itof
1095  0325 96            	ldw	x,sp
1096  0326 1c0001        	addw	x,#OFST-6
1097  0329 cd0000        	call	c_rtol
1099  032c cd0457        	call	_Vdd_appli
1101  032f ae001a        	ldw	x,#L373
1102  0332 cd0000        	call	c_fdiv
1104  0335 96            	ldw	x,sp
1105  0336 1c0001        	addw	x,#OFST-6
1106  0339 cd0000        	call	c_fmul
1108  033c cd0000        	call	c_ftoi
1110  033f 1f06          	ldw	(OFST-1,sp),x
1111                     ; 336     V_Current *= 10L;
1113  0341 1e06          	ldw	x,(OFST-1,sp)
1114  0343 90ae000a      	ldw	y,#10
1115  0347 cd0000        	call	c_imul
1117  034a 1f06          	ldw	(OFST-1,sp),x
1118                     ; 337     display_MuAmp(V_Current);
1120  034c 1e06          	ldw	x,(OFST-1,sp)
1121  034e cd04d0        	call	_display_MuAmp
1123                     ; 338     delay_ms(300);
1125  0351 ae012c        	ldw	x,#300
1126  0354 cd0000        	call	_delay_ms
1129  0357 20bc          	jra	L773
1218                     ; 350 void convert_into_char(uint16_t number, uint16_t *p_tab)
1218                     ; 351 {
1219                     	switch	.text
1220  0359               _convert_into_char:
1222  0359 89            	pushw	x
1223  035a 520a          	subw	sp,#10
1224       0000000a      OFST:	set	10
1227                     ; 352   uint16_t units=0, tens=0, hundreds=0, thousands=0, misc=0;
1237                     ; 354   units = (((number%10000)%1000)%100)%10;
1239  035c 90ae2710      	ldw	y,#10000
1240  0360 65            	divw	x,y
1241  0361 51            	exgw	x,y
1242  0362 90ae03e8      	ldw	y,#1000
1243  0366 65            	divw	x,y
1244  0367 51            	exgw	x,y
1245  0368 a664          	ld	a,#100
1246  036a 62            	div	x,a
1247  036b 5f            	clrw	x
1248  036c 97            	ld	xl,a
1249  036d a60a          	ld	a,#10
1250  036f 62            	div	x,a
1251  0370 5f            	clrw	x
1252  0371 97            	ld	xl,a
1253  0372 1f09          	ldw	(OFST-1,sp),x
1254                     ; 355   tens = ((((number-units)/10)%1000)%100)%10;
1256  0374 1e0b          	ldw	x,(OFST+1,sp)
1257  0376 72f009        	subw	x,(OFST-1,sp)
1258  0379 a60a          	ld	a,#10
1259  037b 62            	div	x,a
1260  037c 90ae03e8      	ldw	y,#1000
1261  0380 65            	divw	x,y
1262  0381 51            	exgw	x,y
1263  0382 a664          	ld	a,#100
1264  0384 62            	div	x,a
1265  0385 5f            	clrw	x
1266  0386 97            	ld	xl,a
1267  0387 a60a          	ld	a,#10
1268  0389 62            	div	x,a
1269  038a 5f            	clrw	x
1270  038b 97            	ld	xl,a
1271  038c 1f07          	ldw	(OFST-3,sp),x
1272                     ; 356   hundreds = (((number-tens-units)/100))%100%10;
1274  038e 1e0b          	ldw	x,(OFST+1,sp)
1275  0390 72f007        	subw	x,(OFST-3,sp)
1276  0393 72f009        	subw	x,(OFST-1,sp)
1277  0396 a664          	ld	a,#100
1278  0398 62            	div	x,a
1279  0399 a664          	ld	a,#100
1280  039b 62            	div	x,a
1281  039c 5f            	clrw	x
1282  039d 97            	ld	xl,a
1283  039e a60a          	ld	a,#10
1284  03a0 62            	div	x,a
1285  03a1 5f            	clrw	x
1286  03a2 97            	ld	xl,a
1287  03a3 1f05          	ldw	(OFST-5,sp),x
1288                     ; 357   thousands = ((number-hundreds-tens-units)/1000)%10;
1290  03a5 1e0b          	ldw	x,(OFST+1,sp)
1291  03a7 72f005        	subw	x,(OFST-5,sp)
1292  03aa 72f007        	subw	x,(OFST-3,sp)
1293  03ad 72f009        	subw	x,(OFST-1,sp)
1294  03b0 90ae03e8      	ldw	y,#1000
1295  03b4 65            	divw	x,y
1296  03b5 a60a          	ld	a,#10
1297  03b7 62            	div	x,a
1298  03b8 5f            	clrw	x
1299  03b9 97            	ld	xl,a
1300  03ba 1f03          	ldw	(OFST-7,sp),x
1301                     ; 358   misc = ((number-thousands-hundreds-tens-units)/10000);
1303  03bc 1e0b          	ldw	x,(OFST+1,sp)
1304  03be 72f003        	subw	x,(OFST-7,sp)
1305  03c1 72f005        	subw	x,(OFST-5,sp)
1306  03c4 72f007        	subw	x,(OFST-3,sp)
1307  03c7 72f009        	subw	x,(OFST-1,sp)
1308  03ca 90ae2710      	ldw	y,#10000
1309  03ce 65            	divw	x,y
1310  03cf 1f01          	ldw	(OFST-9,sp),x
1311                     ; 360   *(p_tab+4) = units + 0x30;
1313  03d1 1e09          	ldw	x,(OFST-1,sp)
1314  03d3 1c0030        	addw	x,#48
1315  03d6 160f          	ldw	y,(OFST+5,sp)
1316  03d8 90ef08        	ldw	(8,y),x
1317                     ; 361   *(p_tab+3) = tens + 0x30;
1319  03db 1e07          	ldw	x,(OFST-3,sp)
1320  03dd 1c0030        	addw	x,#48
1321  03e0 160f          	ldw	y,(OFST+5,sp)
1322  03e2 90ef06        	ldw	(6,y),x
1323                     ; 362   *(p_tab+2) = hundreds + 0x30;
1325  03e5 1e05          	ldw	x,(OFST-5,sp)
1326  03e7 1c0030        	addw	x,#48
1327  03ea 160f          	ldw	y,(OFST+5,sp)
1328  03ec 90ef04        	ldw	(4,y),x
1329                     ; 363   *(p_tab+1) = thousands + 0x30;
1331  03ef 1e03          	ldw	x,(OFST-7,sp)
1332  03f1 1c0030        	addw	x,#48
1333  03f4 160f          	ldw	y,(OFST+5,sp)
1334  03f6 90ef02        	ldw	(2,y),x
1335                     ; 364   *(p_tab) = misc + 0x30;
1337  03f9 1e01          	ldw	x,(OFST-9,sp)
1338  03fb 1c0030        	addw	x,#48
1339  03fe 160f          	ldw	y,(OFST+5,sp)
1340  0400 90ff          	ldw	(y),x
1341                     ; 366 }
1344  0402 5b0c          	addw	sp,#12
1345  0404 81            	ret
1380                     ; 376 void	LPR_Ram(void)
1380                     ; 377 #endif
1380                     ; 378 #ifdef _RAISONANCE_
1380                     ; 379 void	LPR_Ram(void) inram
1380                     ; 380 #endif
1380                     ; 381 #ifdef _IAR_
1380                     ; 382 #pragma location="MY_RAM_FUNC"
1380                     ; 383 void	LPR_Ram(void)
1380                     ; 384 #endif
1380                     ; 385 { 
1381                     .LPRUN:	section	.text
1382  0000               _LPR_Ram:
1384  0000 88            	push	a
1385       00000001      OFST:	set	1
1388                     ; 386   uint8_t i = 0;
1390                     ; 390   FLASH->CR1 = 0x08;
1392  0001 35085050      	mov	20560,#8
1394  0005               L374:
1395                     ; 391   while(((CLK->REGCSR)&0x80)==0x80);
1397  0005 c650cf        	ld	a,20687
1398  0008 a480          	and	a,#128
1399  000a a180          	cp	a,#128
1400  000c 27f7          	jreq	L374
1401                     ; 394   CLK->REGCSR = 0x02;
1403  000e 350250cf      	mov	20687,#2
1405  0012               L305:
1406                     ; 395   while(((CLK->REGCSR)&0x01)==0x01);
1408  0012 c650cf        	ld	a,20687
1409  0015 a401          	and	a,#1
1410  0017 a101          	cp	a,#1
1411  0019 27f7          	jreq	L305
1412                     ; 398   WFE->CR2 = 0x04;
1414  001b 350450a7      	mov	20647,#4
1415                     ; 399   GPIOE->CR2 = 0x44;
1417  001f 35445018      	mov	20504,#68
1418                     ; 401   for (i=0; i<100; i++);
1420  0023 0f01          	clr	(OFST+0,sp)
1421  0025               L705:
1425  0025 0c01          	inc	(OFST+0,sp)
1428  0027 7b01          	ld	a,(OFST+0,sp)
1429  0029 a164          	cp	a,#100
1430  002b 25f8          	jrult	L705
1431                     ; 404   GPIO_LOW(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
1433  002d 7219500a      	bres	20490,#4
1434                     ; 407   wfe();
1437  0031 728f          wfe
1439                     ; 409   EXTI->SR1 |= 0x40;
1442  0033 721c50a3      	bset	20643,#6
1443                     ; 410   WFE->CR2 = 0x00;
1445  0037 725f50a7      	clr	20647
1446                     ; 413   CLK->REGCSR = 0x00;
1448  003b 725f50cf      	clr	20687
1450  003f               L125:
1451                     ; 414   while(((CLK->REGCSR)&0x1) != 0x1);		
1453  003f c650cf        	ld	a,20687
1454  0042 a401          	and	a,#1
1455  0044 a101          	cp	a,#1
1456  0046 26f7          	jrne	L125
1457                     ; 415 }
1460  0048 84            	pop	a
1461  0049 81            	ret
1491                     ; 427 void LPR_init(void)
1491                     ; 428 {
1492                     	switch	.text
1493  0405               _LPR_init:
1497                     ; 437     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1499  0405 4f            	clr	a
1500  0406 cd0000        	call	_CLK_SYSCLKDivConfig
1502                     ; 438     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
1504  0409 a602          	ld	a,#2
1505  040b cd0000        	call	_CLK_SYSCLKSourceConfig
1507                     ; 439     CLK_SYSCLKSourceSwitchCmd(ENABLE);
1509  040e a601          	ld	a,#1
1510  0410 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1513  0413               L735:
1514                     ; 440     while (((CLK->SWCR)& 0x01)==0x01);
1516  0413 c650c9        	ld	a,20681
1517  0416 a401          	and	a,#1
1518  0418 a101          	cp	a,#1
1519  041a 27f7          	jreq	L735
1520                     ; 441     CLK_HSICmd(DISABLE);
1522  041c 4f            	clr	a
1523  041d cd0000        	call	_CLK_HSICmd
1525                     ; 446   sim();
1528  0420 9b            sim
1530                     ; 450   if (!(_fctcpy('L')))
1533  0421 a64c          	ld	a,#76
1534  0423 cd0000        	call	__fctcpy
1536  0426 a30000        	cpw	x,#0
1537  0429 2602          	jrne	L345
1538  042b               L545:
1539                     ; 451     while(1);
1541  042b 20fe          	jra	L545
1542  042d               L345:
1543                     ; 454   LPR_Ram(); // Call in RAM
1545  042d cd0000        	call	_LPR_Ram
1547                     ; 457   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
1549  0430 a603          	ld	a,#3
1550  0432 cd0000        	call	_CLK_SYSCLKDivConfig
1552                     ; 458   CLK_HSICmd(ENABLE);
1554  0435 a601          	ld	a,#1
1555  0437 cd0000        	call	_CLK_HSICmd
1558  043a               L355:
1559                     ; 459   while (((CLK->ICKCR)& 0x02)!=0x02);
1561  043a c650c2        	ld	a,20674
1562  043d a402          	and	a,#2
1563  043f a102          	cp	a,#2
1564  0441 26f7          	jrne	L355
1565                     ; 461   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1567  0443 a601          	ld	a,#1
1568  0445 cd0000        	call	_CLK_SYSCLKSourceConfig
1570                     ; 462   CLK_SYSCLKSourceSwitchCmd(ENABLE);
1572  0448 a601          	ld	a,#1
1573  044a cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1576  044d               L165:
1577                     ; 463   while (((CLK->SWCR)& 0x01)==0x01);
1579  044d c650c9        	ld	a,20681
1580  0450 a401          	and	a,#1
1581  0452 a101          	cp	a,#1
1582  0454 27f7          	jreq	L165
1583                     ; 465 }
1586  0456 81            	ret
1640                     ; 491 float Vdd_appli(void)
1640                     ; 492 {
1641                     	switch	.text
1642  0457               _Vdd_appli:
1644  0457 520c          	subw	sp,#12
1645       0000000c      OFST:	set	12
1648                     ; 497   P_VREFINT_Factory = VREFINT_Factory_CONV_ADDRESS;
1650                     ; 500   MeasurINT = ADC_Supply();	
1652  0459 cd0000        	call	_ADC_Supply
1654  045c 1f07          	ldw	(OFST-5,sp),x
1655                     ; 522     f_Vdd_appli = (VREF/MeasurINT) * ADC_CONV;
1657  045e 1e07          	ldw	x,(OFST-5,sp)
1658  0460 cd0000        	call	c_uitof
1660  0463 96            	ldw	x,sp
1661  0464 1c0001        	addw	x,#OFST-11
1662  0467 cd0000        	call	c_rtol
1664  046a ae0016        	ldw	x,#L716
1665  046d cd0000        	call	c_ltor
1667  0470 96            	ldw	x,sp
1668  0471 1c0001        	addw	x,#OFST-11
1669  0474 cd0000        	call	c_fdiv
1671  0477 ae001a        	ldw	x,#L373
1672  047a cd0000        	call	c_fmul
1674  047d 96            	ldw	x,sp
1675  047e 1c0009        	addw	x,#OFST-3
1676  0481 cd0000        	call	c_rtol
1678                     ; 526   f_Vdd_appli *= 1000L;
1680  0484 ae03e8        	ldw	x,#1000
1681  0487 cd0000        	call	c_itof
1683  048a 96            	ldw	x,sp
1684  048b 1c0009        	addw	x,#OFST-3
1685  048e cd0000        	call	c_fgmul
1687                     ; 528   return f_Vdd_appli;
1689  0491 96            	ldw	x,sp
1690  0492 1c0009        	addw	x,#OFST-3
1691  0495 cd0000        	call	c_ltor
1695  0498 5b0c          	addw	sp,#12
1696  049a 81            	ret
1743                     ; 537 uint16_t Vref_measure(void)
1743                     ; 538 {
1744                     	switch	.text
1745  049b               _Vref_measure:
1747  049b 520e          	subw	sp,#14
1748       0000000e      OFST:	set	14
1751                     ; 542   Vdd_mV = (uint16_t)Vdd_appli();
1753  049d adb8          	call	_Vdd_appli
1755  049f cd0000        	call	c_ftoi
1757  04a2 1f01          	ldw	(OFST-13,sp),x
1758                     ; 544   convert_into_char (Vdd_mV, tab);
1760  04a4 96            	ldw	x,sp
1761  04a5 1c0003        	addw	x,#OFST-11
1762  04a8 89            	pushw	x
1763  04a9 1e03          	ldw	x,(OFST-11,sp)
1764  04ab cd0359        	call	_convert_into_char
1766  04ae 85            	popw	x
1767                     ; 547   tab[5] = 'V';
1769  04af ae0056        	ldw	x,#86
1770  04b2 1f0d          	ldw	(OFST-1,sp),x
1771                     ; 548   tab[4] = ' ';
1773  04b4 ae0020        	ldw	x,#32
1774  04b7 1f0b          	ldw	(OFST-3,sp),x
1775                     ; 549   tab[1] |= DOT; /* To add decimal point for display in volt */
1777  04b9 7b05          	ld	a,(OFST-9,sp)
1778  04bb aa80          	or	a,#128
1779  04bd 6b05          	ld	(OFST-9,sp),a
1780                     ; 550   tab[0] = ' ';
1782  04bf ae0020        	ldw	x,#32
1783  04c2 1f03          	ldw	(OFST-11,sp),x
1784                     ; 552   LCD_GLASS_DisplayStrDeci(tab);
1786  04c4 96            	ldw	x,sp
1787  04c5 1c0003        	addw	x,#OFST-11
1788  04c8 cd0000        	call	_LCD_GLASS_DisplayStrDeci
1790                     ; 554   return Vdd_mV;
1792  04cb 1e01          	ldw	x,(OFST-13,sp)
1795  04cd 5b0e          	addw	sp,#14
1796  04cf 81            	ret
1842                     ; 563 void display_MuAmp (uint16_t Current)
1842                     ; 564 {
1843                     	switch	.text
1844  04d0               _display_MuAmp:
1846  04d0 89            	pushw	x
1847  04d1 520c          	subw	sp,#12
1848       0000000c      OFST:	set	12
1851                     ; 567   convert_into_char((int)Current, tab);
1853  04d3 96            	ldw	x,sp
1854  04d4 1c0001        	addw	x,#OFST-11
1855  04d7 89            	pushw	x
1856  04d8 1e0f          	ldw	x,(OFST+3,sp)
1857  04da cd0359        	call	_convert_into_char
1859  04dd 85            	popw	x
1860                     ; 568   tab[5] = 'A';
1862  04de ae0041        	ldw	x,#65
1863  04e1 1f0b          	ldw	(OFST-1,sp),x
1864                     ; 569   tab[4] = 'µ';
1866  04e3 ae00b5        	ldw	x,#181
1867  04e6 1f09          	ldw	(OFST-3,sp),x
1868                     ; 572   if ( tab[0] != '0')
1870  04e8 1e01          	ldw	x,(OFST-11,sp)
1871  04ea a30030        	cpw	x,#48
1872  04ed 2708          	jreq	L766
1873                     ; 574     tab[1] |= DOT; /* To add decimal point */
1875  04ef 7b03          	ld	a,(OFST-9,sp)
1876  04f1 aa80          	or	a,#128
1877  04f3 6b03          	ld	(OFST-9,sp),a
1879  04f5 2018          	jra	L176
1880  04f7               L766:
1881                     ; 577     tab[0] = tab[1] | DOT ;	
1883  04f7 1e03          	ldw	x,(OFST-9,sp)
1884  04f9 01            	rrwa	x,a
1885  04fa aa00          	or	a,#0
1886  04fc 01            	rrwa	x,a
1887  04fd aa80          	or	a,#128
1888  04ff 01            	rrwa	x,a
1889  0500 1f01          	ldw	(OFST-11,sp),x
1890                     ; 578     tab[1] = tab[2] ;
1892  0502 1e05          	ldw	x,(OFST-7,sp)
1893  0504 1f03          	ldw	(OFST-9,sp),x
1894                     ; 579     tab[2] = tab[3] ;		
1896  0506 1e07          	ldw	x,(OFST-5,sp)
1897  0508 1f05          	ldw	(OFST-7,sp),x
1898                     ; 580     tab[3] = ' ';
1900  050a ae0020        	ldw	x,#32
1901  050d 1f07          	ldw	(OFST-5,sp),x
1902  050f               L176:
1903                     ; 583   LCD_GLASS_DisplayStrDeci(tab);
1905  050f 96            	ldw	x,sp
1906  0510 1c0001        	addw	x,#OFST-11
1907  0513 cd0000        	call	_LCD_GLASS_DisplayStrDeci
1909                     ; 584 }
1912  0516 5b0e          	addw	sp,#14
1913  0518 81            	ret
1970                     ; 592 float Icc_measure_RUN(void)
1970                     ; 593 {
1971                     	switch	.text
1972  0519               _Icc_measure_RUN:
1974  0519 5216          	subw	sp,#22
1975       00000016      OFST:	set	22
1978                     ; 598   MeasurINT = ADC_Icc_Test(MCU_RUN);
1980  051b 4f            	clr	a
1981  051c cd0000        	call	_ADC_Icc_Test
1983  051f 1f05          	ldw	(OFST-17,sp),x
1984                     ; 600   Run_Conso = MeasurINT * Vdd_appli()/ADC_CONV;
1986  0521 1e05          	ldw	x,(OFST-17,sp)
1987  0523 cd0000        	call	c_uitof
1989  0526 96            	ldw	x,sp
1990  0527 1c0001        	addw	x,#OFST-21
1991  052a cd0000        	call	c_rtol
1993  052d cd0457        	call	_Vdd_appli
1995  0530 96            	ldw	x,sp
1996  0531 1c0001        	addw	x,#OFST-21
1997  0534 cd0000        	call	c_fmul
1999  0537 ae001a        	ldw	x,#L373
2000  053a cd0000        	call	c_fdiv
2002  053d 96            	ldw	x,sp
2003  053e 1c0007        	addw	x,#OFST-15
2004  0541 cd0000        	call	c_rtol
2006                     ; 601   Run_Conso *= 10L; 
2008  0544 a60a          	ld	a,#10
2009  0546 cd0000        	call	c_ctof
2011  0549 96            	ldw	x,sp
2012  054a 1c0007        	addw	x,#OFST-15
2013  054d cd0000        	call	c_fgmul
2015                     ; 603   convert_into_char((int)(Run_Conso*10), tab);
2017  0550 96            	ldw	x,sp
2018  0551 1c000b        	addw	x,#OFST-11
2019  0554 89            	pushw	x
2020  0555 96            	ldw	x,sp
2021  0556 1c0009        	addw	x,#OFST-13
2022  0559 cd0000        	call	c_ltor
2024  055c ae0012        	ldw	x,#L527
2025  055f cd0000        	call	c_fmul
2027  0562 cd0000        	call	c_ftoi
2029  0565 cd0359        	call	_convert_into_char
2031  0568 85            	popw	x
2032                     ; 606   tab[5] = 'A';
2034  0569 ae0041        	ldw	x,#65
2035  056c 1f15          	ldw	(OFST-1,sp),x
2036                     ; 607   tab[4] = 'm';
2038  056e ae006d        	ldw	x,#109
2039  0571 1f13          	ldw	(OFST-3,sp),x
2040                     ; 608   tab[3] = ' ';
2042  0573 ae0020        	ldw	x,#32
2043  0576 1f11          	ldw	(OFST-5,sp),x
2044                     ; 609   tab[0] |= DOT; /* To add decimal point for display in volt */
2046  0578 7b0b          	ld	a,(OFST-11,sp)
2047  057a aa80          	or	a,#128
2048  057c 6b0b          	ld	(OFST-11,sp),a
2049                     ; 611   LCD_GLASS_DisplayStrDeci(tab);
2051  057e 96            	ldw	x,sp
2052  057f 1c000b        	addw	x,#OFST-11
2053  0582 cd0000        	call	_LCD_GLASS_DisplayStrDeci
2055                     ; 613   return (Run_Conso);
2057  0585 96            	ldw	x,sp
2058  0586 1c0007        	addw	x,#OFST-15
2059  0589 cd0000        	call	c_ltor
2063  058c 5b16          	addw	sp,#22
2064  058e 81            	ret
2113                     ; 622 float Icc_measure_HALT(void)
2113                     ; 623 {
2114                     	switch	.text
2115  058f               _Icc_measure_HALT:
2117  058f 520a          	subw	sp,#10
2118       0000000a      OFST:	set	10
2121                     ; 628   MeasurINT = ADC_Icc_Test(MCU_HALT);
2123  0591 a603          	ld	a,#3
2124  0593 cd0000        	call	_ADC_Icc_Test
2126  0596 1f05          	ldw	(OFST-5,sp),x
2127                     ; 631   MeasurINT -=	Bias_Current;
2129  0598 c60000        	ld	a,_Bias_Current
2130  059b 5f            	clrw	x
2131  059c 97            	ld	xl,a
2132  059d 1f03          	ldw	(OFST-7,sp),x
2133  059f 1e05          	ldw	x,(OFST-5,sp)
2134  05a1 72f003        	subw	x,(OFST-7,sp)
2135  05a4 1f05          	ldw	(OFST-5,sp),x
2136                     ; 632   Current = MeasurINT * Vdd_appli()/ADC_CONV;  
2138  05a6 1e05          	ldw	x,(OFST-5,sp)
2139  05a8 cd0000        	call	c_uitof
2141  05ab 96            	ldw	x,sp
2142  05ac 1c0001        	addw	x,#OFST-9
2143  05af cd0000        	call	c_rtol
2145  05b2 cd0457        	call	_Vdd_appli
2147  05b5 96            	ldw	x,sp
2148  05b6 1c0001        	addw	x,#OFST-9
2149  05b9 cd0000        	call	c_fmul
2151  05bc ae001a        	ldw	x,#L373
2152  05bf cd0000        	call	c_fdiv
2154  05c2 96            	ldw	x,sp
2155  05c3 1c0007        	addw	x,#OFST-3
2156  05c6 cd0000        	call	c_rtol
2158                     ; 634   Current *= 10L;
2160  05c9 a60a          	ld	a,#10
2161  05cb cd0000        	call	c_ctof
2163  05ce 96            	ldw	x,sp
2164  05cf 1c0007        	addw	x,#OFST-3
2165  05d2 cd0000        	call	c_fgmul
2167                     ; 636   if ((int) Current<MAX_CURRENT)
2169  05d5 9c            	rvf
2170  05d6 96            	ldw	x,sp
2171  05d7 1c0007        	addw	x,#OFST-3
2172  05da cd0000        	call	c_ltor
2174  05dd cd0000        	call	c_ftoi
2176  05e0 a3270f        	cpw	x,#9999
2177  05e3 2e0f          	jrsge	L357
2178                     ; 638     display_MuAmp((int)Current);
2180  05e5 96            	ldw	x,sp
2181  05e6 1c0007        	addw	x,#OFST-3
2182  05e9 cd0000        	call	c_ltor
2184  05ec cd0000        	call	c_ftoi
2186  05ef cd04d0        	call	_display_MuAmp
2189  05f2 2009          	jra	L557
2190  05f4               L357:
2191                     ; 640     LCD_GLASS_Clear();
2193  05f4 cd0000        	call	_LCD_GLASS_Clear
2195                     ; 641     LCD_GLASS_DisplayString("Error");
2197  05f7 ae000c        	ldw	x,#L757
2198  05fa cd0000        	call	_LCD_GLASS_DisplayString
2200  05fd               L557:
2201                     ; 644   return(Current);
2203  05fd 96            	ldw	x,sp
2204  05fe 1c0007        	addw	x,#OFST-3
2205  0601 cd0000        	call	c_ltor
2209  0604 5b0a          	addw	sp,#10
2210  0606 81            	ret
2260                     ; 653 float Icc_measure_LPR(void)
2260                     ; 654 {
2261                     	switch	.text
2262  0607               _Icc_measure_LPR:
2264  0607 520a          	subw	sp,#10
2265       0000000a      OFST:	set	10
2268                     ; 659   MeasurINT = ADC_Icc_Test(MCU_LPR);
2270  0609 a601          	ld	a,#1
2271  060b cd0000        	call	_ADC_Icc_Test
2273  060e 1f05          	ldw	(OFST-5,sp),x
2274                     ; 662   MeasurINT -= Bias_Current;
2276  0610 c60000        	ld	a,_Bias_Current
2277  0613 5f            	clrw	x
2278  0614 97            	ld	xl,a
2279  0615 1f03          	ldw	(OFST-7,sp),x
2280  0617 1e05          	ldw	x,(OFST-5,sp)
2281  0619 72f003        	subw	x,(OFST-7,sp)
2282  061c 1f05          	ldw	(OFST-5,sp),x
2283                     ; 664   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2285  061e 1e05          	ldw	x,(OFST-5,sp)
2286  0620 cd0000        	call	c_uitof
2288  0623 96            	ldw	x,sp
2289  0624 1c0001        	addw	x,#OFST-9
2290  0627 cd0000        	call	c_rtol
2292  062a cd0457        	call	_Vdd_appli
2294  062d 96            	ldw	x,sp
2295  062e 1c0001        	addw	x,#OFST-9
2296  0631 cd0000        	call	c_fmul
2298  0634 ae001a        	ldw	x,#L373
2299  0637 cd0000        	call	c_fdiv
2301  063a 96            	ldw	x,sp
2302  063b 1c0007        	addw	x,#OFST-3
2303  063e cd0000        	call	c_rtol
2305                     ; 665   Current *= 10L;
2307  0641 a60a          	ld	a,#10
2308  0643 cd0000        	call	c_ctof
2310  0646 96            	ldw	x,sp
2311  0647 1c0007        	addw	x,#OFST-3
2312  064a cd0000        	call	c_fgmul
2314                     ; 668   if ((int) Current<MAX_CURRENT)
2316  064d 9c            	rvf
2317  064e 96            	ldw	x,sp
2318  064f 1c0007        	addw	x,#OFST-3
2319  0652 cd0000        	call	c_ltor
2321  0655 cd0000        	call	c_ftoi
2323  0658 a3270f        	cpw	x,#9999
2324  065b 2e0f          	jrsge	L3001
2325                     ; 670     display_MuAmp((int)Current);
2327  065d 96            	ldw	x,sp
2328  065e 1c0007        	addw	x,#OFST-3
2329  0661 cd0000        	call	c_ltor
2331  0664 cd0000        	call	c_ftoi
2333  0667 cd04d0        	call	_display_MuAmp
2336  066a 200d          	jra	L5001
2337  066c               L3001:
2338                     ; 674     if (!Auto_test)
2340  066c 3d00          	tnz	_Auto_test
2341  066e 2609          	jrne	L5001
2342                     ; 676       LCD_GLASS_Clear();
2344  0670 cd0000        	call	_LCD_GLASS_Clear
2346                     ; 677       LCD_GLASS_DisplayString("Error");
2348  0673 ae000c        	ldw	x,#L757
2349  0676 cd0000        	call	_LCD_GLASS_DisplayString
2351  0679               L5001:
2352                     ; 681   return (Current);
2354  0679 96            	ldw	x,sp
2355  067a 1c0007        	addw	x,#OFST-3
2356  067d cd0000        	call	c_ltor
2360  0680 5b0a          	addw	sp,#10
2361  0682 81            	ret
2409                     ; 690 void Icc_measure_LPR_LCD(void)
2409                     ; 691 {
2410                     	switch	.text
2411  0683               _Icc_measure_LPR_LCD:
2413  0683 520a          	subw	sp,#10
2414       0000000a      OFST:	set	10
2417                     ; 696   MeasurINT = ADC_Icc_Test(MCU_LPR_LCD);
2419  0685 a604          	ld	a,#4
2420  0687 cd0000        	call	_ADC_Icc_Test
2422  068a 1f09          	ldw	(OFST-1,sp),x
2423                     ; 699   MeasurINT -= Bias_Current;
2425  068c c60000        	ld	a,_Bias_Current
2426  068f 5f            	clrw	x
2427  0690 97            	ld	xl,a
2428  0691 1f03          	ldw	(OFST-7,sp),x
2429  0693 1e09          	ldw	x,(OFST-1,sp)
2430  0695 72f003        	subw	x,(OFST-7,sp)
2431  0698 1f09          	ldw	(OFST-1,sp),x
2432                     ; 701   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2434  069a 1e09          	ldw	x,(OFST-1,sp)
2435  069c cd0000        	call	c_uitof
2437  069f 96            	ldw	x,sp
2438  06a0 1c0001        	addw	x,#OFST-9
2439  06a3 cd0000        	call	c_rtol
2441  06a6 cd0457        	call	_Vdd_appli
2443  06a9 96            	ldw	x,sp
2444  06aa 1c0001        	addw	x,#OFST-9
2445  06ad cd0000        	call	c_fmul
2447  06b0 ae001a        	ldw	x,#L373
2448  06b3 cd0000        	call	c_fdiv
2450  06b6 96            	ldw	x,sp
2451  06b7 1c0005        	addw	x,#OFST-5
2452  06ba cd0000        	call	c_rtol
2454                     ; 702   Current *= 10L;
2456  06bd a60a          	ld	a,#10
2457  06bf cd0000        	call	c_ctof
2459  06c2 96            	ldw	x,sp
2460  06c3 1c0005        	addw	x,#OFST-5
2461  06c6 cd0000        	call	c_fgmul
2463                     ; 704   display_MuAmp((int)Current);
2465  06c9 96            	ldw	x,sp
2466  06ca 1c0005        	addw	x,#OFST-5
2467  06cd cd0000        	call	c_ltor
2469  06d0 cd0000        	call	c_ftoi
2471  06d3 cd04d0        	call	_display_MuAmp
2473                     ; 706 }	
2476  06d6 5b0a          	addw	sp,#10
2477  06d8 81            	ret
2531                     	xdef	_LPR_Ram
2532                     	xdef	_test_LSE
2533                     	xref.b	_KeyPressed
2534                     	switch	.ubsct
2535  0000               _Auto_test:
2536  0000 00            	ds.b	1
2537                     	xdef	_Auto_test
2538                     	xdef	_Bias_Current
2539                     	xref	_ADC_Icc_Test
2540                     	xref	_ADC_Supply
2541                     	xref	_delay_ms
2542                     	xref	_LCD_GLASS_ScrollSentence
2543                     	xref	_LCD_GLASS_Clear
2544                     	xref	_LCD_GLASS_DisplayStrDeci
2545                     	xref	_LCD_GLASS_DisplayString
2546                     	xdef	_Vdd_appli
2547                     	xdef	_FLASH_ProgramBias
2548                     	xdef	_display_MuAmp
2549                     	xdef	_test_icc_HALT
2550                     	xdef	_test_icc_LP
2551                     	xdef	_test_icc_Run
2552                     	xdef	_test_vdd
2553                     	xdef	_Bias_measurement
2554                     	xdef	_auto_test
2555                     	xdef	_Icc_measure_LPR_LCD
2556                     	xdef	_Icc_measure_LPR
2557                     	xdef	_Icc_measure_HALT
2558                     	xdef	_Icc_measure_RUN
2559                     	xdef	_Vref_measure
2560                     	xdef	_LPR_init
2561                     	xdef	_convert_into_char
2562                     	xref	__fctcpy
2563                     	xref	_FLASH_WaitForLastOperation
2564                     	xref	_FLASH_Lock
2565                     	xref	_FLASH_Unlock
2566                     	xref	_CLK_SYSCLKSourceSwitchCmd
2567                     	xref	_CLK_SYSCLKDivConfig
2568                     	xref	_CLK_SYSCLKSourceConfig
2569                     	xref	_CLK_LSEConfig
2570                     	xref	_CLK_HSICmd
2571                     	switch	.const
2572  000c               L757:
2573  000c 4572726f7200  	dc.b	"Error",0
2574  0012               L527:
2575  0012 41200000      	dc.w	16672,0
2576  0016               L716:
2577  0016 3f9cac08      	dc.w	16284,-21496
2578  001a               L373:
2579  001a 45800000      	dc.w	17792,0
2580  001e               L563:
2581  001e 202020202020  	dc.b	"      ** BIAS CURR"
2582  0030 454e54202a2a  	dc.b	"ENT ** JP1 OFF **",0
2583  0042               L143:
2584  0042 54455354204f  	dc.b	"TEST OK ",0
2585  004b               L333:
2586  004b 205445535420  	dc.b	" TEST ",0
2587  0052               L572:
2588  0052 4c5345204f4b  	dc.b	"LSE OK",0
2589  0059               L752:
2590  0059 4c5345204e6f  	dc.b	"LSE Not OK ",0
2591  0065               L722:
2592  0065 4c534500      	dc.b	"LSE",0
2593  0069               L512:
2594  0069 4c50204f4b00  	dc.b	"LP OK",0
2595  006f               L312:
2596  006f 4c50204e6f74  	dc.b	"LP Not OK ",0
2597  007a               L571:
2598  007a 4c5000        	dc.b	"LP",0
2599  007d               L551:
2600  007d 48414c544f4b  	dc.b	"HALTOK",0
2601  0084               L351:
2602  0084 494343204841  	dc.b	"ICC HALT Not OK ",0
2603  0095               L531:
2604  0095 48414c5400    	dc.b	"HALT",0
2605  009a               L511:
2606  009a 52554e204f4b  	dc.b	"RUN OK",0
2607  00a1               L311:
2608  00a1 52554e204e6f  	dc.b	"RUN Not OK ",0
2609  00ad               L101:
2610  00ad 52554e00      	dc.b	"RUN",0
2611  00b1               L16:
2612  00b1 564444204f4b  	dc.b	"VDD OK",0
2613  00b8               L75:
2614  00b8 564444204e6f  	dc.b	"VDD Not OK ",0
2615  00c4               L54:
2616  00c4 56444400      	dc.b	"VDD",0
2617                     	xref.b	c_x
2637                     	xref	c_ctof
2638                     	xref	c_fgmul
2639                     	xref	c_uitof
2640                     	xref	c_ltor
2641                     	xref	c_imul
2642                     	xref	c_fmul
2643                     	xref	c_rtol
2644                     	xref	c_itof
2645                     	xref	c_fdiv
2646                     	xref	c_xymvx
2647                     	xref	c_ftoi
2648                     	end
