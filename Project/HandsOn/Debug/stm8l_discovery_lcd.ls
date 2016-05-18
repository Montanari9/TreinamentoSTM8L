   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  15                     	bsct
  16  0000               _KeyPressed:
  17  0000 00            	dc.b	0
  18  0001               _t_bar:
  19  0001 00            	dc.b	0
  20  0002 00            	dc.b	0
  21                     .const:	section	.text
  22  0000               _CapLetterMap:
  23  0000 fe00          	dc.w	-512
  24  0002 6711          	dc.w	26385
  25  0004 1d00          	dc.w	7424
  26  0006 4711          	dc.w	18193
  27  0008 9d00          	dc.w	-25344
  28  000a 9c00          	dc.w	-25600
  29  000c 3f00          	dc.w	16128
  30  000e fa00          	dc.w	-1536
  31  0010 0011          	dc.w	17
  32  0012 5300          	dc.w	21248
  33  0014 9844          	dc.w	-26556
  34  0016 1900          	dc.w	6400
  35  0018 5a42          	dc.w	23106
  36  001a 5a06          	dc.w	23046
  37  001c 5f00          	dc.w	24320
  38  001e fc00          	dc.w	-1024
  39  0020 5f04          	dc.w	24324
  40  0022 fc04          	dc.w	-1020
  41  0024 af00          	dc.w	-20736
  42  0026 0411          	dc.w	1041
  43  0028 5b00          	dc.w	23296
  44  002a 18c0          	dc.w	6336
  45  002c 5a84          	dc.w	23172
  46  002e 00c6          	dc.w	198
  47  0030 0052          	dc.w	82
  48  0032 05c0          	dc.w	1472
  49  0034               _NumberMap:
  50  0034 5f00          	dc.w	24320
  51  0036 4200          	dc.w	16896
  52  0038 f500          	dc.w	-2816
  53  003a 6700          	dc.w	26368
  54  003c ea00          	dc.w	-5632
  55  003e af00          	dc.w	-20736
  56  0040 bf00          	dc.w	-16640
  57  0042 4600          	dc.w	17920
  58  0044 ff00          	dc.w	-256
  59  0046 ef00          	dc.w	-4352
  97                     ; 90 void LCD_GLASS_Init(void)
  97                     ; 91 {
  99                     	switch	.text
 100  0000               _LCD_GLASS_Init:
 104                     ; 94   CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 106  0000 ae1201        	ldw	x,#4609
 107  0003 cd0000        	call	_CLK_PeripheralClockConfig
 109                     ; 95   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
 111  0006 ae1301        	ldw	x,#4865
 112  0009 cd0000        	call	_CLK_PeripheralClockConfig
 114                     ; 100     CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
 116  000c ae0400        	ldw	x,#1024
 117  000f cd0000        	call	_CLK_RTCClockConfig
 119                     ; 104   LCD_Init(LCD_Prescaler_1, LCD_Divider_31, LCD_Duty_1_4, 
 119                     ; 105                                    LCD_Bias_1_3, LCD_VoltageSource_Internal);
 121  0012 4b00          	push	#0
 122  0014 4b00          	push	#0
 123  0016 4b06          	push	#6
 124  0018 ae000f        	ldw	x,#15
 125  001b cd0000        	call	_LCD_Init
 127  001e 5b03          	addw	sp,#3
 128                     ; 110   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
 130  0020 ae00ff        	ldw	x,#255
 131  0023 cd0000        	call	_LCD_PortMaskConfig
 133                     ; 111   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
 135  0026 ae01ff        	ldw	x,#511
 136  0029 cd0000        	call	_LCD_PortMaskConfig
 138                     ; 112   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xff);
 140  002c ae02ff        	ldw	x,#767
 141  002f cd0000        	call	_LCD_PortMaskConfig
 143                     ; 115   LCD_ContrastConfig(LCD_Contrast_3V0);
 145  0032 a608          	ld	a,#8
 146  0034 cd0000        	call	_LCD_ContrastConfig
 148                     ; 117   LCD_DeadTimeConfig(LCD_DeadTime_0);
 150  0037 4f            	clr	a
 151  0038 cd0000        	call	_LCD_DeadTimeConfig
 153                     ; 118   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
 155  003b a620          	ld	a,#32
 156  003d cd0000        	call	_LCD_PulseOnDurationConfig
 158                     ; 121   LCD_Cmd(ENABLE);
 160  0040 a601          	ld	a,#1
 161  0042 cd0000        	call	_LCD_Cmd
 163                     ; 122 }
 166  0045 81            	ret
 273                     ; 129 void LCD_contrast()
 273                     ; 130 {
 274                     	switch	.text
 275  0046               _LCD_contrast:
 277  0046 88            	push	a
 278       00000001      OFST:	set	1
 281                     ; 134   contrast = (LCD_Contrast_TypeDef) (LCD->CR2 & LCD_Contrast_3V3);
 283  0047 c65401        	ld	a,21505
 284  004a a40e          	and	a,#14
 285  004c 6b01          	ld	(OFST+0,sp),a
 287  004e 2017          	jra	L17
 288  0050               L56:
 289                     ; 138     contrast+=2;	
 291  0050 0c01          	inc	(OFST+0,sp)
 292  0052 0c01          	inc	(OFST+0,sp)
 293                     ; 139     if (contrast>LCD_Contrast_3V3)
 295  0054 7b01          	ld	a,(OFST+0,sp)
 296  0056 a10f          	cp	a,#15
 297  0058 2502          	jrult	L57
 298                     ; 140      contrast=LCD_Contrast_2V6;
 300  005a 0f01          	clr	(OFST+0,sp)
 301  005c               L57:
 302                     ; 142     LCD_ContrastConfig(contrast);
 304  005c 7b01          	ld	a,(OFST+0,sp)
 305  005e cd0000        	call	_LCD_ContrastConfig
 307                     ; 143     delay_ms(100);
 309  0061 ae0064        	ldw	x,#100
 310  0064 cd0000        	call	_delay_ms
 312  0067               L17:
 313                     ; 136   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0)
 315  0067 c6500b        	ld	a,20491
 316  006a a502          	bcp	a,#2
 317  006c 27e2          	jreq	L56
 318                     ; 145 }
 321  006e 84            	pop	a
 322  006f 81            	ret
 346                     ; 152 void LCD_bar()
 346                     ; 153 {
 347                     	switch	.text
 348  0070               _LCD_bar:
 352                     ; 155   LCD->RAM[LCD_RAMRegister_11] &= 0x5f;
 354  0070 c65417        	ld	a,21527
 355  0073 a45f          	and	a,#95
 356  0075 c75417        	ld	21527,a
 357                     ; 156   LCD->RAM[LCD_RAMRegister_11] |= t_bar[0]&0xa0;
 359  0078 b601          	ld	a,_t_bar
 360  007a a4a0          	and	a,#160
 361  007c ca5417        	or	a,21527
 362  007f c75417        	ld	21527,a
 363                     ; 159   LCD->RAM[LCD_RAMRegister_8] &= 0xf5;
 365  0082 c65414        	ld	a,21524
 366  0085 a4f5          	and	a,#245
 367  0087 c75414        	ld	21524,a
 368                     ; 160   LCD->RAM[LCD_RAMRegister_8] |= t_bar[1]&0x0a;
 370  008a b602          	ld	a,_t_bar+1
 371  008c a40a          	and	a,#10
 372  008e ca5414        	or	a,21524
 373  0091 c75414        	ld	21524,a
 374                     ; 161 }
 377  0094 81            	ret
 491                     	switch	.const
 492  0048               L61:
 493  0048 00e1          	dc.w	L121
 494  004a 00f8          	dc.w	L521
 495  004c 00f8          	dc.w	L521
 496  004e 00e8          	dc.w	L321
 497  0050 00e8          	dc.w	L321
 498  0052 00e8          	dc.w	L321
 499  0054 00e8          	dc.w	L321
 500  0056 00e8          	dc.w	L321
 501  0058 00e8          	dc.w	L321
 502  005a 00e8          	dc.w	L321
 503  005c 00e8          	dc.w	L321
 504  005e 00e8          	dc.w	L321
 505  0060 00e8          	dc.w	L321
 506                     ; 174 static void LCD_Conv_Char_Seg(uint8_t* c,bool point,bool column, uint8_t* digit)
 506                     ; 175 {
 507                     	switch	.text
 508  0095               L3_LCD_Conv_Char_Seg:
 510  0095 89            	pushw	x
 511  0096 5204          	subw	sp,#4
 512       00000004      OFST:	set	4
 515                     ; 176   uint16_t ch = 0 ;
 517  0098 5f            	clrw	x
 518  0099 1f03          	ldw	(OFST-1,sp),x
 519                     ; 179   switch (*c)
 521  009b 1e05          	ldw	x,(OFST+1,sp)
 522  009d f6            	ld	a,(x)
 524                     ; 229       break;
 525  009e a02d          	sub	a,#45
 526  00a0 a10d          	cp	a,#13
 527  00a2 2407          	jruge	L41
 528  00a4 5f            	clrw	x
 529  00a5 97            	ld	xl,a
 530  00a6 58            	sllw	x
 531  00a7 de0048        	ldw	x,(L61,x)
 532  00aa fc            	jp	(x)
 533  00ab               L41:
 534  00ab a0f3          	sub	a,#-13
 535  00ad 2711          	jreq	L701
 536  00af a00a          	sub	a,#10
 537  00b1 2712          	jreq	L111
 538  00b3 a043          	sub	a,#67
 539  00b5 271c          	jreq	L511
 540  00b7 4a            	dec	a
 541  00b8 2720          	jreq	L711
 542  00ba a047          	sub	a,#71
 543  00bc 270e          	jreq	L311
 544  00be 2038          	jra	L521
 545  00c0               L701:
 546                     ; 181     case ' ' : 
 546                     ; 182       ch = 0x00;
 548  00c0 5f            	clrw	x
 549  00c1 1f03          	ldw	(OFST-1,sp),x
 550                     ; 183       break;
 552  00c3 206b          	jra	L702
 553  00c5               L111:
 554                     ; 185     case '*':
 554                     ; 186       ch = star;
 556  00c5 aea0d7        	ldw	x,#41175
 557  00c8 1f03          	ldw	(OFST-1,sp),x
 558                     ; 187       break;
 560  00ca 2064          	jra	L702
 561  00cc               L311:
 562                     ; 189     case 'µ' :
 562                     ; 190       ch = C_UMAP;
 564  00cc ae6081        	ldw	x,#24705
 565  00cf 1f03          	ldw	(OFST-1,sp),x
 566                     ; 191       break;
 568  00d1 205d          	jra	L702
 569  00d3               L511:
 570                     ; 193     case 'm' :
 570                     ; 194       ch = C_mMap;
 572  00d3 aeb210        	ldw	x,#45584
 573  00d6 1f03          	ldw	(OFST-1,sp),x
 574                     ; 195       break;
 576  00d8 2056          	jra	L702
 577  00da               L711:
 578                     ; 197     case 'n' :
 578                     ; 198       ch = C_nMap;
 580  00da ae2210        	ldw	x,#8720
 581  00dd 1f03          	ldw	(OFST-1,sp),x
 582                     ; 199       break;					
 584  00df 204f          	jra	L702
 585  00e1               L121:
 586                     ; 201     case '-' :
 586                     ; 202       ch = C_minus;
 588  00e1 aea000        	ldw	x,#40960
 589  00e4 1f03          	ldw	(OFST-1,sp),x
 590                     ; 203       break;
 592  00e6 2048          	jra	L702
 593  00e8               L321:
 594                     ; 205     case '0':
 594                     ; 206     case '1':
 594                     ; 207     case '2':
 594                     ; 208     case '3':
 594                     ; 209     case '4':
 594                     ; 210     case '5':
 594                     ; 211     case '6':
 594                     ; 212     case '7':
 594                     ; 213     case '8':
 594                     ; 214     case '9':			
 594                     ; 215       ch = NumberMap[*c-0x30];		
 596  00e8 1e05          	ldw	x,(OFST+1,sp)
 597  00ea f6            	ld	a,(x)
 598  00eb 5f            	clrw	x
 599  00ec 97            	ld	xl,a
 600  00ed 58            	sllw	x
 601  00ee 1d0060        	subw	x,#96
 602  00f1 de0034        	ldw	x,(_NumberMap,x)
 603  00f4 1f03          	ldw	(OFST-1,sp),x
 604                     ; 216       break;
 606  00f6 2038          	jra	L702
 607  00f8               L521:
 608                     ; 218     default:
 608                     ; 219       /* The character c is one letter in upper case*/
 608                     ; 220       if ( (*c < 0x5b) && (*c > 0x40) )
 610  00f8 1e05          	ldw	x,(OFST+1,sp)
 611  00fa f6            	ld	a,(x)
 612  00fb a15b          	cp	a,#91
 613  00fd 2415          	jruge	L112
 615  00ff 1e05          	ldw	x,(OFST+1,sp)
 616  0101 f6            	ld	a,(x)
 617  0102 a141          	cp	a,#65
 618  0104 250e          	jrult	L112
 619                     ; 222         ch = CapLetterMap[*c-'A'];
 621  0106 1e05          	ldw	x,(OFST+1,sp)
 622  0108 f6            	ld	a,(x)
 623  0109 5f            	clrw	x
 624  010a 97            	ld	xl,a
 625  010b 58            	sllw	x
 626  010c 1d0082        	subw	x,#130
 627  010f de0000        	ldw	x,(_CapLetterMap,x)
 628  0112 1f03          	ldw	(OFST-1,sp),x
 629  0114               L112:
 630                     ; 225       if ( (*c <0x7b) && ( *c> 0x60) )
 632  0114 1e05          	ldw	x,(OFST+1,sp)
 633  0116 f6            	ld	a,(x)
 634  0117 a17b          	cp	a,#123
 635  0119 2415          	jruge	L702
 637  011b 1e05          	ldw	x,(OFST+1,sp)
 638  011d f6            	ld	a,(x)
 639  011e a161          	cp	a,#97
 640  0120 250e          	jrult	L702
 641                     ; 227         ch = CapLetterMap[*c-'a'];
 643  0122 1e05          	ldw	x,(OFST+1,sp)
 644  0124 f6            	ld	a,(x)
 645  0125 5f            	clrw	x
 646  0126 97            	ld	xl,a
 647  0127 58            	sllw	x
 648  0128 1d00c2        	subw	x,#194
 649  012b de0000        	ldw	x,(_CapLetterMap,x)
 650  012e 1f03          	ldw	(OFST-1,sp),x
 651  0130               L702:
 652                     ; 233   if (point)
 654  0130 0d09          	tnz	(OFST+5,sp)
 655  0132 2706          	jreq	L512
 656                     ; 235     ch |= 0x0008;
 658  0134 7b04          	ld	a,(OFST+0,sp)
 659  0136 aa08          	or	a,#8
 660  0138 6b04          	ld	(OFST+0,sp),a
 661  013a               L512:
 662                     ; 239   if (column)
 664  013a 0d0a          	tnz	(OFST+6,sp)
 665  013c 2706          	jreq	L712
 666                     ; 241     ch |= 0x0020;
 668  013e 7b04          	ld	a,(OFST+0,sp)
 669  0140 aa20          	or	a,#32
 670  0142 6b04          	ld	(OFST+0,sp),a
 671  0144               L712:
 672                     ; 244   for (i = 12,j=0 ;j<4; i-=4,j++)
 674  0144 a60c          	ld	a,#12
 675  0146 6b01          	ld	(OFST-3,sp),a
 676  0148 0f02          	clr	(OFST-2,sp)
 677  014a               L122:
 678                     ; 246     digit[j] = (ch >> i) & 0x0f; //To isolate the less signifiant dibit
 680  014a 7b0b          	ld	a,(OFST+7,sp)
 681  014c 97            	ld	xl,a
 682  014d 7b0c          	ld	a,(OFST+8,sp)
 683  014f 1b02          	add	a,(OFST-2,sp)
 684  0151 2401          	jrnc	L02
 685  0153 5c            	incw	x
 686  0154               L02:
 687  0154 02            	rlwa	x,a
 688  0155 89            	pushw	x
 689  0156 1e05          	ldw	x,(OFST+1,sp)
 690  0158 7b03          	ld	a,(OFST-1,sp)
 691  015a 4d            	tnz	a
 692  015b 2704          	jreq	L22
 693  015d               L42:
 694  015d 54            	srlw	x
 695  015e 4a            	dec	a
 696  015f 26fc          	jrne	L42
 697  0161               L22:
 698  0161 01            	rrwa	x,a
 699  0162 a40f          	and	a,#15
 700  0164 5f            	clrw	x
 701  0165 85            	popw	x
 702  0166 f7            	ld	(x),a
 703                     ; 244   for (i = 12,j=0 ;j<4; i-=4,j++)
 705  0167 7b01          	ld	a,(OFST-3,sp)
 706  0169 a004          	sub	a,#4
 707  016b 6b01          	ld	(OFST-3,sp),a
 708  016d 0c02          	inc	(OFST-2,sp)
 711  016f 7b02          	ld	a,(OFST-2,sp)
 712  0171 a104          	cp	a,#4
 713  0173 25d5          	jrult	L122
 714                     ; 248 }
 717  0175 5b06          	addw	sp,#6
 718  0177 81            	ret
 795                     ; 263 void LCD_GLASS_WriteChar(uint8_t* ch, bool point, bool column, uint8_t position)
 795                     ; 264 {
 796                     	switch	.text
 797  0178               _LCD_GLASS_WriteChar:
 799  0178 89            	pushw	x
 800  0179 5204          	subw	sp,#4
 801       00000004      OFST:	set	4
 804                     ; 268   LCD_Conv_Char_Seg(ch,point,column,digit);
 806  017b 96            	ldw	x,sp
 807  017c 1c0001        	addw	x,#OFST-3
 808  017f 89            	pushw	x
 809  0180 7b0c          	ld	a,(OFST+8,sp)
 810  0182 88            	push	a
 811  0183 7b0c          	ld	a,(OFST+8,sp)
 812  0185 88            	push	a
 813  0186 1e09          	ldw	x,(OFST+5,sp)
 814  0188 cd0095        	call	L3_LCD_Conv_Char_Seg
 816  018b 5b04          	addw	sp,#4
 817                     ; 270   switch (position)
 819  018d 7b0b          	ld	a,(OFST+7,sp)
 821                     ; 437       default:
 821                     ; 438               break;
 822  018f 4a            	dec	a
 823  0190 2722          	jreq	L722
 824  0192 4a            	dec	a
 825  0193 2603          	jrne	L03
 826  0195 cc025b        	jp	L132
 827  0198               L03:
 828  0198 4a            	dec	a
 829  0199 2603          	jrne	L23
 830  019b cc0303        	jp	L332
 831  019e               L23:
 832  019e 4a            	dec	a
 833  019f 2603          	jrne	L43
 834  01a1 cc03ad        	jp	L532
 835  01a4               L43:
 836  01a4 4a            	dec	a
 837  01a5 2603          	jrne	L63
 838  01a7 cc0458        	jp	L732
 839  01aa               L63:
 840  01aa 4a            	dec	a
 841  01ab 2603          	jrne	L04
 842  01ad cc04f7        	jp	L142
 843  01b0               L04:
 844  01b0 ac930593      	jpf	L503
 845  01b4               L722:
 846                     ; 273     case 1:
 846                     ; 274       LCD->RAM[LCD_RAMRegister_0] &= 0x0fc;
 848  01b4 c6540c        	ld	a,21516
 849  01b7 a4fc          	and	a,#252
 850  01b9 c7540c        	ld	21516,a
 851                     ; 275       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]& 0x03); // 1M 1E	
 853  01bc 7b01          	ld	a,(OFST-3,sp)
 854  01be a403          	and	a,#3
 855  01c0 ca540c        	or	a,21516
 856  01c3 c7540c        	ld	21516,a
 857                     ; 277       LCD->RAM[LCD_RAMRegister_2] &= 0x3f;
 859  01c6 c6540e        	ld	a,21518
 860  01c9 a43f          	and	a,#63
 861  01cb c7540e        	ld	21518,a
 862                     ; 278       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<4) & 0xc0); // 1G 1B
 864  01ce 7b01          	ld	a,(OFST-3,sp)
 865  01d0 97            	ld	xl,a
 866  01d1 a610          	ld	a,#16
 867  01d3 42            	mul	x,a
 868  01d4 9f            	ld	a,xl
 869  01d5 a4c0          	and	a,#192
 870  01d7 ca540e        	or	a,21518
 871  01da c7540e        	ld	21518,a
 872                     ; 280       LCD->RAM[LCD_RAMRegister_3] &= 0x0cf;
 874  01dd c6540f        	ld	a,21519
 875  01e0 a4cf          	and	a,#207
 876  01e2 c7540f        	ld	21519,a
 877                     ; 281       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)(digit[1]<<4 & 0x30); // 1C 1D
 879  01e5 7b02          	ld	a,(OFST-2,sp)
 880  01e7 97            	ld	xl,a
 881  01e8 a610          	ld	a,#16
 882  01ea 42            	mul	x,a
 883  01eb 9f            	ld	a,xl
 884  01ec a430          	and	a,#48
 885  01ee ca540f        	or	a,21519
 886  01f1 c7540f        	ld	21519,a
 887                     ; 283       LCD->RAM[LCD_RAMRegister_6] &= 0xf3;
 889  01f4 c65412        	ld	a,21522
 890  01f7 a4f3          	and	a,#243
 891  01f9 c75412        	ld	21522,a
 892                     ; 284       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)(digit[1]&0x0c); // 1F 1A
 894  01fc 7b02          	ld	a,(OFST-2,sp)
 895  01fe a40c          	and	a,#12
 896  0200 ca5412        	or	a,21522
 897  0203 c75412        	ld	21522,a
 898                     ; 286       LCD->RAM[LCD_RAMRegister_7] &= 0x0fc;
 900  0206 c65413        	ld	a,21523
 901  0209 a4fc          	and	a,#252
 902  020b c75413        	ld	21523,a
 903                     ; 287       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]&0x03); // 1Col 1P		
 905  020e 7b03          	ld	a,(OFST-1,sp)
 906  0210 a403          	and	a,#3
 907  0212 ca5413        	or	a,21523
 908  0215 c75413        	ld	21523,a
 909                     ; 289       LCD->RAM[LCD_RAMRegister_9] &= 0x3f;
 911  0218 c65415        	ld	a,21525
 912  021b a43f          	and	a,#63
 913  021d c75415        	ld	21525,a
 914                     ; 290       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<4) & 0xc0); // 1Q 1K										
 916  0220 7b03          	ld	a,(OFST-1,sp)
 917  0222 97            	ld	xl,a
 918  0223 a610          	ld	a,#16
 919  0225 42            	mul	x,a
 920  0226 9f            	ld	a,xl
 921  0227 a4c0          	and	a,#192
 922  0229 ca5415        	or	a,21525
 923  022c c75415        	ld	21525,a
 924                     ; 292       LCD->RAM[LCD_RAMRegister_10] &= 0xcf;
 926  022f c65416        	ld	a,21526
 927  0232 a4cf          	and	a,#207
 928  0234 c75416        	ld	21526,a
 929                     ; 293       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<2)& 0x30); // 1DP 1N	
 931  0237 7b04          	ld	a,(OFST+0,sp)
 932  0239 48            	sll	a
 933  023a 48            	sll	a
 934  023b a430          	and	a,#48
 935  023d ca5416        	or	a,21526
 936  0240 c75416        	ld	21526,a
 937                     ; 295       LCD->RAM[LCD_RAMRegister_13] &= 0xf3;
 939  0243 c65419        	ld	a,21529
 940  0246 a4f3          	and	a,#243
 941  0248 c75419        	ld	21529,a
 942                     ; 296       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3]<<2) & 0x0c); // 1H 1J
 944  024b 7b04          	ld	a,(OFST+0,sp)
 945  024d 48            	sll	a
 946  024e 48            	sll	a
 947  024f a40c          	and	a,#12
 948  0251 ca5419        	or	a,21529
 949  0254 c75419        	ld	21529,a
 950                     ; 297       break;
 952  0257 ac930593      	jpf	L503
 953  025b               L132:
 954                     ; 300     case 2:
 954                     ; 301       LCD->RAM[LCD_RAMRegister_0] &= 0x0f3;
 956  025b c6540c        	ld	a,21516
 957  025e a4f3          	and	a,#243
 958  0260 c7540c        	ld	21516,a
 959                     ; 302       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)((digit[0]<<2)&0x0c); // 2M 2E	
 961  0263 7b01          	ld	a,(OFST-3,sp)
 962  0265 48            	sll	a
 963  0266 48            	sll	a
 964  0267 a40c          	and	a,#12
 965  0269 ca540c        	or	a,21516
 966  026c c7540c        	ld	21516,a
 967                     ; 304       LCD->RAM[LCD_RAMRegister_2] &= 0xcf;
 969  026f c6540e        	ld	a,21518
 970  0272 a4cf          	and	a,#207
 971  0274 c7540e        	ld	21518,a
 972                     ; 305       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<2)&0x30); // 2G 2B
 974  0277 7b01          	ld	a,(OFST-3,sp)
 975  0279 48            	sll	a
 976  027a 48            	sll	a
 977  027b a430          	and	a,#48
 978  027d ca540e        	or	a,21518
 979  0280 c7540e        	ld	21518,a
 980                     ; 307       LCD->RAM[LCD_RAMRegister_3] &= 0x3f;
 982  0283 c6540f        	ld	a,21519
 983  0286 a43f          	and	a,#63
 984  0288 c7540f        	ld	21519,a
 985                     ; 308       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)((digit[1]<<6) & 0xc0); // 2C 2D
 987  028b 7b02          	ld	a,(OFST-2,sp)
 988  028d 97            	ld	xl,a
 989  028e a640          	ld	a,#64
 990  0290 42            	mul	x,a
 991  0291 9f            	ld	a,xl
 992  0292 a4c0          	and	a,#192
 993  0294 ca540f        	or	a,21519
 994  0297 c7540f        	ld	21519,a
 995                     ; 310       LCD->RAM[LCD_RAMRegister_6] &= 0xfc;
 997  029a c65412        	ld	a,21522
 998  029d a4fc          	and	a,#252
 999  029f c75412        	ld	21522,a
1000                     ; 311       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)((digit[1]>>2)&0x03); // 2F 2A
1002  02a2 7b02          	ld	a,(OFST-2,sp)
1003  02a4 44            	srl	a
1004  02a5 44            	srl	a
1005  02a6 a403          	and	a,#3
1006  02a8 ca5412        	or	a,21522
1007  02ab c75412        	ld	21522,a
1008                     ; 313       LCD->RAM[LCD_RAMRegister_7] &= 0xf3;
1010  02ae c65413        	ld	a,21523
1011  02b1 a4f3          	and	a,#243
1012  02b3 c75413        	ld	21523,a
1013                     ; 314       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)((digit[2]<<2)& 0x0c); // 2Col 2P		
1015  02b6 7b03          	ld	a,(OFST-1,sp)
1016  02b8 48            	sll	a
1017  02b9 48            	sll	a
1018  02ba a40c          	and	a,#12
1019  02bc ca5413        	or	a,21523
1020  02bf c75413        	ld	21523,a
1021                     ; 316       LCD->RAM[LCD_RAMRegister_9] &= 0xcf;
1023  02c2 c65415        	ld	a,21525
1024  02c5 a4cf          	and	a,#207
1025  02c7 c75415        	ld	21525,a
1026                     ; 317       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<2)&0x30); // 2Q 2K										
1028  02ca 7b03          	ld	a,(OFST-1,sp)
1029  02cc 48            	sll	a
1030  02cd 48            	sll	a
1031  02ce a430          	and	a,#48
1032  02d0 ca5415        	or	a,21525
1033  02d3 c75415        	ld	21525,a
1034                     ; 319       LCD->RAM[LCD_RAMRegister_10] &= 0x3f;
1036  02d6 c65416        	ld	a,21526
1037  02d9 a43f          	and	a,#63
1038  02db c75416        	ld	21526,a
1039                     ; 320       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<4)& 0xC0); // 2DP 2N	
1041  02de 7b04          	ld	a,(OFST+0,sp)
1042  02e0 97            	ld	xl,a
1043  02e1 a610          	ld	a,#16
1044  02e3 42            	mul	x,a
1045  02e4 9f            	ld	a,xl
1046  02e5 a4c0          	and	a,#192
1047  02e7 ca5416        	or	a,21526
1048  02ea c75416        	ld	21526,a
1049                     ; 322       LCD->RAM[LCD_RAMRegister_13] &= 0xfc;
1051  02ed c65419        	ld	a,21529
1052  02f0 a4fc          	and	a,#252
1053  02f2 c75419        	ld	21529,a
1054                     ; 323       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3])& 0x03); // 2H 2J
1056  02f5 7b04          	ld	a,(OFST+0,sp)
1057  02f7 a403          	and	a,#3
1058  02f9 ca5419        	or	a,21529
1059  02fc c75419        	ld	21529,a
1060                     ; 324       break;
1062  02ff ac930593      	jpf	L503
1063  0303               L332:
1064                     ; 327     case 3:
1064                     ; 328       LCD->RAM[LCD_RAMRegister_0] &= 0xcf;
1066  0303 c6540c        	ld	a,21516
1067  0306 a4cf          	and	a,#207
1068  0308 c7540c        	ld	21516,a
1069                     ; 329       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<4) & 0x30; // 3M 3E	
1071  030b 7b01          	ld	a,(OFST-3,sp)
1072  030d 97            	ld	xl,a
1073  030e a610          	ld	a,#16
1074  0310 42            	mul	x,a
1075  0311 9f            	ld	a,xl
1076  0312 a430          	and	a,#48
1077  0314 ca540c        	or	a,21516
1078  0317 c7540c        	ld	21516,a
1079                     ; 331       LCD->RAM[LCD_RAMRegister_2] &= 0xf3;
1081  031a c6540e        	ld	a,21518
1082  031d a4f3          	and	a,#243
1083  031f c7540e        	ld	21518,a
1084                     ; 332       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]) & 0x0c; // 3G 3B
1086  0322 7b01          	ld	a,(OFST-3,sp)
1087  0324 a40c          	and	a,#12
1088  0326 ca540e        	or	a,21518
1089  0329 c7540e        	ld	21518,a
1090                     ; 334       LCD->RAM[LCD_RAMRegister_4] &= 0xfc;
1092  032c c65410        	ld	a,21520
1093  032f a4fc          	and	a,#252
1094  0331 c75410        	ld	21520,a
1095                     ; 335       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]) & 0x03; // 3C 3D
1097  0334 7b02          	ld	a,(OFST-2,sp)
1098  0336 a403          	and	a,#3
1099  0338 ca5410        	or	a,21520
1100  033b c75410        	ld	21520,a
1101                     ; 337       LCD->RAM[LCD_RAMRegister_5] &= 0x3f;
1103  033e c65411        	ld	a,21521
1104  0341 a43f          	and	a,#63
1105  0343 c75411        	ld	21521,a
1106                     ; 338       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<4) & 0xc0; // 3F 3A
1108  0346 7b02          	ld	a,(OFST-2,sp)
1109  0348 97            	ld	xl,a
1110  0349 a610          	ld	a,#16
1111  034b 42            	mul	x,a
1112  034c 9f            	ld	a,xl
1113  034d a4c0          	and	a,#192
1114  034f ca5411        	or	a,21521
1115  0352 c75411        	ld	21521,a
1116                     ; 340       LCD->RAM[LCD_RAMRegister_7] &= 0xcf;
1118  0355 c65413        	ld	a,21523
1119  0358 a4cf          	and	a,#207
1120  035a c75413        	ld	21523,a
1121                     ; 341       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<4)&0x30; // 3Col 3P		
1123  035d 7b03          	ld	a,(OFST-1,sp)
1124  035f 97            	ld	xl,a
1125  0360 a610          	ld	a,#16
1126  0362 42            	mul	x,a
1127  0363 9f            	ld	a,xl
1128  0364 a430          	and	a,#48
1129  0366 ca5413        	or	a,21523
1130  0369 c75413        	ld	21523,a
1131                     ; 343       LCD->RAM[LCD_RAMRegister_9] &= 0xf3;
1133  036c c65415        	ld	a,21525
1134  036f a4f3          	and	a,#243
1135  0371 c75415        	ld	21525,a
1136                     ; 344       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]) & 0x0C;  // 3Q 3K										
1138  0374 7b03          	ld	a,(OFST-1,sp)
1139  0376 a40c          	and	a,#12
1140  0378 ca5415        	or	a,21525
1141  037b c75415        	ld	21525,a
1142                     ; 346       LCD->RAM[LCD_RAMRegister_11] &= 0xfc;
1144  037e c65417        	ld	a,21527
1145  0381 a4fc          	and	a,#252
1146  0383 c75417        	ld	21527,a
1147                     ; 347       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]>>2) & 0x03 ; // 3DP 3N	
1149  0386 7b04          	ld	a,(OFST+0,sp)
1150  0388 44            	srl	a
1151  0389 44            	srl	a
1152  038a a403          	and	a,#3
1153  038c ca5417        	or	a,21527
1154  038f c75417        	ld	21527,a
1155                     ; 349       LCD->RAM[LCD_RAMRegister_12] &= 0x3f;
1157  0392 c65418        	ld	a,21528
1158  0395 a43f          	and	a,#63
1159  0397 c75418        	ld	21528,a
1160                     ; 350       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<6) & 0xc0; // 3H 3J
1162  039a 7b04          	ld	a,(OFST+0,sp)
1163  039c 97            	ld	xl,a
1164  039d a640          	ld	a,#64
1165  039f 42            	mul	x,a
1166  03a0 9f            	ld	a,xl
1167  03a1 a4c0          	and	a,#192
1168  03a3 ca5418        	or	a,21528
1169  03a6 c75418        	ld	21528,a
1170                     ; 351       break;
1172  03a9 ac930593      	jpf	L503
1173  03ad               L532:
1174                     ; 354     case 4:
1174                     ; 355       LCD->RAM[LCD_RAMRegister_0] &= 0x3f;
1176  03ad c6540c        	ld	a,21516
1177  03b0 a43f          	and	a,#63
1178  03b2 c7540c        	ld	21516,a
1179                     ; 356       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<6) & 0xc0; // 4M 4E	
1181  03b5 7b01          	ld	a,(OFST-3,sp)
1182  03b7 97            	ld	xl,a
1183  03b8 a640          	ld	a,#64
1184  03ba 42            	mul	x,a
1185  03bb 9f            	ld	a,xl
1186  03bc a4c0          	and	a,#192
1187  03be ca540c        	or	a,21516
1188  03c1 c7540c        	ld	21516,a
1189                     ; 358       LCD->RAM[LCD_RAMRegister_2] &= 0xfc;
1191  03c4 c6540e        	ld	a,21518
1192  03c7 a4fc          	and	a,#252
1193  03c9 c7540e        	ld	21518,a
1194                     ; 359       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]>>2) & 0x03; // 4G 4B
1196  03cc 7b01          	ld	a,(OFST-3,sp)
1197  03ce 44            	srl	a
1198  03cf 44            	srl	a
1199  03d0 a403          	and	a,#3
1200  03d2 ca540e        	or	a,21518
1201  03d5 c7540e        	ld	21518,a
1202                     ; 361       LCD->RAM[LCD_RAMRegister_4] &= 0xf3;
1204  03d8 c65410        	ld	a,21520
1205  03db a4f3          	and	a,#243
1206  03dd c75410        	ld	21520,a
1207                     ; 362       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<2) & 0x0C; // 4C 4D
1209  03e0 7b02          	ld	a,(OFST-2,sp)
1210  03e2 48            	sll	a
1211  03e3 48            	sll	a
1212  03e4 a40c          	and	a,#12
1213  03e6 ca5410        	or	a,21520
1214  03e9 c75410        	ld	21520,a
1215                     ; 364       LCD->RAM[LCD_RAMRegister_5] &= 0xcf;
1217  03ec c65411        	ld	a,21521
1218  03ef a4cf          	and	a,#207
1219  03f1 c75411        	ld	21521,a
1220                     ; 365       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<2) & 0x30; // 4F 4A
1222  03f4 7b02          	ld	a,(OFST-2,sp)
1223  03f6 48            	sll	a
1224  03f7 48            	sll	a
1225  03f8 a430          	and	a,#48
1226  03fa ca5411        	or	a,21521
1227  03fd c75411        	ld	21521,a
1228                     ; 367       LCD->RAM[LCD_RAMRegister_7] &= 0x3f;
1230  0400 c65413        	ld	a,21523
1231  0403 a43f          	and	a,#63
1232  0405 c75413        	ld	21523,a
1233                     ; 368       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<6) & 0xC0; // 4Col 4P		
1235  0408 7b03          	ld	a,(OFST-1,sp)
1236  040a 97            	ld	xl,a
1237  040b a640          	ld	a,#64
1238  040d 42            	mul	x,a
1239  040e 9f            	ld	a,xl
1240  040f a4c0          	and	a,#192
1241  0411 ca5413        	or	a,21523
1242  0414 c75413        	ld	21523,a
1243                     ; 370       LCD->RAM[LCD_RAMRegister_9] &= 0xfc;				
1245  0417 c65415        	ld	a,21525
1246  041a a4fc          	and	a,#252
1247  041c c75415        	ld	21525,a
1248                     ; 371       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]>>2) & 0x03 ; // 4Q 4K										
1250  041f 7b03          	ld	a,(OFST-1,sp)
1251  0421 44            	srl	a
1252  0422 44            	srl	a
1253  0423 a403          	and	a,#3
1254  0425 ca5415        	or	a,21525
1255  0428 c75415        	ld	21525,a
1256                     ; 373       LCD->RAM[LCD_RAMRegister_11] &= 0xf3;				
1258  042b c65417        	ld	a,21527
1259  042e a4f3          	and	a,#243
1260  0430 c75417        	ld	21527,a
1261                     ; 374       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]) & 0x0C; // 4DP 4N	
1263  0433 7b04          	ld	a,(OFST+0,sp)
1264  0435 a40c          	and	a,#12
1265  0437 ca5417        	or	a,21527
1266  043a c75417        	ld	21527,a
1267                     ; 376       LCD->RAM[LCD_RAMRegister_12] &= 0xcf;				
1269  043d c65418        	ld	a,21528
1270  0440 a4cf          	and	a,#207
1271  0442 c75418        	ld	21528,a
1272                     ; 377       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<4) & 0x30; // 4H 4J
1274  0445 7b04          	ld	a,(OFST+0,sp)
1275  0447 97            	ld	xl,a
1276  0448 a610          	ld	a,#16
1277  044a 42            	mul	x,a
1278  044b 9f            	ld	a,xl
1279  044c a430          	and	a,#48
1280  044e ca5418        	or	a,21528
1281  0451 c75418        	ld	21528,a
1282                     ; 378       break;
1284  0454 ac930593      	jpf	L503
1285  0458               L732:
1286                     ; 381     case 5:
1286                     ; 382       LCD->RAM[LCD_RAMRegister_1] &= 0xfc;
1288  0458 c6540d        	ld	a,21517
1289  045b a4fc          	and	a,#252
1290  045d c7540d        	ld	21517,a
1291                     ; 383       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]) & 0x03; // 5M 5E	
1293  0460 7b01          	ld	a,(OFST-3,sp)
1294  0462 a403          	and	a,#3
1295  0464 ca540d        	or	a,21517
1296  0467 c7540d        	ld	21517,a
1297                     ; 385       LCD->RAM[LCD_RAMRegister_1] &= 0x3f;
1299  046a c6540d        	ld	a,21517
1300  046d a43f          	and	a,#63
1301  046f c7540d        	ld	21517,a
1302                     ; 386       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<4) & 0xc0; // 5G 5B
1304  0472 7b01          	ld	a,(OFST-3,sp)
1305  0474 97            	ld	xl,a
1306  0475 a610          	ld	a,#16
1307  0477 42            	mul	x,a
1308  0478 9f            	ld	a,xl
1309  0479 a4c0          	and	a,#192
1310  047b ca540d        	or	a,21517
1311  047e c7540d        	ld	21517,a
1312                     ; 388       LCD->RAM[LCD_RAMRegister_4] &= 0xcf;				
1314  0481 c65410        	ld	a,21520
1315  0484 a4cf          	and	a,#207
1316  0486 c75410        	ld	21520,a
1317                     ; 389       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<4) & 0x30; // 5C 5D
1319  0489 7b02          	ld	a,(OFST-2,sp)
1320  048b 97            	ld	xl,a
1321  048c a610          	ld	a,#16
1322  048e 42            	mul	x,a
1323  048f 9f            	ld	a,xl
1324  0490 a430          	and	a,#48
1325  0492 ca5410        	or	a,21520
1326  0495 c75410        	ld	21520,a
1327                     ; 391       LCD->RAM[LCD_RAMRegister_5] &= 0xf3;				
1329  0498 c65411        	ld	a,21521
1330  049b a4f3          	and	a,#243
1331  049d c75411        	ld	21521,a
1332                     ; 392       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]) & 0x0c; // 5F 5A
1334  04a0 7b02          	ld	a,(OFST-2,sp)
1335  04a2 a40c          	and	a,#12
1336  04a4 ca5411        	or	a,21521
1337  04a7 c75411        	ld	21521,a
1338                     ; 396       LCD->RAM[LCD_RAMRegister_8] &= 0xfe;
1340  04aa 72115414      	bres	21524,#0
1341                     ; 397       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]) & 0x01; //  5P	
1343  04ae 7b03          	ld	a,(OFST-1,sp)
1344  04b0 a401          	and	a,#1
1345  04b2 ca5414        	or	a,21524
1346  04b5 c75414        	ld	21524,a
1347                     ; 399       LCD->RAM[LCD_RAMRegister_8] &= 0x3f;					
1349  04b8 c65414        	ld	a,21524
1350  04bb a43f          	and	a,#63
1351  04bd c75414        	ld	21524,a
1352                     ; 400       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<4) & 0xc0; // 5Q 5K										
1354  04c0 7b03          	ld	a,(OFST-1,sp)
1355  04c2 97            	ld	xl,a
1356  04c3 a610          	ld	a,#16
1357  04c5 42            	mul	x,a
1358  04c6 9f            	ld	a,xl
1359  04c7 a4c0          	and	a,#192
1360  04c9 ca5414        	or	a,21524
1361  04cc c75414        	ld	21524,a
1362                     ; 402       LCD->RAM[LCD_RAMRegister_11] &= 0xef;				
1364  04cf 72195417      	bres	21527,#4
1365                     ; 403       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<2) & 0x10; // 5N	
1367  04d3 7b04          	ld	a,(OFST+0,sp)
1368  04d5 48            	sll	a
1369  04d6 48            	sll	a
1370  04d7 a410          	and	a,#16
1371  04d9 ca5417        	or	a,21527
1372  04dc c75417        	ld	21527,a
1373                     ; 405       LCD->RAM[LCD_RAMRegister_12] &= 0xf3;				
1375  04df c65418        	ld	a,21528
1376  04e2 a4f3          	and	a,#243
1377  04e4 c75418        	ld	21528,a
1378                     ; 406       LCD->RAM[LCD_RAMRegister_12] |=  (uint8_t)(digit[3]<<2) & 0x0C; // 5H 5J
1380  04e7 7b04          	ld	a,(OFST+0,sp)
1381  04e9 48            	sll	a
1382  04ea 48            	sll	a
1383  04eb a40c          	and	a,#12
1384  04ed ca5418        	or	a,21528
1385  04f0 c75418        	ld	21528,a
1386                     ; 407       break;
1388  04f3 ac930593      	jpf	L503
1389  04f7               L142:
1390                     ; 410     case 6:
1390                     ; 411       LCD->RAM[LCD_RAMRegister_1] &= 0xf3;
1392  04f7 c6540d        	ld	a,21517
1393  04fa a4f3          	and	a,#243
1394  04fc c7540d        	ld	21517,a
1395                     ; 412       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x0C; // 6M 6E	
1397  04ff 7b01          	ld	a,(OFST-3,sp)
1398  0501 48            	sll	a
1399  0502 48            	sll	a
1400  0503 a40c          	and	a,#12
1401  0505 ca540d        	or	a,21517
1402  0508 c7540d        	ld	21517,a
1403                     ; 414       LCD->RAM[LCD_RAMRegister_1] &= 0xcf;				
1405  050b c6540d        	ld	a,21517
1406  050e a4cf          	and	a,#207
1407  0510 c7540d        	ld	21517,a
1408                     ; 415       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x30; // 6G 6B
1410  0513 7b01          	ld	a,(OFST-3,sp)
1411  0515 48            	sll	a
1412  0516 48            	sll	a
1413  0517 a430          	and	a,#48
1414  0519 ca540d        	or	a,21517
1415  051c c7540d        	ld	21517,a
1416                     ; 417       LCD->RAM[LCD_RAMRegister_4] &= 0x3f;				
1418  051f c65410        	ld	a,21520
1419  0522 a43f          	and	a,#63
1420  0524 c75410        	ld	21520,a
1421                     ; 418       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<6) & 0xc0; // 6C 6D
1423  0527 7b02          	ld	a,(OFST-2,sp)
1424  0529 97            	ld	xl,a
1425  052a a640          	ld	a,#64
1426  052c 42            	mul	x,a
1427  052d 9f            	ld	a,xl
1428  052e a4c0          	and	a,#192
1429  0530 ca5410        	or	a,21520
1430  0533 c75410        	ld	21520,a
1431                     ; 420       LCD->RAM[LCD_RAMRegister_5] &= 0xfc;				
1433  0536 c65411        	ld	a,21521
1434  0539 a4fc          	and	a,#252
1435  053b c75411        	ld	21521,a
1436                     ; 421       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]>>2) & 0x03; // 6F 6A
1438  053e 7b02          	ld	a,(OFST-2,sp)
1439  0540 44            	srl	a
1440  0541 44            	srl	a
1441  0542 a403          	and	a,#3
1442  0544 ca5411        	or	a,21521
1443  0547 c75411        	ld	21521,a
1444                     ; 423       LCD->RAM[LCD_RAMRegister_8] &= 0xfb;
1446  054a 72155414      	bres	21524,#2
1447                     ; 424       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x04; //  6P	
1449  054e 7b03          	ld	a,(OFST-1,sp)
1450  0550 48            	sll	a
1451  0551 48            	sll	a
1452  0552 a404          	and	a,#4
1453  0554 ca5414        	or	a,21524
1454  0557 c75414        	ld	21524,a
1455                     ; 427       LCD->RAM[LCD_RAMRegister_8] &= 0xcf;					
1457  055a c65414        	ld	a,21524
1458  055d a4cf          	and	a,#207
1459  055f c75414        	ld	21524,a
1460                     ; 428       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x30; // 6Q 6K	
1462  0562 7b03          	ld	a,(OFST-1,sp)
1463  0564 48            	sll	a
1464  0565 48            	sll	a
1465  0566 a430          	and	a,#48
1466  0568 ca5414        	or	a,21524
1467  056b c75414        	ld	21524,a
1468                     ; 430       LCD->RAM[LCD_RAMRegister_11] &= 0xbf;				
1470  056e 721d5417      	bres	21527,#6
1471                     ; 431       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<4) & 0x40; // 6N	
1473  0572 7b04          	ld	a,(OFST+0,sp)
1474  0574 97            	ld	xl,a
1475  0575 a610          	ld	a,#16
1476  0577 42            	mul	x,a
1477  0578 9f            	ld	a,xl
1478  0579 a440          	and	a,#64
1479  057b ca5417        	or	a,21527
1480  057e c75417        	ld	21527,a
1481                     ; 433       LCD->RAM[LCD_RAMRegister_12] &= 0xfc;				
1483  0581 c65418        	ld	a,21528
1484  0584 a4fc          	and	a,#252
1485  0586 c75418        	ld	21528,a
1486                     ; 434       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]) & 0x03; // 6H	6J
1488  0589 7b04          	ld	a,(OFST+0,sp)
1489  058b a403          	and	a,#3
1490  058d ca5418        	or	a,21528
1491  0590 c75418        	ld	21528,a
1492                     ; 435       break;
1494  0593               L342:
1495                     ; 437       default:
1495                     ; 438               break;
1497  0593               L503:
1498                     ; 442 	LCD_bar();
1500  0593 cd0070        	call	_LCD_bar
1502                     ; 443 }
1505  0596 5b06          	addw	sp,#6
1506  0598 81            	ret
1553                     ; 450 void LCD_GLASS_DisplayString(uint8_t* ptr)
1553                     ; 451 {
1554                     	switch	.text
1555  0599               _LCD_GLASS_DisplayString:
1557  0599 89            	pushw	x
1558  059a 88            	push	a
1559       00000001      OFST:	set	1
1562                     ; 452   uint8_t i = 0x01;
1564  059b a601          	ld	a,#1
1565  059d 6b01          	ld	(OFST+0,sp),a
1566                     ; 454 	LCD_GLASS_Clear();
1568  059f cd063c        	call	_LCD_GLASS_Clear
1571  05a2 2017          	jra	L333
1572  05a4               L133:
1573                     ; 459     LCD_GLASS_WriteChar(ptr, FALSE, FALSE, i);
1575  05a4 7b01          	ld	a,(OFST+0,sp)
1576  05a6 88            	push	a
1577  05a7 4b00          	push	#0
1578  05a9 4b00          	push	#0
1579  05ab 1e05          	ldw	x,(OFST+4,sp)
1580  05ad cd0178        	call	_LCD_GLASS_WriteChar
1582  05b0 5b03          	addw	sp,#3
1583                     ; 462     ptr++;
1585  05b2 1e02          	ldw	x,(OFST+1,sp)
1586  05b4 1c0001        	addw	x,#1
1587  05b7 1f02          	ldw	(OFST+1,sp),x
1588                     ; 465     i++;
1590  05b9 0c01          	inc	(OFST+0,sp)
1591  05bb               L333:
1592                     ; 456   while ((*ptr != 0) & (i < 8))
1594  05bb 1e02          	ldw	x,(OFST+1,sp)
1595  05bd 7d            	tnz	(x)
1596  05be 2706          	jreq	L733
1598  05c0 7b01          	ld	a,(OFST+0,sp)
1599  05c2 a108          	cp	a,#8
1600  05c4 25de          	jrult	L133
1601  05c6               L733:
1602                     ; 467 }
1605  05c6 5b03          	addw	sp,#3
1606  05c8 81            	ret
1662                     ; 475 void LCD_GLASS_DisplayStrDeci(uint16_t* ptr)
1662                     ; 476 {
1663                     	switch	.text
1664  05c9               _LCD_GLASS_DisplayStrDeci:
1666  05c9 89            	pushw	x
1667  05ca 89            	pushw	x
1668       00000002      OFST:	set	2
1671                     ; 477   uint8_t i = 0x01;
1673  05cb a601          	ld	a,#1
1674  05cd 6b02          	ld	(OFST+0,sp),a
1675                     ; 480 	LCD_GLASS_Clear();
1677  05cf ad6b          	call	_LCD_GLASS_Clear
1680  05d1 2059          	jra	L773
1681  05d3               L573:
1682                     ; 484     char_tmp = (*ptr) & 0x00ff;
1684  05d3 1e03          	ldw	x,(OFST+1,sp)
1685  05d5 e601          	ld	a,(1,x)
1686  05d7 a4ff          	and	a,#255
1687  05d9 6b01          	ld	(OFST-1,sp),a
1688                     ; 486     switch ((*ptr) & 0xf000)
1690  05db 1e03          	ldw	x,(OFST+1,sp)
1691  05dd fe            	ldw	x,(x)
1692  05de 01            	rrwa	x,a
1693  05df 9f            	ld	a,xl
1694  05e0 a4f0          	and	a,#240
1695  05e2 97            	ld	xl,a
1696  05e3 4f            	clr	a
1697  05e4 02            	rlwa	x,a
1699                     ; 498           break;
1700  05e5 1d4000        	subw	x,#16384
1701  05e8 2729          	jreq	L343
1702  05ea 1d4000        	subw	x,#16384
1703  05ed 2712          	jreq	L143
1704  05ef               L543:
1705                     ; 496       default:
1705                     ; 497           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_OFF, i);		
1707  05ef 7b02          	ld	a,(OFST+0,sp)
1708  05f1 88            	push	a
1709  05f2 4b00          	push	#0
1710  05f4 4b00          	push	#0
1711  05f6 96            	ldw	x,sp
1712  05f7 1c0004        	addw	x,#OFST+2
1713  05fa cd0178        	call	_LCD_GLASS_WriteChar
1715  05fd 5b03          	addw	sp,#3
1716                     ; 498           break;
1718  05ff 2022          	jra	L504
1719  0601               L143:
1720                     ; 488       case DOT:
1720                     ; 489           /* Display one character on LCD with decimal point */
1720                     ; 490           LCD_GLASS_WriteChar(&char_tmp, POINT_ON, COLUMN_OFF, i);
1722  0601 7b02          	ld	a,(OFST+0,sp)
1723  0603 88            	push	a
1724  0604 4b00          	push	#0
1725  0606 4b01          	push	#1
1726  0608 96            	ldw	x,sp
1727  0609 1c0004        	addw	x,#OFST+2
1728  060c cd0178        	call	_LCD_GLASS_WriteChar
1730  060f 5b03          	addw	sp,#3
1731                     ; 491           break;
1733  0611 2010          	jra	L504
1734  0613               L343:
1735                     ; 492       case DOUBLE_DOT:
1735                     ; 493           /* Display one character on LCD with decimal point */
1735                     ; 494           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_ON, i);
1737  0613 7b02          	ld	a,(OFST+0,sp)
1738  0615 88            	push	a
1739  0616 4b01          	push	#1
1740  0618 4b00          	push	#0
1741  061a 96            	ldw	x,sp
1742  061b 1c0004        	addw	x,#OFST+2
1743  061e cd0178        	call	_LCD_GLASS_WriteChar
1745  0621 5b03          	addw	sp,#3
1746                     ; 495           break;
1748  0623               L504:
1749                     ; 500     ptr++;
1751  0623 1e03          	ldw	x,(OFST+1,sp)
1752  0625 1c0002        	addw	x,#2
1753  0628 1f03          	ldw	(OFST+1,sp),x
1754                     ; 503     i++;
1756  062a 0c02          	inc	(OFST+0,sp)
1757  062c               L773:
1758                     ; 482   while ((*ptr != 0) & (i < 8))
1760  062c 1e03          	ldw	x,(OFST+1,sp)
1761  062e e601          	ld	a,(1,x)
1762  0630 fa            	or	a,(x)
1763  0631 2706          	jreq	L704
1765  0633 7b02          	ld	a,(OFST+0,sp)
1766  0635 a108          	cp	a,#8
1767  0637 259a          	jrult	L573
1768  0639               L704:
1769                     ; 505 }
1772  0639 5b04          	addw	sp,#4
1773  063b 81            	ret
1807                     ; 512 void LCD_GLASS_Clear(void)
1807                     ; 513 {
1808                     	switch	.text
1809  063c               _LCD_GLASS_Clear:
1811  063c 88            	push	a
1812       00000001      OFST:	set	1
1815                     ; 514   uint8_t counter = 0;
1817                     ; 516   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1819  063d 0f01          	clr	(OFST+0,sp)
1820  063f               L724:
1821                     ; 518     LCD->RAM[counter] = LCD_RAM_RESET_VALUE;
1823  063f 7b01          	ld	a,(OFST+0,sp)
1824  0641 5f            	clrw	x
1825  0642 97            	ld	xl,a
1826  0643 724f540c      	clr	(21516,x)
1827                     ; 516   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1829  0647 0c01          	inc	(OFST+0,sp)
1832  0649 7b01          	ld	a,(OFST+0,sp)
1833  064b a10e          	cp	a,#14
1834  064d 25f0          	jrult	L724
1835                     ; 520 }
1838  064f 84            	pop	a
1839  0650 81            	ret
1842                     	switch	.const
1843  0062               L534_str:
1844  0062 00            	dc.b	0
1845  0063 000000000000  	ds.b	6
1948                     ; 532 void LCD_GLASS_ScrollSentence(uint8_t* ptr, uint16_t nScroll, uint16_t ScrollSpeed)
1948                     ; 533 {
1949                     	switch	.text
1950  0651               _LCD_GLASS_ScrollSentence:
1952  0651 89            	pushw	x
1953  0652 520c          	subw	sp,#12
1954       0000000c      OFST:	set	12
1957                     ; 537   uint8_t str[7]="";
1959  0654 96            	ldw	x,sp
1960  0655 1c0002        	addw	x,#OFST-10
1961  0658 90ae0062      	ldw	y,#L534_str
1962  065c a607          	ld	a,#7
1963  065e cd0000        	call	c_xymvx
1965                     ; 540   if (ptr == 0) return;
1967  0661 1e0d          	ldw	x,(OFST+1,sp)
1968  0663 2603          	jrne	L45
1969  0665 cc072d        	jp	L25
1970  0668               L45:
1973                     ; 543   for (ptr1=ptr,Str_size = 0 ; *ptr1 != 0; Str_size++,ptr1++) ;
1975  0668 1e0d          	ldw	x,(OFST+1,sp)
1976  066a 1f09          	ldw	(OFST-3,sp),x
1977  066c 0f0b          	clr	(OFST-1,sp)
1979  066e 2009          	jra	L715
1980  0670               L315:
1984  0670 0c0b          	inc	(OFST-1,sp)
1985  0672 1e09          	ldw	x,(OFST-3,sp)
1986  0674 1c0001        	addw	x,#1
1987  0677 1f09          	ldw	(OFST-3,sp),x
1988  0679               L715:
1991  0679 1e09          	ldw	x,(OFST-3,sp)
1992  067b 7d            	tnz	(x)
1993  067c 26f2          	jrne	L315
1994                     ; 545   ptr1 = ptr;
1996  067e 1e0d          	ldw	x,(OFST+1,sp)
1997  0680 1f09          	ldw	(OFST-3,sp),x
1998                     ; 547   LCD_GLASS_DisplayString(ptr);
2000  0682 1e0d          	ldw	x,(OFST+1,sp)
2001  0684 cd0599        	call	_LCD_GLASS_DisplayString
2003                     ; 548   delay_ms(ScrollSpeed);
2005  0687 1e13          	ldw	x,(OFST+7,sp)
2006  0689 cd0000        	call	_delay_ms
2008                     ; 551   for (Repetition=0; Repetition<nScroll; Repetition++)
2010  068c 0f01          	clr	(OFST-11,sp)
2012  068e ac420742      	jpf	L725
2013  0692               L325:
2014                     ; 553     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2016  0692 0f0c          	clr	(OFST+0,sp)
2018  0694 ac370737      	jpf	L735
2019  0698               L335:
2020                     ; 555       *(str) =* (ptr1+((Char_Nb+1)%Str_size));
2022  0698 7b0c          	ld	a,(OFST+0,sp)
2023  069a 5f            	clrw	x
2024  069b 97            	ld	xl,a
2025  069c 5c            	incw	x
2026  069d 7b0b          	ld	a,(OFST-1,sp)
2027  069f 905f          	clrw	y
2028  06a1 9097          	ld	yl,a
2029  06a3 cd0000        	call	c_idiv
2031  06a6 51            	exgw	x,y
2032  06a7 72fb09        	addw	x,(OFST-3,sp)
2033  06aa f6            	ld	a,(x)
2034  06ab 6b02          	ld	(OFST-10,sp),a
2035                     ; 556       *(str+1) =* (ptr1+((Char_Nb+2)%Str_size));
2037  06ad 7b0c          	ld	a,(OFST+0,sp)
2038  06af 5f            	clrw	x
2039  06b0 97            	ld	xl,a
2040  06b1 5c            	incw	x
2041  06b2 5c            	incw	x
2042  06b3 7b0b          	ld	a,(OFST-1,sp)
2043  06b5 905f          	clrw	y
2044  06b7 9097          	ld	yl,a
2045  06b9 cd0000        	call	c_idiv
2047  06bc 51            	exgw	x,y
2048  06bd 72fb09        	addw	x,(OFST-3,sp)
2049  06c0 f6            	ld	a,(x)
2050  06c1 6b03          	ld	(OFST-9,sp),a
2051                     ; 557       *(str+2) =* (ptr1+((Char_Nb+3)%Str_size));
2053  06c3 7b0c          	ld	a,(OFST+0,sp)
2054  06c5 5f            	clrw	x
2055  06c6 97            	ld	xl,a
2056  06c7 1c0003        	addw	x,#3
2057  06ca 7b0b          	ld	a,(OFST-1,sp)
2058  06cc 905f          	clrw	y
2059  06ce 9097          	ld	yl,a
2060  06d0 cd0000        	call	c_idiv
2062  06d3 51            	exgw	x,y
2063  06d4 72fb09        	addw	x,(OFST-3,sp)
2064  06d7 f6            	ld	a,(x)
2065  06d8 6b04          	ld	(OFST-8,sp),a
2066                     ; 558       *(str+3) =* (ptr1+((Char_Nb+4)%Str_size));
2068  06da 7b0c          	ld	a,(OFST+0,sp)
2069  06dc 5f            	clrw	x
2070  06dd 97            	ld	xl,a
2071  06de 1c0004        	addw	x,#4
2072  06e1 7b0b          	ld	a,(OFST-1,sp)
2073  06e3 905f          	clrw	y
2074  06e5 9097          	ld	yl,a
2075  06e7 cd0000        	call	c_idiv
2077  06ea 51            	exgw	x,y
2078  06eb 72fb09        	addw	x,(OFST-3,sp)
2079  06ee f6            	ld	a,(x)
2080  06ef 6b05          	ld	(OFST-7,sp),a
2081                     ; 559       *(str+4) =* (ptr1+((Char_Nb+5)%Str_size));
2083  06f1 7b0c          	ld	a,(OFST+0,sp)
2084  06f3 5f            	clrw	x
2085  06f4 97            	ld	xl,a
2086  06f5 1c0005        	addw	x,#5
2087  06f8 7b0b          	ld	a,(OFST-1,sp)
2088  06fa 905f          	clrw	y
2089  06fc 9097          	ld	yl,a
2090  06fe cd0000        	call	c_idiv
2092  0701 51            	exgw	x,y
2093  0702 72fb09        	addw	x,(OFST-3,sp)
2094  0705 f6            	ld	a,(x)
2095  0706 6b06          	ld	(OFST-6,sp),a
2096                     ; 560       *(str+5) =* (ptr1+((Char_Nb+6)%Str_size));
2098  0708 7b0c          	ld	a,(OFST+0,sp)
2099  070a 5f            	clrw	x
2100  070b 97            	ld	xl,a
2101  070c 1c0006        	addw	x,#6
2102  070f 7b0b          	ld	a,(OFST-1,sp)
2103  0711 905f          	clrw	y
2104  0713 9097          	ld	yl,a
2105  0715 cd0000        	call	c_idiv
2107  0718 51            	exgw	x,y
2108  0719 72fb09        	addw	x,(OFST-3,sp)
2109  071c f6            	ld	a,(x)
2110  071d 6b07          	ld	(OFST-5,sp),a
2111                     ; 561       LCD_GLASS_Clear();
2113  071f cd063c        	call	_LCD_GLASS_Clear
2115                     ; 562       LCD_GLASS_DisplayString(str);
2117  0722 96            	ldw	x,sp
2118  0723 1c0002        	addw	x,#OFST-10
2119  0726 cd0599        	call	_LCD_GLASS_DisplayString
2121                     ; 565       if (KeyPressed)
2123  0729 3d00          	tnz	_KeyPressed
2124  072b 2703          	jreq	L345
2125                     ; 566               return;   		
2126  072d               L25:
2129  072d 5b0e          	addw	sp,#14
2130  072f 81            	ret
2131  0730               L345:
2132                     ; 567       delay_ms(ScrollSpeed);
2134  0730 1e13          	ldw	x,(OFST+7,sp)
2135  0732 cd0000        	call	_delay_ms
2137                     ; 553     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2139  0735 0c0c          	inc	(OFST+0,sp)
2140  0737               L735:
2143  0737 7b0c          	ld	a,(OFST+0,sp)
2144  0739 110b          	cp	a,(OFST-1,sp)
2145  073b 2403          	jruge	L65
2146  073d cc0698        	jp	L335
2147  0740               L65:
2148                     ; 551   for (Repetition=0; Repetition<nScroll; Repetition++)
2150  0740 0c01          	inc	(OFST-11,sp)
2151  0742               L725:
2154  0742 7b01          	ld	a,(OFST-11,sp)
2155  0744 5f            	clrw	x
2156  0745 97            	ld	xl,a
2157  0746 1311          	cpw	x,(OFST+5,sp)
2158  0748 2403          	jruge	L06
2159  074a cc0692        	jp	L325
2160  074d               L06:
2161                     ; 571 }
2163  074d 20de          	jra	L25
2218                     	xdef	_LCD_contrast
2219                     	xdef	_NumberMap
2220                     	xdef	_CapLetterMap
2221                     	xdef	_t_bar
2222                     	xdef	_KeyPressed
2223                     	xref	_delay_ms
2224                     	xdef	_LCD_GLASS_ScrollSentence
2225                     	xdef	_LCD_GLASS_Clear
2226                     	xdef	_LCD_GLASS_DisplayStrDeci
2227                     	xdef	_LCD_GLASS_DisplayString
2228                     	xdef	_LCD_GLASS_WriteChar
2229                     	xdef	_LCD_GLASS_Init
2230                     	xdef	_LCD_bar
2231                     	xref	_LCD_ContrastConfig
2232                     	xref	_LCD_DeadTimeConfig
2233                     	xref	_LCD_PulseOnDurationConfig
2234                     	xref	_LCD_Cmd
2235                     	xref	_LCD_PortMaskConfig
2236                     	xref	_LCD_Init
2237                     	xref	_CLK_PeripheralClockConfig
2238                     	xref	_CLK_RTCClockConfig
2239                     	xref.b	c_x
2258                     	xref	c_idiv
2259                     	xref	c_xymvx
2260                     	end
