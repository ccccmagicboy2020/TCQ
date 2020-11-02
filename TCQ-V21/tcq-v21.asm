//Deviec:EN8F156
//-----------------------Variable---------------------------------
		_i		EQU		60H
		_SUM1_counter		EQU		7DH
		_SUM1_num		EQU		69H
		_SUM0_num		EQU		68H
		_SUM1		EQU		38H
		_SUM0		EQU		34H
		_SUM		EQU		30H
		_ALL_SUM1		EQU		20H
		_SUM10		EQU		3CH
		_SUM3		EQU		40H
		_k		EQU		56H
		_times		EQU		5CH
		_start_times		EQU		58H
		_TH		EQU		44H
		_MAX_DELTA		EQU		24H
		_PIR_AD		EQU		2CH
		_average1		EQU		48H
		_times1		EQU		4CH
		_times2		EQU		50H
		_NOISE_PIR		EQU		28H
		_stop_times		EQU		63H
		_t		EQU		5AH
		_LIGHT		EQU		54H
		_light_ad		EQU		61H
		_light_ad0		EQU		62H
		_check_light_times		EQU		5FH
		_calc_average_times		EQU		5EH
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	C5H 			//0000 	38C5
		ORG		00A1H
		STR 	70H 			//00A1 	01F0

		//;TCQ-V21.C: 129: unsigned char a;
		//;TCQ-V21.C: 130: for(a=0;a<Time;a++)
		CLRR 	71H 			//00A2 	0171
		LDR 	70H,0 			//00A3 	0870
		SUBWR 	71H,0 			//00A4 	0C71
		BTSC 	STATUS,0 		//00A5 	1403
		RET		 					//00A6 	0004

		//;TCQ-V21.C: 131: {
		INCR	71H,1 			//00A7 	09F1
		LJUMP 	A3H 			//00A8 	38A3
		CLRWDT	 			//00A9 	0001
		CLRR 	INDF 			//00AA 	0100
		INCR	FSR,1 			//00AB 	0984
		XORWR 	FSR,0 			//00AC 	0404
		BTSC 	STATUS,2 		//00AD 	1503
		RETW 	0H 			//00AE 	2100
		XORWR 	FSR,0 			//00AF 	0404
		LJUMP 	AAH 			//00B0 	38AA

		//;TCQ-V21.C: 179: ADCON1 = 0B00100000;
		LDWI 	20H 			//00B1 	2A20
		BSR 	STATUS,5 		//00B2 	1A83
		STR 	1FH 			//00B3 	019F

		//;TCQ-V21.C: 184: ADCON0 = 0B10111001;
		LDWI 	B9H 			//00B4 	2AB9
		BCR 	STATUS,5 		//00B5 	1283
		STR 	1FH 			//00B6 	019F

		//;TCQ-V21.C: 192: ANSEL = 0B00100001;
		LDWI 	21H 			//00B7 	2A21
		BSR 	STATUS,5 		//00B8 	1A83
		STR 	11H 			//00B9 	0191
		RET		 					//00BA 	0004
		LDWI 	1H 			//00BB 	2A01

		//;TCQ-V21.C: 159: PA6=1;
		BCR 	STATUS,5 		//00BC 	1283
		BSR 	5H,6 			//00BD 	1B05

		//;TCQ-V21.C: 160: delay_sub(1);
		LCALL 	D1H 			//00BE 	30D1
		LDWI 	1H 			//00BF 	2A01

		//;TCQ-V21.C: 162: PA6=1;
		BCR 	STATUS,5 		//00C0 	1283
		BCR 	STATUS,6 		//00C1 	1303
		BSR 	5H,6 			//00C2 	1B05
		BSR 	5H,6 			//00C3 	1B05

		//;TCQ-V21.C: 165: delay_sub(1);
		LJUMP 	D1H 			//00C4 	38D1
		LDWI 	20H 			//00C5 	2A20
		CLRR 	7DH 			//00C6 	017D
		BCR 	STATUS,7 		//00C7 	1383
		STR 	FSR 			//00C8 	0184
		LDWI 	64H 			//00C9 	2A64
		LCALL 	A9H 			//00CA 	30A9
		LDWI 	10H 			//00CB 	2A10
		STR 	68H 			//00CC 	01E8
		LDWI 	80H 			//00CD 	2A80
		STR 	69H 			//00CE 	01E9
		CLRR 	STATUS 			//00CF 	0103
		LJUMP 	2C5H 			//00D0 	3AC5
		STR 	72H 			//00D1 	01F2

		//;TCQ-V21.C: 138: unsigned char i;
		//;TCQ-V21.C: 140: for(;n>0;n--)
		LDR 	72H,1 			//00D2 	08F2
		BTSC 	STATUS,2 		//00D3 	1503
		RET		 					//00D4 	0004

		//;TCQ-V21.C: 141: {
		//;TCQ-V21.C: 142: for(i=0;i<250;i++)DelayUs(228);
		CLRR 	73H 			//00D5 	0173
		LDWI 	E4H 			//00D6 	2AE4
		LCALL 	A1H 			//00D7 	30A1
		LDWI 	FAH 			//00D8 	2AFA
		INCR	73H,1 			//00D9 	09F3
		SUBWR 	73H,0 			//00DA 	0C73
		BTSS 	STATUS,0 		//00DB 	1C03
		LJUMP 	D6H 			//00DC 	38D6
		CLRWDT	 			//00DD 	0001
		DECRSZ 	72H,1 		//00DE 	0EF2
		LJUMP 	D5H 			//00DF 	38D5
		RET		 					//00E0 	0004

		//;TCQ-V21.C: 97: OSCCON = 0B01110001;
		LDWI 	71H 			//00E1 	2A71
		BSR 	STATUS,5 		//00E2 	1A83
		STR 	FH 			//00E3 	018F

		//;TCQ-V21.C: 104: INTCON = 0;
		CLRR 	INTCON 			//00E4 	010B

		//;TCQ-V21.C: 105: PORTA = 0B00000010;
		LDWI 	2H 			//00E5 	2A02
		BCR 	STATUS,5 		//00E6 	1283
		STR 	5H 			//00E7 	0185

		//;TCQ-V21.C: 106: TRISA = 0B10111101;
		LDWI 	BDH 			//00E8 	2ABD
		BSR 	STATUS,5 		//00E9 	1A83
		STR 	5H 			//00EA 	0185

		//;TCQ-V21.C: 107: PORTC = 0B00000000;
		BCR 	STATUS,5 		//00EB 	1283
		CLRR 	7H 			//00EC 	0107

		//;TCQ-V21.C: 108: TRISC = 0B11101100;
		LDWI 	ECH 			//00ED 	2AEC
		BSR 	STATUS,5 		//00EE 	1A83
		STR 	7H 			//00EF 	0187

		//;TCQ-V21.C: 110: WPUA = 0;
		CLRR 	15H 			//00F0 	0115

		//;TCQ-V21.C: 111: WPUC = 0;
		CLRR 	8H 			//00F1 	0108

		//;TCQ-V21.C: 112: OPTION = 0B00001101;
		LDWI 	DH 			//00F2 	2A0D
		STR 	1H 			//00F3 	0181

		//;TCQ-V21.C: 114: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00F4 	1283
		CLRR 	1BH 			//00F5 	011B
		LDWI 	7H 			//00F6 	2A07
		STR 	19H 			//00F7 	0199
		RET		 					//00F8 	0004
		STR 	72H 			//00F9 	01F2
		LDWI 	11H 			//00FA 	2A11

		//;TCQ-V21.C: 197: unsigned char i;
		//;TCQ-V21.C: 199: TRISA0=0;
		BSR 	STATUS,5 		//00FB 	1A83
		BCR 	5H,0 			//00FC 	1005

		//;TCQ-V21.C: 200: PA0=0;
		BCR 	STATUS,5 		//00FD 	1283
		BCR 	5H,0 			//00FE 	1005

		//;TCQ-V21.C: 201: DelayUs(17);
		LCALL 	A1H 			//00FF 	30A1

		//;TCQ-V21.C: 202: for(i=0;i<8;i++)
		CLRR 	73H 			//0100 	0173

		//;TCQ-V21.C: 203: {
		//;TCQ-V21.C: 204: if((d&0x01)==0)
		BTSC 	72H,0 			//0101 	1472
		LJUMP 	105H 			//0102 	3905

		//;TCQ-V21.C: 205: {
		//;TCQ-V21.C: 207: PA0=0;
		BCR 	5H,0 			//0103 	1005

		//;TCQ-V21.C: 208: }
		LJUMP 	106H 			//0104 	3906

		//;TCQ-V21.C: 209: else
		//;TCQ-V21.C: 210: {
		//;TCQ-V21.C: 212: PA0=1;
		BSR 	5H,0 			//0105 	1805

		//;TCQ-V21.C: 213: }
		//;TCQ-V21.C: 214: DelayUs(17);
		LDWI 	11H 			//0106 	2A11
		LCALL 	A1H 			//0107 	30A1
		LDWI 	8H 			//0108 	2A08

		//;TCQ-V21.C: 217: d>>=1;
		BCR 	STATUS,0 		//0109 	1003
		RRR	72H,1 			//010A 	06F2
		INCR	73H,1 			//010B 	09F3
		SUBWR 	73H,0 			//010C 	0C73
		BTSS 	STATUS,0 		//010D 	1C03
		LJUMP 	101H 			//010E 	3901
		LDWI 	32H 			//010F 	2A32

		//;TCQ-V21.C: 218: }
		//;TCQ-V21.C: 220: PA0=1;
		BSR 	5H,0 			//0110 	1805

		//;TCQ-V21.C: 221: TRISA0=1;
		BSR 	STATUS,5 		//0111 	1A83
		BSR 	5H,0 			//0112 	1805

		//;TCQ-V21.C: 222: DelayUs(50);
		LJUMP 	A1H 			//0113 	38A1
		STR 	74H 			//0114 	01F4

		//;TCQ-V21.C: 264: unsigned char i;
		//;TCQ-V21.C: 265: unsigned int ad_sum=0;
		CLRR 	75H 			//0115 	0175
		CLRR 	76H 			//0116 	0176

		//;TCQ-V21.C: 269: ADCON0 = ch;
		STR 	1FH 			//0117 	019F

		//;TCQ-V21.C: 271: DelayUs(100);
		LDWI 	64H 			//0118 	2A64
		LCALL 	A1H 			//0119 	30A1
		LDWI 	64H 			//011A 	2A64

		//;TCQ-V21.C: 272: GO_DONE = 1;
		BSR 	1FH,1 			//011B 	189F

		//;TCQ-V21.C: 273: DelayUs(100);
		LCALL 	A1H 			//011C 	30A1

		//;TCQ-V21.C: 275: for(i=0;i<16;i++)
		CLRR 	77H 			//011D 	0177

		//;TCQ-V21.C: 276: {
		//;TCQ-V21.C: 277: GO_DONE = 1;
		BCR 	STATUS,5 		//011E 	1283
		BSR 	1FH,1 			//011F 	189F

		//;TCQ-V21.C: 278: while( GO_DONE==1 );
		BTSC 	1FH,1 			//0120 	149F
		LJUMP 	120H 			//0121 	3920

		//;TCQ-V21.C: 280: ad_sum+= ADRESH<<8;
		LDR 	1EH,0 			//0122 	081E
		STR 	72H 			//0123 	01F2
		CLRR 	73H 			//0124 	0173
		STR 	73H 			//0125 	01F3
		CLRR 	72H 			//0126 	0172
		LDR 	72H,0 			//0127 	0872
		ADDWR 	75H,1 			//0128 	0BF5
		BTSC 	STATUS,0 		//0129 	1403
		INCR	76H,1 			//012A 	09F6
		LDR 	73H,0 			//012B 	0873
		ADDWR 	76H,1 			//012C 	0BF6

		//;TCQ-V21.C: 281: ad_sum+= ADRESL;
		BSR 	STATUS,5 		//012D 	1A83
		LDR 	1EH,0 			//012E 	081E
		ADDWR 	75H,1 			//012F 	0BF5
		BTSC 	STATUS,0 		//0130 	1403
		INCR	76H,1 			//0131 	09F6

		//;TCQ-V21.C: 282: DelayUs(20);
		LDWI 	14H 			//0132 	2A14
		LCALL 	A1H 			//0133 	30A1
		LDWI 	10H 			//0134 	2A10
		INCR	77H,1 			//0135 	09F7
		SUBWR 	77H,0 			//0136 	0C77
		BTSS 	STATUS,0 		//0137 	1C03
		LJUMP 	11EH 			//0138 	391E

		//;TCQ-V21.C: 283: }
		//;TCQ-V21.C: 285: ad_sum>>=6;
		LDWI 	6H 			//0139 	2A06
		BCR 	STATUS,0 		//013A 	1003
		RRR	76H,1 			//013B 	06F6
		RRR	75H,1 			//013C 	06F5
		ADDWI 	FFH 			//013D 	27FF
		BTSS 	STATUS,2 		//013E 	1D03
		LJUMP 	13AH 			//013F 	393A

		//;TCQ-V21.C: 286: i=ad_sum;
		LDR 	75H,0 			//0140 	0875
		STR 	77H 			//0141 	01F7

		//;TCQ-V21.C: 288: ADCON0 = 0B10111001;
		LDWI 	B9H 			//0142 	2AB9
		BCR 	STATUS,5 		//0143 	1283
		STR 	1FH 			//0144 	019F

		//;TCQ-V21.C: 289: DelayUs(50);
		LDWI 	32H 			//0145 	2A32
		LCALL 	A1H 			//0146 	30A1

		//;TCQ-V21.C: 291: return i;
		LDR 	77H,0 			//0147 	0877
		RET		 					//0148 	0004

		//;TCQ-V21.C: 418: unsigned char count_i=0;
		CLRR 	76H 			//0149 	0176
		CLRR 	77H 			//014A 	0177
		CLRR 	78H 			//014B 	0178
		CLRR 	79H 			//014C 	0179

		//;TCQ-V21.C: 420: PA6=0;
		BCR 	5H,6 			//014D 	1305

		//;TCQ-V21.C: 421: TRISC3=1;
		BSR 	STATUS,5 		//014E 	1A83
		BSR 	7H,3 			//014F 	1987

		//;TCQ-V21.C: 426: if(count_i > 300)
		//;TCQ-V21.C: 422: while(PC3==1)
		BCR 	STATUS,5 		//0150 	1283
		BTSS 	7H,3 			//0151 	1D87
		LJUMP 	156H 			//0152 	3956

		//;TCQ-V21.C: 425: count_i++;
		LDWI 	88H 			//0153 	2A88
		LCALL 	A1H 			//0154 	30A1
		LJUMP 	150H 			//0155 	3950

		//;TCQ-V21.C: 433: }
		//;TCQ-V21.C: 434: }
		//;TCQ-V21.C: 436: for(i=0;i<24;i++)
		CLRR 	7AH 			//0156 	017A
		LDWI 	1H 			//0157 	2A01

		//;TCQ-V21.C: 437: {
		//;TCQ-V21.C: 438: PA6=1;
		BSR 	5H,6 			//0158 	1B05

		//;TCQ-V21.C: 439: DelayUs(1);
		LCALL 	A1H 			//0159 	30A1

		//;TCQ-V21.C: 441: dat <<= 1;
		BCR 	STATUS,0 		//015A 	1003
		RLR 	76H,1 			//015B 	05F6
		RLR 	77H,1 			//015C 	05F7
		RLR 	78H,1 			//015D 	05F8
		RLR 	79H,1 			//015E 	05F9

		//;TCQ-V21.C: 442: if(PC3==1)
		BTSS 	7H,3 			//015F 	1D87
		LJUMP 	168H 			//0160 	3968

		//;TCQ-V21.C: 443: {
		//;TCQ-V21.C: 444: dat ++;
		INCR	76H,1 			//0161 	09F6
		BTSC 	STATUS,2 		//0162 	1503
		INCR	77H,1 			//0163 	09F7
		BTSC 	STATUS,2 		//0164 	1503
		INCR	78H,1 			//0165 	09F8
		BTSC 	STATUS,2 		//0166 	1503
		INCR	79H,1 			//0167 	09F9
		LDWI 	1H 			//0168 	2A01

		//;TCQ-V21.C: 445: }
		//;TCQ-V21.C: 446: PA6=0;
		BCR 	5H,6 			//0169 	1305

		//;TCQ-V21.C: 447: DelayUs(1);
		LCALL 	A1H 			//016A 	30A1
		LDWI 	18H 			//016B 	2A18
		INCR	7AH,1 			//016C 	09FA
		SUBWR 	7AH,0 			//016D 	0C7A
		BTSS 	STATUS,0 		//016E 	1C03
		LJUMP 	157H 			//016F 	3957

		//;TCQ-V21.C: 448: }
		//;TCQ-V21.C: 449: for(i=0;i<3;i++)
		CLRR 	7AH 			//0170 	017A
		LDWI 	1H 			//0171 	2A01

		//;TCQ-V21.C: 450: {
		//;TCQ-V21.C: 451: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BSR 	5H,6 			//0172 	1B05
		LCALL 	A1H 			//0173 	30A1
		LDWI 	1H 			//0174 	2A01
		BCR 	5H,6 			//0175 	1305
		LCALL 	A1H 			//0176 	30A1
		LDWI 	3H 			//0177 	2A03
		INCR	7AH,1 			//0178 	09FA
		SUBWR 	7AH,0 			//0179 	0C7A
		BTSS 	STATUS,0 		//017A 	1C03
		LJUMP 	171H 			//017B 	3971

		//;TCQ-V21.C: 452: }
		//;TCQ-V21.C: 457: return dat;
		LDR 	79H,0 			//017C 	0879
		STR 	75H 			//017D 	01F5
		LDR 	78H,0 			//017E 	0878
		STR 	74H 			//017F 	01F4
		LDR 	77H,0 			//0180 	0877
		STR 	73H 			//0181 	01F3
		LDR 	76H,0 			//0182 	0876
		STR 	72H 			//0183 	01F2
		RET		 					//0184 	0004
		CLRR 	78H 			//0185 	0178
		CLRR 	79H 			//0186 	0179
		CLRR 	7AH 			//0187 	017A
		CLRR 	7BH 			//0188 	017B
		LDR 	73H,0 			//0189 	0873
		IORWR 	72H,0 			//018A 	0372
		IORWR 	71H,0 			//018B 	0371
		IORWR 	70H,0 			//018C 	0370
		BTSC 	STATUS,2 		//018D 	1503
		LJUMP 	1C4H 			//018E 	39C4
		CLRR 	7CH 			//018F 	017C
		INCR	7CH,1 			//0190 	09FC
		BTSC 	73H,7 			//0191 	17F3
		LJUMP 	199H 			//0192 	3999
		BCR 	STATUS,0 		//0193 	1003
		RLR 	70H,1 			//0194 	05F0
		RLR 	71H,1 			//0195 	05F1
		RLR 	72H,1 			//0196 	05F2
		RLR 	73H,1 			//0197 	05F3
		LJUMP 	190H 			//0198 	3990
		BCR 	STATUS,0 		//0199 	1003
		RLR 	78H,1 			//019A 	05F8
		RLR 	79H,1 			//019B 	05F9
		RLR 	7AH,1 			//019C 	05FA
		RLR 	7BH,1 			//019D 	05FB
		LDR 	73H,0 			//019E 	0873
		SUBWR 	77H,0 			//019F 	0C77
		BTSS 	STATUS,2 		//01A0 	1D03
		LJUMP 	1ACH 			//01A1 	39AC
		LDR 	72H,0 			//01A2 	0872
		SUBWR 	76H,0 			//01A3 	0C76
		BTSS 	STATUS,2 		//01A4 	1D03
		LJUMP 	1ACH 			//01A5 	39AC
		LDR 	71H,0 			//01A6 	0871
		SUBWR 	75H,0 			//01A7 	0C75
		BTSS 	STATUS,2 		//01A8 	1D03
		LJUMP 	1ACH 			//01A9 	39AC
		LDR 	70H,0 			//01AA 	0870
		SUBWR 	74H,0 			//01AB 	0C74
		BTSS 	STATUS,0 		//01AC 	1C03
		LJUMP 	1BEH 			//01AD 	39BE
		LDR 	70H,0 			//01AE 	0870
		SUBWR 	74H,1 			//01AF 	0CF4
		LDR 	71H,0 			//01B0 	0871
		BTSS 	STATUS,0 		//01B1 	1C03
		INCRSZ 	71H,0 		//01B2 	0A71
		SUBWR 	75H,1 			//01B3 	0CF5
		LDR 	72H,0 			//01B4 	0872
		BTSS 	STATUS,0 		//01B5 	1C03
		INCRSZ 	72H,0 		//01B6 	0A72
		SUBWR 	76H,1 			//01B7 	0CF6
		LDR 	73H,0 			//01B8 	0873
		BTSS 	STATUS,0 		//01B9 	1C03
		INCRSZ 	73H,0 		//01BA 	0A73
		SUBWR 	77H,1 			//01BB 	0CF7
		BSR 	78H,0 			//01BC 	1878
		BCR 	STATUS,0 		//01BD 	1003
		RRR	73H,1 			//01BE 	06F3
		RRR	72H,1 			//01BF 	06F2
		RRR	71H,1 			//01C0 	06F1
		RRR	70H,1 			//01C1 	06F0
		DECRSZ 	7CH,1 		//01C2 	0EFC
		LJUMP 	199H 			//01C3 	3999
		LDR 	7BH,0 			//01C4 	087B
		STR 	73H 			//01C5 	01F3
		LDR 	7AH,0 			//01C6 	087A
		STR 	72H 			//01C7 	01F2
		LDR 	79H,0 			//01C8 	0879
		STR 	71H 			//01C9 	01F1
		LDR 	78H,0 			//01CA 	0878
		STR 	70H 			//01CB 	01F0
		RET		 					//01CC 	0004
		LDWI 	3CH 			//01CD 	2A3C

		//;TCQ-V21.C: 303: unsigned char i;
		//;TCQ-V21.C: 304: unsigned char dat;
		//;TCQ-V21.C: 305: unsigned short count_i=0;
		CLRR 	72H 			//01CE 	0172
		CLRR 	73H 			//01CF 	0173

		//;TCQ-V21.C: 312: dat = 0B00111100;
		STR 	74H 			//01D0 	01F4

		//;TCQ-V21.C: 313: PA6=0;
		BCR 	STATUS,5 		//01D1 	1283
		BCR 	STATUS,6 		//01D2 	1303
		BCR 	5H,6 			//01D3 	1305

		//;TCQ-V21.C: 314: while(PC3 ==1)
		BTSS 	7H,3 			//01D4 	1D87
		LJUMP 	1E8H 			//01D5 	39E8

		//;TCQ-V21.C: 315: {
		//;TCQ-V21.C: 316: DelayUs(500);
		LDWI 	F4H 			//01D6 	2AF4
		LCALL 	A1H 			//01D7 	30A1

		//;TCQ-V21.C: 317: count_i++;
		INCR	72H,1 			//01D8 	09F2
		BTSC 	STATUS,2 		//01D9 	1503
		INCR	73H,1 			//01DA 	09F3

		//;TCQ-V21.C: 318: if(count_i > 15000)
		LDWI 	3AH 			//01DB 	2A3A
		SUBWR 	73H,0 			//01DC 	0C73
		LDWI 	99H 			//01DD 	2A99
		BTSC 	STATUS,2 		//01DE 	1503
		SUBWR 	72H,0 			//01DF 	0C72
		BTSS 	STATUS,0 		//01E0 	1C03
		LJUMP 	1D4H 			//01E1 	39D4

		//;TCQ-V21.C: 319: {
		//;TCQ-V21.C: 320: PA6=1;
		BSR 	5H,6 			//01E2 	1B05

		//;TCQ-V21.C: 321: TRISC3=0;
		BSR 	STATUS,5 		//01E3 	1A83
		BCR 	7H,3 			//01E4 	1187

		//;TCQ-V21.C: 322: PC3=1;
		BCR 	STATUS,5 		//01E5 	1283
		BSR 	7H,3 			//01E6 	1987

		//;TCQ-V21.C: 324: return;
		RET		 					//01E7 	0004
		LDWI 	1H 			//01E8 	2A01

		//;TCQ-V21.C: 325: }
		//;TCQ-V21.C: 326: }
		//;TCQ-V21.C: 327: TRISC3=0;
		BSR 	STATUS,5 		//01E9 	1A83
		BCR 	7H,3 			//01EA 	1187

		//;TCQ-V21.C: 328: for(i=0;i<29;i++)
		CLRR 	75H 			//01EB 	0175

		//;TCQ-V21.C: 329: {
		//;TCQ-V21.C: 330: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BCR 	STATUS,5 		//01EC 	1283
		BSR 	5H,6 			//01ED 	1B05
		LCALL 	A1H 			//01EE 	30A1
		LDWI 	1H 			//01EF 	2A01
		BCR 	5H,6 			//01F0 	1305
		LCALL 	A1H 			//01F1 	30A1
		LDWI 	1DH 			//01F2 	2A1D
		INCR	75H,1 			//01F3 	09F5
		SUBWR 	75H,0 			//01F4 	0C75
		LDWI 	1H 			//01F5 	2A01
		BTSS 	STATUS,0 		//01F6 	1C03
		LJUMP 	1ECH 			//01F7 	39EC

		//;TCQ-V21.C: 331: }
		//;TCQ-V21.C: 332: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//01F8 	1B05
		LCALL 	A1H 			//01F9 	30A1
		LDWI 	1H 			//01FA 	2A01
		BSR 	7H,3 			//01FB 	1987
		BCR 	5H,6 			//01FC 	1305
		LCALL 	A1H 			//01FD 	30A1
		LDWI 	1H 			//01FE 	2A01

		//;TCQ-V21.C: 333: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//01FF 	1B05
		LCALL 	A1H 			//0200 	30A1
		LDWI 	1H 			//0201 	2A01
		BSR 	7H,3 			//0202 	1987
		BCR 	5H,6 			//0203 	1305
		LCALL 	A1H 			//0204 	30A1
		LDWI 	1H 			//0205 	2A01

		//;TCQ-V21.C: 334: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0206 	1B05
		LCALL 	A1H 			//0207 	30A1
		LDWI 	1H 			//0208 	2A01
		BCR 	7H,3 			//0209 	1187
		BCR 	5H,6 			//020A 	1305
		LCALL 	A1H 			//020B 	30A1
		LDWI 	1H 			//020C 	2A01

		//;TCQ-V21.C: 335: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//020D 	1B05
		LCALL 	A1H 			//020E 	30A1
		LDWI 	1H 			//020F 	2A01
		BCR 	7H,3 			//0210 	1187
		BCR 	5H,6 			//0211 	1305
		LCALL 	A1H 			//0212 	30A1
		LDWI 	1H 			//0213 	2A01

		//;TCQ-V21.C: 336: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0214 	1B05
		LCALL 	A1H 			//0215 	30A1
		LDWI 	1H 			//0216 	2A01
		BSR 	7H,3 			//0217 	1987
		BCR 	5H,6 			//0218 	1305
		LCALL 	A1H 			//0219 	30A1
		LDWI 	1H 			//021A 	2A01

		//;TCQ-V21.C: 337: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//021B 	1B05
		LCALL 	A1H 			//021C 	30A1
		LDWI 	1H 			//021D 	2A01
		BCR 	7H,3 			//021E 	1187
		BCR 	5H,6 			//021F 	1305
		LCALL 	A1H 			//0220 	30A1
		LDWI 	1H 			//0221 	2A01

		//;TCQ-V21.C: 338: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0222 	1B05
		LCALL 	A1H 			//0223 	30A1
		LDWI 	1H 			//0224 	2A01
		BSR 	7H,3 			//0225 	1987
		BCR 	5H,6 			//0226 	1305
		LCALL 	A1H 			//0227 	30A1
		LDWI 	1H 			//0228 	2A01

		//;TCQ-V21.C: 339: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BSR 	5H,6 			//0229 	1B05
		LCALL 	A1H 			//022A 	30A1
		LDWI 	1H 			//022B 	2A01
		BCR 	5H,6 			//022C 	1305
		LCALL 	A1H 			//022D 	30A1
		LDWI 	1H 			//022E 	2A01

		//;TCQ-V21.C: 340: for(i=0;i<8;i++)
		CLRR 	75H 			//022F 	0175
		BSR 	5H,6 			//0230 	1B05
		LCALL 	A1H 			//0231 	30A1

		//;TCQ-V21.C: 343: if(dat&0x80)
		BTSS 	74H,7 			//0232 	1FF4
		LJUMP 	236H 			//0233 	3A36

		//;TCQ-V21.C: 344: PC3=1;
		BSR 	7H,3 			//0234 	1987
		LJUMP 	237H 			//0235 	3A37

		//;TCQ-V21.C: 345: else
		//;TCQ-V21.C: 346: PC3=0;
		BCR 	7H,3 			//0236 	1187
		LDWI 	1H 			//0237 	2A01

		//;TCQ-V21.C: 348: dat <<= 1;
		BCR 	STATUS,0 		//0238 	1003
		RLR 	74H,1 			//0239 	05F4

		//;TCQ-V21.C: 349: PA6=0;DelayUs(1);
		BCR 	5H,6 			//023A 	1305
		LCALL 	A1H 			//023B 	30A1
		LDWI 	8H 			//023C 	2A08
		INCR	75H,1 			//023D 	09F5
		SUBWR 	75H,0 			//023E 	0C75
		LDWI 	1H 			//023F 	2A01

		//;TCQ-V21.C: 350: }
		//;TCQ-V21.C: 351: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BSR 	5H,6 			//0240 	1B05
		BTSS 	STATUS,0 		//0241 	1C03
		LJUMP 	231H 			//0242 	3A31
		LCALL 	A1H 			//0243 	30A1
		LDWI 	1H 			//0244 	2A01
		BCR 	5H,6 			//0245 	1305
		LJUMP 	A1H 			//0246 	38A1

		//;TCQ-V21.C: 360: unsigned char k=0,j=0;
		CLRR 	72H 			//0247 	0172
		CLRR 	73H 			//0248 	0173

		//;TCQ-V21.C: 361: PA6=0;
		BCR 	5H,6 			//0249 	1305

		//;TCQ-V21.C: 362: TRISC3=1;
		BSR 	STATUS,5 		//024A 	1A83
		BSR 	7H,3 			//024B 	1987

		//;TCQ-V21.C: 363: while(PC3 ==1)
		BCR 	STATUS,5 		//024C 	1283
		BTSS 	7H,3 			//024D 	1D87
		LJUMP 	262H 			//024E 	3A62

		//;TCQ-V21.C: 364: {
		//;TCQ-V21.C: 365: DelayUs(5000);
		LDWI 	88H 			//024F 	2A88
		LCALL 	A1H 			//0250 	30A1

		//;TCQ-V21.C: 366: count_i++;
		INCR	72H,1 			//0251 	09F2
		BTSC 	STATUS,2 		//0252 	1503
		INCR	73H,1 			//0253 	09F3

		//;TCQ-V21.C: 367: if(count_i > 15000)
		LDWI 	3AH 			//0254 	2A3A
		SUBWR 	73H,0 			//0255 	0C73
		LDWI 	99H 			//0256 	2A99
		BTSC 	STATUS,2 		//0257 	1503
		SUBWR 	72H,0 			//0258 	0C72
		BTSS 	STATUS,0 		//0259 	1C03
		LJUMP 	24CH 			//025A 	3A4C
		LDWI 	FFH 			//025B 	2AFF

		//;TCQ-V21.C: 368: {
		//;TCQ-V21.C: 369: PA6=1;
		BSR 	5H,6 			//025C 	1B05

		//;TCQ-V21.C: 370: TRISC3=0;
		BSR 	STATUS,5 		//025D 	1A83
		BCR 	7H,3 			//025E 	1187

		//;TCQ-V21.C: 371: PC3=1;
		BCR 	STATUS,5 		//025F 	1283
		BSR 	7H,3 			//0260 	1987

		//;TCQ-V21.C: 373: return 0XFF;
		RET		 					//0261 	0004
		LDWI 	1H 			//0262 	2A01

		//;TCQ-V21.C: 374: }
		//;TCQ-V21.C: 375: }
		//;TCQ-V21.C: 376: for(i=0;i<29;i++)
		CLRR 	75H 			//0263 	0175

		//;TCQ-V21.C: 377: {
		//;TCQ-V21.C: 378: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BSR 	5H,6 			//0264 	1B05
		LCALL 	A1H 			//0265 	30A1
		LDWI 	1H 			//0266 	2A01
		BCR 	5H,6 			//0267 	1305
		LCALL 	A1H 			//0268 	30A1
		LDWI 	1DH 			//0269 	2A1D
		INCR	75H,1 			//026A 	09F5
		SUBWR 	75H,0 			//026B 	0C75
		LDWI 	1H 			//026C 	2A01
		BTSS 	STATUS,0 		//026D 	1C03
		LJUMP 	264H 			//026E 	3A64

		//;TCQ-V21.C: 379: }
		//;TCQ-V21.C: 380: TRISC3=0;
		BSR 	STATUS,5 		//026F 	1A83
		BCR 	7H,3 			//0270 	1187

		//;TCQ-V21.C: 381: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BCR 	STATUS,5 		//0271 	1283
		BSR 	5H,6 			//0272 	1B05
		LCALL 	A1H 			//0273 	30A1
		LDWI 	1H 			//0274 	2A01
		BSR 	7H,3 			//0275 	1987
		BCR 	5H,6 			//0276 	1305
		LCALL 	A1H 			//0277 	30A1
		LDWI 	1H 			//0278 	2A01

		//;TCQ-V21.C: 382: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0279 	1B05
		LCALL 	A1H 			//027A 	30A1
		LDWI 	1H 			//027B 	2A01
		BCR 	7H,3 			//027C 	1187
		BCR 	5H,6 			//027D 	1305
		LCALL 	A1H 			//027E 	30A1
		LDWI 	1H 			//027F 	2A01

		//;TCQ-V21.C: 383: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0280 	1B05
		LCALL 	A1H 			//0281 	30A1
		LDWI 	1H 			//0282 	2A01
		BSR 	7H,3 			//0283 	1987
		BCR 	5H,6 			//0284 	1305
		LCALL 	A1H 			//0285 	30A1
		LDWI 	1H 			//0286 	2A01

		//;TCQ-V21.C: 384: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0287 	1B05
		LCALL 	A1H 			//0288 	30A1
		LDWI 	1H 			//0289 	2A01
		BCR 	7H,3 			//028A 	1187
		BCR 	5H,6 			//028B 	1305
		LCALL 	A1H 			//028C 	30A1
		LDWI 	1H 			//028D 	2A01

		//;TCQ-V21.C: 385: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//028E 	1B05
		LCALL 	A1H 			//028F 	30A1
		LDWI 	1H 			//0290 	2A01
		BSR 	7H,3 			//0291 	1987
		BCR 	5H,6 			//0292 	1305
		LCALL 	A1H 			//0293 	30A1
		LDWI 	1H 			//0294 	2A01

		//;TCQ-V21.C: 386: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
		BSR 	5H,6 			//0295 	1B05
		LCALL 	A1H 			//0296 	30A1
		LDWI 	1H 			//0297 	2A01
		BSR 	7H,3 			//0298 	1987
		BCR 	5H,6 			//0299 	1305
		LCALL 	A1H 			//029A 	30A1
		LDWI 	1H 			//029B 	2A01

		//;TCQ-V21.C: 387: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
		BSR 	5H,6 			//029C 	1B05
		LCALL 	A1H 			//029D 	30A1
		LDWI 	1H 			//029E 	2A01
		BCR 	7H,3 			//029F 	1187
		BCR 	5H,6 			//02A0 	1305
		LCALL 	A1H 			//02A1 	30A1
		LDWI 	1H 			//02A2 	2A01

		//;TCQ-V21.C: 388: PC3=1;
		BSR 	7H,3 			//02A3 	1987
		BSR 	5H,6 			//02A4 	1B05
		LCALL 	A1H 			//02A5 	30A1
		LDWI 	1H 			//02A6 	2A01
		BCR 	5H,6 			//02A7 	1305
		LCALL 	A1H 			//02A8 	30A1
		LDWI 	1H 			//02A9 	2A01

		//;TCQ-V21.C: 390: dat=0;
		CLRR 	74H 			//02AA 	0174

		//;TCQ-V21.C: 391: TRISC3=1;
		BSR 	STATUS,5 		//02AB 	1A83
		BSR 	7H,3 			//02AC 	1987

		//;TCQ-V21.C: 392: for(i=0;i<8;i++)
		CLRR 	75H 			//02AD 	0175

		//;TCQ-V21.C: 393: {
		//;TCQ-V21.C: 394: dat <<= 1;
		BCR 	STATUS,0 		//02AE 	1003
		RLR 	74H,1 			//02AF 	05F4

		//;TCQ-V21.C: 395: PA6=1;DelayUs(1); PA6=0;DelayUs(1);
		BCR 	STATUS,5 		//02B0 	1283
		BSR 	5H,6 			//02B1 	1B05
		LCALL 	A1H 			//02B2 	30A1
		LDWI 	1H 			//02B3 	2A01
		BCR 	5H,6 			//02B4 	1305
		LCALL 	A1H 			//02B5 	30A1

		//;TCQ-V21.C: 396: if(PC3 ==1)
		BTSC 	7H,3 			//02B6 	1587

		//;TCQ-V21.C: 398: dat++;
		INCR	74H,1 			//02B7 	09F4
		LDWI 	8H 			//02B8 	2A08
		INCR	75H,1 			//02B9 	09F5
		SUBWR 	75H,0 			//02BA 	0C75
		LDWI 	1H 			//02BB 	2A01
		BTSS 	STATUS,0 		//02BC 	1C03
		LJUMP 	2AFH 			//02BD 	3AAF

		//;TCQ-V21.C: 402: }
		//;TCQ-V21.C: 403: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
		BSR 	5H,6 			//02BE 	1B05
		LCALL 	A1H 			//02BF 	30A1
		LDWI 	1H 			//02C0 	2A01
		BCR 	5H,6 			//02C1 	1305
		LCALL 	A1H 			//02C2 	30A1

		//;TCQ-V21.C: 404: return dat;
		LDR 	74H,0 			//02C3 	0874
		RET		 					//02C4 	0004

		//;TCQ-V21.C: 548: POWER_INITIAL();
		LCALL 	E1H 			//02C5 	30E1

		//;TCQ-V21.C: 551: ADC_INITIAL();
		LCALL 	B1H 			//02C6 	30B1

		//;TCQ-V21.C: 554: CS1237_Power_Down();
		LCALL 	BBH 			//02C7 	30BB

		//;TCQ-V21.C: 555: Con_CS1237();
		LCALL 	1CDH 			//02C8 	31CD

		//;TCQ-V21.C: 558: MIN_PIR=0XFF;
		LCALL 	247H 			//02C9 	3247

		//;TCQ-V21.C: 608: wave=0;
		LDWI 	AH 			//02CA 	2A0A
		LCALL 	D1H 			//02CB 	30D1
		LDWI 	6H 			//02CC 	2A06

		//;TCQ-V21.C: 609: PC0=1;
		BCR 	STATUS,5 		//02CD 	1283
		BCR 	STATUS,6 		//02CE 	1303
		BSR 	7H,0 			//02CF 	1807

		//;TCQ-V21.C: 612: delay_sub(6);
		LCALL 	D1H 			//02D0 	30D1

		//;TCQ-V21.C: 616: SUM=0;
		BCR 	STATUS,5 		//02D1 	1283
		BCR 	STATUS,6 		//02D2 	1303
		CLRR 	30H 			//02D3 	0130
		CLRR 	31H 			//02D4 	0131
		CLRR 	32H 			//02D5 	0132
		CLRR 	33H 			//02D6 	0133

		//;TCQ-V21.C: 625: for(i=0;i<32;i++)
		CLRR 	60H 			//02D7 	0160

		//;TCQ-V21.C: 626: {
		//;TCQ-V21.C: 627: for(t=0;t<2048;t++)
		CLRR 	5AH 			//02D8 	015A
		CLRR 	5BH 			//02D9 	015B

		//;TCQ-V21.C: 628: {
		//;TCQ-V21.C: 629: GO_DONE = 1;
		BSR 	1FH,1 			//02DA 	189F

		//;TCQ-V21.C: 630: while( GO_DONE==1 );
		BTSC 	1FH,1 			//02DB 	149F
		LJUMP 	2DBH 			//02DC 	3ADB

		//;TCQ-V21.C: 632: k = ADRESH<<8;
		LDR 	1EH,0 			//02DD 	081E
		STR 	57H 			//02DE 	01D7
		CLRR 	56H 			//02DF 	0156

		//;TCQ-V21.C: 633: k+= ADRESL;
		BSR 	STATUS,5 		//02E0 	1A83
		LDR 	1EH,0 			//02E1 	081E
		BCR 	STATUS,5 		//02E2 	1283
		ADDWR 	56H,1 			//02E3 	0BD6
		BTSC 	STATUS,0 		//02E4 	1403
		INCR	57H,1 			//02E5 	09D7

		//;TCQ-V21.C: 635: SUM+=k;
		LDR 	56H,0 			//02E6 	0856
		STR 	64H 			//02E7 	01E4
		LDR 	57H,0 			//02E8 	0857
		STR 	65H 			//02E9 	01E5
		CLRR 	66H 			//02EA 	0166
		CLRR 	67H 			//02EB 	0167
		LDR 	64H,0 			//02EC 	0864
		ADDWR 	30H,1 			//02ED 	0BB0
		LDR 	65H,0 			//02EE 	0865
		BCR 	STATUS,2 		//02EF 	1103
		BTSC 	STATUS,0 		//02F0 	1403
		ADDWI 	1H 			//02F1 	2701
		BTSS 	STATUS,2 		//02F2 	1D03
		ADDWR 	31H,1 			//02F3 	0BB1
		LDR 	66H,0 			//02F4 	0866
		BCR 	STATUS,2 		//02F5 	1103
		BTSC 	STATUS,0 		//02F6 	1403
		ADDWI 	1H 			//02F7 	2701
		BTSS 	STATUS,2 		//02F8 	1D03
		ADDWR 	32H,1 			//02F9 	0BB2
		LDR 	67H,0 			//02FA 	0867
		BCR 	STATUS,2 		//02FB 	1103
		BTSC 	STATUS,0 		//02FC 	1403
		ADDWI 	1H 			//02FD 	2701
		BTSS 	STATUS,2 		//02FE 	1D03
		ADDWR 	33H,1 			//02FF 	0BB3
		INCR	5AH,1 			//0300 	09DA
		BTSC 	STATUS,2 		//0301 	1503
		INCR	5BH,1 			//0302 	09DB
		LDWI 	8H 			//0303 	2A08
		SUBWR 	5BH,0 			//0304 	0C5B
		LDWI 	0H 			//0305 	2A00
		BTSC 	STATUS,2 		//0306 	1503
		SUBWR 	5AH,0 			//0307 	0C5A
		BTSS 	STATUS,0 		//0308 	1C03
		LJUMP 	2DAH 			//0309 	3ADA
		CLRWDT	 			//030A 	0001
		LDWI 	20H 			//030B 	2A20
		BCR 	STATUS,5 		//030C 	1283
		BCR 	STATUS,6 		//030D 	1303
		INCR	60H,1 			//030E 	09E0
		SUBWR 	60H,0 			//030F 	0C60
		BTSS 	STATUS,0 		//0310 	1C03
		LJUMP 	2D8H 			//0311 	3AD8

		//;TCQ-V21.C: 694: TH=12000;
		LDWI 	2EH 			//0312 	2A2E
		CLRR 	47H 			//0313 	0147
		CLRR 	46H 			//0314 	0146
		STR 	45H 			//0315 	01C5
		LDWI 	E0H 			//0316 	2AE0
		STR 	44H 			//0317 	01C4

		//;TCQ-V21.C: 699: light_ad=read_ad(0XB5);
		LDWI 	B5H 			//0318 	2AB5
		LCALL 	114H 			//0319 	3114
		STR 	61H 			//031A 	01E1

		//;TCQ-V21.C: 700: light_ad0=light_ad;
		STR 	62H 			//031B 	01E2

		//;TCQ-V21.C: 702: for(i=0;i<20;i++)DelayUs(228);
		CLRR 	60H 			//031C 	0160
		LDWI 	E4H 			//031D 	2AE4
		LCALL 	A1H 			//031E 	30A1
		LDWI 	14H 			//031F 	2A14
		INCR	60H,1 			//0320 	09E0
		SUBWR 	60H,0 			//0321 	0C60
		BTSS 	STATUS,0 		//0322 	1C03
		LJUMP 	31DH 			//0323 	3B1D
		LDWI 	FFH 			//0324 	2AFF

		//;TCQ-V21.C: 706: unsigned int m=0;
		CLRR 	30H 			//0325 	0130
		CLRR 	31H 			//0326 	0131
		CLRR 	32H 			//0327 	0132
		CLRR 	33H 			//0328 	0133

		//;TCQ-V21.C: 707: NOISE_PIR=0XFFFFFFFF;
		STR 	2BH 			//0329 	01AB
		STR 	2AH 			//032A 	01AA
		STR 	29H 			//032B 	01A9
		STR 	28H 			//032C 	01A8

		//;TCQ-V21.C: 709: while(1)
		//;TCQ-V21.C: 714: {
		//;TCQ-V21.C: 730: times++;
		BCR 	STATUS,5 		//032D 	1283
		INCR	5CH,1 			//032E 	09DC
		BTSC 	STATUS,2 		//032F 	1503
		INCR	5DH,1 			//0330 	09DD

		//;TCQ-V21.C: 732: PIR_AD= Read_CS1237();
		LCALL 	149H 			//0331 	3149
		LDR 	75H,0 			//0332 	0875
		STR 	2FH 			//0333 	01AF
		LDR 	74H,0 			//0334 	0874
		STR 	2EH 			//0335 	01AE
		LDR 	73H,0 			//0336 	0873
		STR 	2DH 			//0337 	01AD
		LDR 	72H,0 			//0338 	0872
		STR 	2CH 			//0339 	01AC

		//;TCQ-V21.C: 734: PIR_AD+=0X7FFFFF;
		LDWI 	FFH 			//033A 	2AFF
		ADDWR 	2CH,1 			//033B 	0BAC
		BTSS 	STATUS,0 		//033C 	1C03
		ADDWR 	2DH,1 			//033D 	0BAD
		LDWI 	7FH 			//033E 	2A7F
		BTSC 	STATUS,0 		//033F 	1403
		LDWI 	80H 			//0340 	2A80
		ADDWR 	2EH,1 			//0341 	0BAE
		LDWI 	0H 			//0342 	2A00
		BTSC 	STATUS,0 		//0343 	1403
		LDWI 	1H 			//0344 	2A01
		ADDWR 	2FH,1 			//0345 	0BAF
		LDWI 	7FH 			//0346 	2A7F

		//;TCQ-V21.C: 735: PIR_AD&=0X00FFFFFF;
		CLRR 	2FH 			//0347 	012F

		//;TCQ-V21.C: 742: average1=0X7FFFFF;
		CLRR 	4BH 			//0348 	014B
		STR 	4AH 			//0349 	01CA
		LDWI 	FFH 			//034A 	2AFF
		STR 	49H 			//034B 	01C9
		STR 	48H 			//034C 	01C8

		//;TCQ-V21.C: 743: if(PIR_AD>average1) k=PIR_AD-average1;
		LDWI 	0H 			//034D 	2A00
		SUBWR 	2FH,0 			//034E 	0C2F
		BTSS 	STATUS,2 		//034F 	1D03
		LJUMP 	35BH 			//0350 	3B5B
		LDWI 	80H 			//0351 	2A80
		SUBWR 	2EH,0 			//0352 	0C2E
		BTSS 	STATUS,2 		//0353 	1D03
		LJUMP 	35BH 			//0354 	3B5B
		LDWI 	0H 			//0355 	2A00
		SUBWR 	2DH,0 			//0356 	0C2D
		BTSS 	STATUS,2 		//0357 	1D03
		LJUMP 	35BH 			//0358 	3B5B
		LDWI 	0H 			//0359 	2A00
		SUBWR 	2CH,0 			//035A 	0C2C
		BTSS 	STATUS,0 		//035B 	1C03
		LJUMP 	366H 			//035C 	3B66
		LDR 	2DH,0 			//035D 	082D
		STR 	57H 			//035E 	01D7
		LDR 	2CH,0 			//035F 	082C
		STR 	56H 			//0360 	01D6
		LDWI 	FFH 			//0361 	2AFF
		SUBWR 	56H,1 			//0362 	0CD6
		BTSS 	STATUS,0 		//0363 	1C03
		DECR 	57H,1 			//0364 	0DD7
		SUBWR 	57H,1 			//0365 	0CD7

		//;TCQ-V21.C: 744: if(PIR_AD<average1) k=average1-PIR_AD;
		LDWI 	0H 			//0366 	2A00
		SUBWR 	2FH,0 			//0367 	0C2F
		BTSS 	STATUS,2 		//0368 	1D03
		LJUMP 	374H 			//0369 	3B74
		LDWI 	7FH 			//036A 	2A7F
		SUBWR 	2EH,0 			//036B 	0C2E
		BTSS 	STATUS,2 		//036C 	1D03
		LJUMP 	374H 			//036D 	3B74
		LDWI 	FFH 			//036E 	2AFF
		SUBWR 	2DH,0 			//036F 	0C2D
		BTSS 	STATUS,2 		//0370 	1D03
		LJUMP 	374H 			//0371 	3B74
		LDWI 	FFH 			//0372 	2AFF
		SUBWR 	2CH,0 			//0373 	0C2C
		BTSC 	STATUS,0 		//0374 	1403
		LJUMP 	37FH 			//0375 	3B7F
		LDWI 	FFH 			//0376 	2AFF
		STR 	56H 			//0377 	01D6
		STR 	57H 			//0378 	01D7
		LDR 	2CH,0 			//0379 	082C
		SUBWR 	56H,1 			//037A 	0CD6
		LDR 	2DH,0 			//037B 	082D
		BTSS 	STATUS,0 		//037C 	1C03
		DECR 	57H,1 			//037D 	0DD7
		SUBWR 	57H,1 			//037E 	0CD7

		//;TCQ-V21.C: 745: SUM3+=k;
		LDR 	56H,0 			//037F 	0856
		STR 	64H 			//0380 	01E4
		LDR 	57H,0 			//0381 	0857
		STR 	65H 			//0382 	01E5
		CLRR 	66H 			//0383 	0166
		CLRR 	67H 			//0384 	0167
		LDR 	64H,0 			//0385 	0864
		ADDWR 	40H,1 			//0386 	0BC0
		LDR 	65H,0 			//0387 	0865
		BCR 	STATUS,2 		//0388 	1103
		BTSC 	STATUS,0 		//0389 	1403
		ADDWI 	1H 			//038A 	2701
		BTSS 	STATUS,2 		//038B 	1D03
		ADDWR 	41H,1 			//038C 	0BC1
		LDR 	66H,0 			//038D 	0866
		BCR 	STATUS,2 		//038E 	1103
		BTSC 	STATUS,0 		//038F 	1403
		ADDWI 	1H 			//0390 	2701
		BTSS 	STATUS,2 		//0391 	1D03
		ADDWR 	42H,1 			//0392 	0BC2
		LDR 	67H,0 			//0393 	0867
		BCR 	STATUS,2 		//0394 	1103
		BTSC 	STATUS,0 		//0395 	1403
		ADDWI 	1H 			//0396 	2701
		BTSS 	STATUS,2 		//0397 	1D03
		ADDWR 	43H,1 			//0398 	0BC3

		//;TCQ-V21.C: 746: times1++;
		INCR	4CH,1 			//0399 	09CC
		BTSC 	STATUS,2 		//039A 	1503
		INCR	4DH,1 			//039B 	09CD
		BTSC 	STATUS,2 		//039C 	1503
		INCR	4EH,1 			//039D 	09CE
		BTSC 	STATUS,2 		//039E 	1503
		INCR	4FH,1 			//039F 	09CF

		//;TCQ-V21.C: 747: if(times1>=8192)
		LDWI 	0H 			//03A0 	2A00
		SUBWR 	4FH,0 			//03A1 	0C4F
		BTSS 	STATUS,2 		//03A2 	1D03
		LJUMP 	3AEH 			//03A3 	3BAE
		LDWI 	0H 			//03A4 	2A00
		SUBWR 	4EH,0 			//03A5 	0C4E
		BTSS 	STATUS,2 		//03A6 	1D03
		LJUMP 	3AEH 			//03A7 	3BAE
		LDWI 	20H 			//03A8 	2A20
		SUBWR 	4DH,0 			//03A9 	0C4D
		BTSS 	STATUS,2 		//03AA 	1D03
		LJUMP 	3AEH 			//03AB 	3BAE
		LDWI 	0H 			//03AC 	2A00
		SUBWR 	4CH,0 			//03AD 	0C4C
		BTSS 	STATUS,0 		//03AE 	1C03
		LJUMP 	413H 			//03AF 	3C13

		//;TCQ-V21.C: 748: {
		//;TCQ-V21.C: 749: times1=0;
		CLRR 	4CH 			//03B0 	014C
		CLRR 	4DH 			//03B1 	014D
		CLRR 	4EH 			//03B2 	014E
		CLRR 	4FH 			//03B3 	014F

		//;TCQ-V21.C: 751: if(SUM3<NOISE_PIR) NOISE_PIR=SUM3;
		LDR 	2BH,0 			//03B4 	082B
		SUBWR 	43H,0 			//03B5 	0C43
		BTSS 	STATUS,2 		//03B6 	1D03
		LJUMP 	3C2H 			//03B7 	3BC2
		LDR 	2AH,0 			//03B8 	082A
		SUBWR 	42H,0 			//03B9 	0C42
		BTSS 	STATUS,2 		//03BA 	1D03
		LJUMP 	3C2H 			//03BB 	3BC2
		LDR 	29H,0 			//03BC 	0829
		SUBWR 	41H,0 			//03BD 	0C41
		BTSS 	STATUS,2 		//03BE 	1D03
		LJUMP 	3C2H 			//03BF 	3BC2
		LDR 	28H,0 			//03C0 	0828
		SUBWR 	40H,0 			//03C1 	0C40
		BTSC 	STATUS,0 		//03C2 	1403
		LJUMP 	3CCH 			//03C3 	3BCC
		LDR 	43H,0 			//03C4 	0843
		STR 	2BH 			//03C5 	01AB
		LDR 	42H,0 			//03C6 	0842
		STR 	2AH 			//03C7 	01AA
		LDR 	41H,0 			//03C8 	0841
		STR 	29H 			//03C9 	01A9
		LDR 	40H,0 			//03CA 	0840
		STR 	28H 			//03CB 	01A8

		//;TCQ-V21.C: 753: if(SUM3-NOISE_PIR>2)
		LDR 	28H,0 			//03CC 	0828
		SUBWR 	40H,0 			//03CD 	0C40
		STR 	64H 			//03CE 	01E4
		LDR 	41H,0 			//03CF 	0841
		STR 	65H 			//03D0 	01E5
		LDR 	29H,0 			//03D1 	0829
		BTSS 	STATUS,0 		//03D2 	1C03
		INCRSZ 	29H,0 		//03D3 	0A29
		SUBWR 	65H,1 			//03D4 	0CE5
		LDR 	42H,0 			//03D5 	0842
		STR 	66H 			//03D6 	01E6
		LDR 	2AH,0 			//03D7 	082A
		BTSS 	STATUS,0 		//03D8 	1C03
		INCRSZ 	2AH,0 		//03D9 	0A2A
		SUBWR 	66H,1 			//03DA 	0CE6
		LDR 	43H,0 			//03DB 	0843
		STR 	67H 			//03DC 	01E7
		LDR 	2BH,0 			//03DD 	082B
		BTSS 	STATUS,0 		//03DE 	1C03
		INCRSZ 	2BH,0 		//03DF 	0A2B
		SUBWR 	67H,1 			//03E0 	0CE7
		LDWI 	0H 			//03E1 	2A00
		SUBWR 	67H,0 			//03E2 	0C67
		BTSS 	STATUS,2 		//03E3 	1D03
		LJUMP 	3EFH 			//03E4 	3BEF
		LDWI 	0H 			//03E5 	2A00
		SUBWR 	66H,0 			//03E6 	0C66
		BTSS 	STATUS,2 		//03E7 	1D03
		LJUMP 	3EFH 			//03E8 	3BEF
		LDWI 	0H 			//03E9 	2A00
		SUBWR 	65H,0 			//03EA 	0C65
		BTSS 	STATUS,2 		//03EB 	1D03
		LJUMP 	3EFH 			//03EC 	3BEF
		LDWI 	3H 			//03ED 	2A03
		SUBWR 	64H,0 			//03EE 	0C64
		BTSS 	STATUS,0 		//03EF 	1C03
		LJUMP 	3F7H 			//03F0 	3BF7

		//;TCQ-V21.C: 754: {
		//;TCQ-V21.C: 755: PA1=0;
		BCR 	5H,1 			//03F1 	1085

		//;TCQ-V21.C: 756: times2=1;
		CLRR 	50H 			//03F2 	0150
		INCR	50H,1 			//03F3 	09D0
		CLRR 	51H 			//03F4 	0151
		CLRR 	52H 			//03F5 	0152
		CLRR 	53H 			//03F6 	0153

		//;TCQ-V21.C: 757: }
		//;TCQ-V21.C: 758: send_data(NOISE_PIR>>24);
		LDR 	2BH,0 			//03F7 	082B
		LCALL 	F9H 			//03F8 	30F9

		//;TCQ-V21.C: 759: send_data(NOISE_PIR>>16);
		BCR 	STATUS,5 		//03F9 	1283
		LDR 	2AH,0 			//03FA 	082A
		LCALL 	F9H 			//03FB 	30F9

		//;TCQ-V21.C: 760: send_data(NOISE_PIR>>8);
		BCR 	STATUS,5 		//03FC 	1283
		LDR 	29H,0 			//03FD 	0829
		LCALL 	F9H 			//03FE 	30F9

		//;TCQ-V21.C: 761: send_data(NOISE_PIR);
		BCR 	STATUS,5 		//03FF 	1283
		LDR 	28H,0 			//0400 	0828
		LCALL 	F9H 			//0401 	30F9

		//;TCQ-V21.C: 762: send_data(SUM3>>24);
		BCR 	STATUS,5 		//0402 	1283
		LDR 	43H,0 			//0403 	0843
		LCALL 	F9H 			//0404 	30F9

		//;TCQ-V21.C: 763: send_data(SUM3>>16);
		BCR 	STATUS,5 		//0405 	1283
		LDR 	42H,0 			//0406 	0842
		LCALL 	F9H 			//0407 	30F9

		//;TCQ-V21.C: 764: send_data(SUM3>>8);
		BCR 	STATUS,5 		//0408 	1283
		LDR 	41H,0 			//0409 	0841
		LCALL 	F9H 			//040A 	30F9

		//;TCQ-V21.C: 765: send_data(SUM3);
		BCR 	STATUS,5 		//040B 	1283
		LDR 	40H,0 			//040C 	0840
		LCALL 	F9H 			//040D 	30F9

		//;TCQ-V21.C: 766: SUM3=0;
		BCR 	STATUS,5 		//040E 	1283
		CLRR 	40H 			//040F 	0140
		CLRR 	41H 			//0410 	0141
		CLRR 	42H 			//0411 	0142
		CLRR 	43H 			//0412 	0143

		//;TCQ-V21.C: 767: }
		//;TCQ-V21.C: 768: if(times2>0)
		LDR 	53H,0 			//0413 	0853
		IORWR 	52H,0 			//0414 	0352
		IORWR 	51H,0 			//0415 	0351
		IORWR 	50H,0 			//0416 	0350
		BTSC 	STATUS,2 		//0417 	1503
		LJUMP 	435H 			//0418 	3C35

		//;TCQ-V21.C: 769: {
		//;TCQ-V21.C: 770: times2++;
		INCR	50H,1 			//0419 	09D0
		BTSC 	STATUS,2 		//041A 	1503
		INCR	51H,1 			//041B 	09D1
		BTSC 	STATUS,2 		//041C 	1503
		INCR	52H,1 			//041D 	09D2
		BTSC 	STATUS,2 		//041E 	1503
		INCR	53H,1 			//041F 	09D3

		//;TCQ-V21.C: 771: if(times2>2048)
		LDWI 	0H 			//0420 	2A00
		SUBWR 	53H,0 			//0421 	0C53
		BTSS 	STATUS,2 		//0422 	1D03
		LJUMP 	42EH 			//0423 	3C2E
		LDWI 	0H 			//0424 	2A00
		SUBWR 	52H,0 			//0425 	0C52
		BTSS 	STATUS,2 		//0426 	1D03
		LJUMP 	42EH 			//0427 	3C2E
		LDWI 	8H 			//0428 	2A08
		SUBWR 	51H,0 			//0429 	0C51
		BTSS 	STATUS,2 		//042A 	1D03
		LJUMP 	42EH 			//042B 	3C2E
		LDWI 	1H 			//042C 	2A01
		SUBWR 	50H,0 			//042D 	0C50
		BTSS 	STATUS,0 		//042E 	1C03
		LJUMP 	435H 			//042F 	3C35

		//;TCQ-V21.C: 772: {
		//;TCQ-V21.C: 773: PA1=1;
		BSR 	5H,1 			//0430 	1885

		//;TCQ-V21.C: 774: times2=0;
		CLRR 	50H 			//0431 	0150
		CLRR 	51H 			//0432 	0151
		CLRR 	52H 			//0433 	0152
		CLRR 	53H 			//0434 	0153

		//;TCQ-V21.C: 775: }
		//;TCQ-V21.C: 776: }
		//;TCQ-V21.C: 795: if(times>=512)
		LDWI 	2H 			//0435 	2A02
		SUBWR 	5DH,0 			//0436 	0C5D
		LDWI 	0H 			//0437 	2A00
		BTSC 	STATUS,2 		//0438 	1503
		SUBWR 	5CH,0 			//0439 	0C5C
		BTSS 	STATUS,0 		//043A 	1C03
		LJUMP 	7B8H 			//043B 	3FB8
		LDWI 	8H 			//043C 	2A08

		//;TCQ-V21.C: 796: {
		//;TCQ-V21.C: 810: times=0;
		CLRR 	5CH 			//043D 	015C
		CLRR 	5DH 			//043E 	015D

		//;TCQ-V21.C: 814: SUM16+=SUM;
		INCR	5EH,1 			//043F 	09DE

		//;TCQ-V21.C: 816: if(calc_average_times>=8)
		SUBWR 	5EH,0 			//0440 	0C5E
		BTSC 	STATUS,0 		//0441 	1403

		//;TCQ-V21.C: 823: SUM16=0;
		CLRR 	5EH 			//0442 	015E

		//;TCQ-V21.C: 824: }
		//;TCQ-V21.C: 826: if(check_light_times<6)
		LDWI 	6H 			//0443 	2A06
		SUBWR 	5FH,0 			//0444 	0C5F
		BTSC 	STATUS,0 		//0445 	1403
		LJUMP 	449H 			//0446 	3C49

		//;TCQ-V21.C: 827: {
		//;TCQ-V21.C: 828: check_light_times++;
		INCR	5FH,1 			//0447 	09DF

		//;TCQ-V21.C: 829: }
		LJUMP 	47DH 			//0448 	3C7D

		//;TCQ-V21.C: 830: else
		//;TCQ-V21.C: 831: {
		//;TCQ-V21.C: 832: if(LIGHT==0)
		LDR 	55H,0 			//0449 	0855
		IORWR 	54H,0 			//044A 	0354
		BTSS 	STATUS,2 		//044B 	1D03
		LJUMP 	47DH 			//044C 	3C7D

		//;TCQ-V21.C: 833: {
		//;TCQ-V21.C: 835: light_ad=read_ad(0XB5);
		LDWI 	B5H 			//044D 	2AB5
		LCALL 	114H 			//044E 	3114
		STR 	61H 			//044F 	01E1

		//;TCQ-V21.C: 837: if((light_ad<=(light_ad0+2))&&(light_ad0<=(light_ad+2)))
		LDR 	62H,0 			//0450 	0862
		ADDWI 	2H 			//0451 	2702
		STR 	64H 			//0452 	01E4
		LDWI 	0H 			//0453 	2A00
		BTSC 	STATUS,0 		//0454 	1403
		LDWI 	1H 			//0455 	2A01
		STR 	65H 			//0456 	01E5
		XORWI 	80H 			//0457 	2680
		STR 	66H 			//0458 	01E6
		LDWI 	80H 			//0459 	2A80
		SUBWR 	66H,0 			//045A 	0C66
		BTSS 	STATUS,2 		//045B 	1D03
		LJUMP 	45FH 			//045C 	3C5F
		LDR 	61H,0 			//045D 	0861
		SUBWR 	64H,0 			//045E 	0C64
		BCR 	STATUS,5 		//045F 	1283
		BCR 	STATUS,6 		//0460 	1303
		LDR 	61H,0 			//0461 	0861
		BTSS 	STATUS,0 		//0462 	1C03
		LJUMP 	47BH 			//0463 	3C7B
		ADDWI 	2H 			//0464 	2702
		STR 	64H 			//0465 	01E4
		LDWI 	0H 			//0466 	2A00
		BTSC 	STATUS,0 		//0467 	1403
		LDWI 	1H 			//0468 	2A01
		STR 	65H 			//0469 	01E5
		XORWI 	80H 			//046A 	2680
		STR 	66H 			//046B 	01E6
		LDWI 	80H 			//046C 	2A80
		SUBWR 	66H,0 			//046D 	0C66
		BTSS 	STATUS,2 		//046E 	1D03
		LJUMP 	472H 			//046F 	3C72
		LDR 	62H,0 			//0470 	0862
		SUBWR 	64H,0 			//0471 	0C64

		//;TCQ-V21.C: 838: light_ad=light_ad0;
		BCR 	STATUS,5 		//0472 	1283
		BCR 	STATUS,6 		//0473 	1303
		BTSS 	STATUS,0 		//0474 	1C03
		LJUMP 	47AH 			//0475 	3C7A
		LDR 	62H,0 			//0476 	0862
		STR 	61H 			//0477 	01E1

		//;TCQ-V21.C: 840: light_ad0=light_ad;
		BCR 	STATUS,5 		//0478 	1283
		BCR 	STATUS,6 		//0479 	1303
		LDR 	61H,0 			//047A 	0861
		STR 	62H 			//047B 	01E2

		//;TCQ-V21.C: 842: check_light_times=0;
		CLRR 	5FH 			//047C 	015F

		//;TCQ-V21.C: 844: }
		//;TCQ-V21.C: 846: }
		//;TCQ-V21.C: 849: if(SUM0==0)SUM0=SUM1+1000;
		LDR 	37H,0 			//047D 	0837
		IORWR 	36H,0 			//047E 	0336
		IORWR 	35H,0 			//047F 	0335
		IORWR 	34H,0 			//0480 	0334
		BTSS 	STATUS,2 		//0481 	1D03
		LJUMP 	499H 			//0482 	3C99
		LDR 	3BH,0 			//0483 	083B
		STR 	37H 			//0484 	01B7
		LDR 	3AH,0 			//0485 	083A
		STR 	36H 			//0486 	01B6
		LDR 	39H,0 			//0487 	0839
		STR 	35H 			//0488 	01B5
		LDR 	38H,0 			//0489 	0838
		STR 	34H 			//048A 	01B4
		LDWI 	E8H 			//048B 	2AE8
		ADDWR 	34H,1 			//048C 	0BB4
		LDWI 	3H 			//048D 	2A03
		BTSC 	STATUS,0 		//048E 	1403
		LDWI 	4H 			//048F 	2A04
		ADDWR 	35H,1 			//0490 	0BB5
		LDWI 	0H 			//0491 	2A00
		BTSC 	STATUS,0 		//0492 	1403
		LDWI 	1H 			//0493 	2A01
		ADDWR 	36H,1 			//0494 	0BB6
		LDWI 	0H 			//0495 	2A00
		BTSC 	STATUS,0 		//0496 	1403
		LDWI 	1H 			//0497 	2A01
		ADDWR 	37H,1 			//0498 	0BB7

		//;TCQ-V21.C: 852: if(SUM1_counter==0)
		LDR 	7DH,1 			//0499 	08FD
		BTSS 	STATUS,2 		//049A 	1D03
		LJUMP 	4D0H 			//049B 	3CD0

		//;TCQ-V21.C: 853: {
		//;TCQ-V21.C: 854: SUM10=SUM1;
		LDR 	3BH,0 			//049C 	083B
		STR 	3FH 			//049D 	01BF
		LDR 	3AH,0 			//049E 	083A
		STR 	3EH 			//049F 	01BE
		LDR 	39H,0 			//04A0 	0839
		STR 	3DH 			//04A1 	01BD
		LDR 	38H,0 			//04A2 	0838
		STR 	3CH 			//04A3 	01BC

		//;TCQ-V21.C: 855: MAX_DELTA=SUM10/6;
		LDWI 	6H 			//04A4 	2A06
		STR 	70H 			//04A5 	01F0
		CLRR 	71H 			//04A6 	0171
		CLRR 	72H 			//04A7 	0172
		CLRR 	73H 			//04A8 	0173
		LDR 	3FH,0 			//04A9 	083F
		STR 	77H 			//04AA 	01F7
		LDR 	3EH,0 			//04AB 	083E
		STR 	76H 			//04AC 	01F6
		LDR 	3DH,0 			//04AD 	083D
		STR 	75H 			//04AE 	01F5
		LDR 	3CH,0 			//04AF 	083C
		STR 	74H 			//04B0 	01F4
		LCALL 	185H 			//04B1 	3185
		LDR 	73H,0 			//04B2 	0873
		STR 	27H 			//04B3 	01A7
		LDR 	72H,0 			//04B4 	0872
		STR 	26H 			//04B5 	01A6
		LDR 	71H,0 			//04B6 	0871
		STR 	25H 			//04B7 	01A5
		LDR 	70H,0 			//04B8 	0870
		STR 	24H 			//04B9 	01A4

		//;TCQ-V21.C: 856: if(MAX_DELTA<4000)MAX_DELTA=4000;
		LDWI 	0H 			//04BA 	2A00
		SUBWR 	27H,0 			//04BB 	0C27
		BTSS 	STATUS,2 		//04BC 	1D03
		LJUMP 	4C8H 			//04BD 	3CC8
		LDWI 	0H 			//04BE 	2A00
		SUBWR 	26H,0 			//04BF 	0C26
		BTSS 	STATUS,2 		//04C0 	1D03
		LJUMP 	4C8H 			//04C1 	3CC8
		LDWI 	FH 			//04C2 	2A0F
		SUBWR 	25H,0 			//04C3 	0C25
		BTSS 	STATUS,2 		//04C4 	1D03
		LJUMP 	4C8H 			//04C5 	3CC8
		LDWI 	A0H 			//04C6 	2AA0
		SUBWR 	24H,0 			//04C7 	0C24
		BTSC 	STATUS,0 		//04C8 	1403
		LJUMP 	4D0H 			//04C9 	3CD0
		LDWI 	FH 			//04CA 	2A0F
		CLRR 	27H 			//04CB 	0127
		CLRR 	26H 			//04CC 	0126
		STR 	25H 			//04CD 	01A5
		LDWI 	A0H 			//04CE 	2AA0
		STR 	24H 			//04CF 	01A4

		//;TCQ-V21.C: 857: }
		//;TCQ-V21.C: 859: if((SUM10<(SUM1+MAX_DELTA))&&(SUM1<(SUM10+MAX_DELTA)))
		LDR 	38H,0 			//04D0 	0838
		ADDWR 	24H,0 			//04D1 	0B24
		STR 	64H 			//04D2 	01E4
		LDWI 	0H 			//04D3 	2A00
		BTSC 	STATUS,0 		//04D4 	1403
		LDWI 	1H 			//04D5 	2A01
		ADDWR 	39H,0 			//04D6 	0B39
		CLRR 	66H 			//04D7 	0166
		BTSC 	STATUS,0 		//04D8 	1403
		INCR	66H,1 			//04D9 	09E6
		ADDWR 	25H,0 			//04DA 	0B25
		STR 	65H 			//04DB 	01E5
		BTSC 	STATUS,0 		//04DC 	1403
		INCR	66H,1 			//04DD 	09E6
		LDR 	3AH,0 			//04DE 	083A
		ADDWR 	66H,0 			//04DF 	0B66
		CLRR 	67H 			//04E0 	0167
		BTSC 	STATUS,0 		//04E1 	1403
		INCR	67H,1 			//04E2 	09E7
		ADDWR 	26H,0 			//04E3 	0B26
		STR 	66H 			//04E4 	01E6
		BTSC 	STATUS,0 		//04E5 	1403
		INCR	67H,1 			//04E6 	09E7
		LDR 	3BH,0 			//04E7 	083B
		ADDWR 	67H,0 			//04E8 	0B67
		ADDWR 	27H,0 			//04E9 	0B27
		STR 	67H 			//04EA 	01E7
		SUBWR 	3FH,0 			//04EB 	0C3F
		BTSS 	STATUS,2 		//04EC 	1D03
		LJUMP 	4F8H 			//04ED 	3CF8
		LDR 	66H,0 			//04EE 	0866
		SUBWR 	3EH,0 			//04EF 	0C3E
		BTSS 	STATUS,2 		//04F0 	1D03
		LJUMP 	4F8H 			//04F1 	3CF8
		LDR 	65H,0 			//04F2 	0865
		SUBWR 	3DH,0 			//04F3 	0C3D
		BTSS 	STATUS,2 		//04F4 	1D03
		LJUMP 	4F8H 			//04F5 	3CF8
		LDR 	64H,0 			//04F6 	0864
		SUBWR 	3CH,0 			//04F7 	0C3C
		BTSC 	STATUS,0 		//04F8 	1403
		LJUMP 	604H 			//04F9 	3E04
		LDR 	3CH,0 			//04FA 	083C
		ADDWR 	24H,0 			//04FB 	0B24
		STR 	64H 			//04FC 	01E4
		LDWI 	0H 			//04FD 	2A00
		BTSC 	STATUS,0 		//04FE 	1403
		LDWI 	1H 			//04FF 	2A01
		ADDWR 	3DH,0 			//0500 	0B3D
		CLRR 	66H 			//0501 	0166
		BTSC 	STATUS,0 		//0502 	1403
		INCR	66H,1 			//0503 	09E6
		ADDWR 	25H,0 			//0504 	0B25
		STR 	65H 			//0505 	01E5
		BTSC 	STATUS,0 		//0506 	1403
		INCR	66H,1 			//0507 	09E6
		LDR 	3EH,0 			//0508 	083E
		ADDWR 	66H,0 			//0509 	0B66
		CLRR 	67H 			//050A 	0167
		BTSC 	STATUS,0 		//050B 	1403
		INCR	67H,1 			//050C 	09E7
		ADDWR 	26H,0 			//050D 	0B26
		STR 	66H 			//050E 	01E6
		BTSC 	STATUS,0 		//050F 	1403
		INCR	67H,1 			//0510 	09E7
		LDR 	3FH,0 			//0511 	083F
		ADDWR 	67H,0 			//0512 	0B67
		ADDWR 	27H,0 			//0513 	0B27
		STR 	67H 			//0514 	01E7
		SUBWR 	3BH,0 			//0515 	0C3B
		BTSS 	STATUS,2 		//0516 	1D03
		LJUMP 	522H 			//0517 	3D22
		LDR 	66H,0 			//0518 	0866
		SUBWR 	3AH,0 			//0519 	0C3A
		BTSS 	STATUS,2 		//051A 	1D03
		LJUMP 	522H 			//051B 	3D22
		LDR 	65H,0 			//051C 	0865
		SUBWR 	39H,0 			//051D 	0C39
		BTSS 	STATUS,2 		//051E 	1D03
		LJUMP 	522H 			//051F 	3D22
		LDR 	64H,0 			//0520 	0864
		SUBWR 	38H,0 			//0521 	0C38
		BTSC 	STATUS,0 		//0522 	1403
		LJUMP 	604H 			//0523 	3E04

		//;TCQ-V21.C: 860: {
		//;TCQ-V21.C: 861: SUM1_counter++;
		INCR	7DH,1 			//0524 	09FD

		//;TCQ-V21.C: 862: ALL_SUM1+=SUM1;
		LDR 	38H,0 			//0525 	0838
		ADDWR 	20H,1 			//0526 	0BA0
		LDR 	39H,0 			//0527 	0839
		BCR 	STATUS,2 		//0528 	1103
		BTSC 	STATUS,0 		//0529 	1403
		ADDWI 	1H 			//052A 	2701
		BTSS 	STATUS,2 		//052B 	1D03
		ADDWR 	21H,1 			//052C 	0BA1
		LDR 	3AH,0 			//052D 	083A
		BCR 	STATUS,2 		//052E 	1103
		BTSC 	STATUS,0 		//052F 	1403
		ADDWI 	1H 			//0530 	2701
		BTSS 	STATUS,2 		//0531 	1D03
		ADDWR 	22H,1 			//0532 	0BA2
		LDR 	3BH,0 			//0533 	083B
		BCR 	STATUS,2 		//0534 	1103
		BTSC 	STATUS,0 		//0535 	1403
		ADDWI 	1H 			//0536 	2701
		BTSS 	STATUS,2 		//0537 	1D03
		ADDWR 	23H,1 			//0538 	0BA3

		//;TCQ-V21.C: 863: SUM10=ALL_SUM1/SUM1_counter;
		LDR 	7DH,0 			//0539 	087D
		STR 	70H 			//053A 	01F0
		CLRR 	71H 			//053B 	0171
		CLRR 	72H 			//053C 	0172
		CLRR 	73H 			//053D 	0173
		LDR 	23H,0 			//053E 	0823
		STR 	77H 			//053F 	01F7
		LDR 	22H,0 			//0540 	0822
		STR 	76H 			//0541 	01F6
		LDR 	21H,0 			//0542 	0821
		STR 	75H 			//0543 	01F5
		LDR 	20H,0 			//0544 	0820
		STR 	74H 			//0545 	01F4
		LCALL 	185H 			//0546 	3185
		LDR 	73H,0 			//0547 	0873
		STR 	3FH 			//0548 	01BF
		LDR 	72H,0 			//0549 	0872
		STR 	3EH 			//054A 	01BE
		LDR 	71H,0 			//054B 	0871
		STR 	3DH 			//054C 	01BD
		LDR 	70H,0 			//054D 	0870
		STR 	3CH 			//054E 	01BC

		//;TCQ-V21.C: 864: MAX_DELTA=SUM10/6;
		LDWI 	6H 			//054F 	2A06
		STR 	70H 			//0550 	01F0
		CLRR 	71H 			//0551 	0171
		CLRR 	72H 			//0552 	0172
		CLRR 	73H 			//0553 	0173
		LDR 	3FH,0 			//0554 	083F
		STR 	77H 			//0555 	01F7
		LDR 	3EH,0 			//0556 	083E
		STR 	76H 			//0557 	01F6
		LDR 	3DH,0 			//0558 	083D
		STR 	75H 			//0559 	01F5
		LDR 	3CH,0 			//055A 	083C
		STR 	74H 			//055B 	01F4
		LCALL 	185H 			//055C 	3185
		LDR 	73H,0 			//055D 	0873
		STR 	27H 			//055E 	01A7
		LDR 	72H,0 			//055F 	0872
		STR 	26H 			//0560 	01A6
		LDR 	71H,0 			//0561 	0871
		STR 	25H 			//0562 	01A5
		LDR 	70H,0 			//0563 	0870
		STR 	24H 			//0564 	01A4

		//;TCQ-V21.C: 865: if(MAX_DELTA<4000)MAX_DELTA=4000;
		LDWI 	0H 			//0565 	2A00
		SUBWR 	27H,0 			//0566 	0C27
		BTSS 	STATUS,2 		//0567 	1D03
		LJUMP 	573H 			//0568 	3D73
		LDWI 	0H 			//0569 	2A00
		SUBWR 	26H,0 			//056A 	0C26
		BTSS 	STATUS,2 		//056B 	1D03
		LJUMP 	573H 			//056C 	3D73
		LDWI 	FH 			//056D 	2A0F
		SUBWR 	25H,0 			//056E 	0C25
		BTSS 	STATUS,2 		//056F 	1D03
		LJUMP 	573H 			//0570 	3D73
		LDWI 	A0H 			//0571 	2AA0
		SUBWR 	24H,0 			//0572 	0C24
		BTSC 	STATUS,0 		//0573 	1403
		LJUMP 	57BH 			//0574 	3D7B
		LDWI 	FH 			//0575 	2A0F
		CLRR 	27H 			//0576 	0127
		CLRR 	26H 			//0577 	0126
		STR 	25H 			//0578 	01A5
		LDWI 	A0H 			//0579 	2AA0
		STR 	24H 			//057A 	01A4

		//;TCQ-V21.C: 867: if(SUM0>SUM10)
		LDR 	37H,0 			//057B 	0837
		SUBWR 	3FH,0 			//057C 	0C3F
		BTSS 	STATUS,2 		//057D 	1D03
		LJUMP 	589H 			//057E 	3D89
		LDR 	36H,0 			//057F 	0836
		SUBWR 	3EH,0 			//0580 	0C3E
		BTSS 	STATUS,2 		//0581 	1D03
		LJUMP 	589H 			//0582 	3D89
		LDR 	35H,0 			//0583 	0835
		SUBWR 	3DH,0 			//0584 	0C3D
		BTSS 	STATUS,2 		//0585 	1D03
		LJUMP 	589H 			//0586 	3D89
		LDR 	34H,0 			//0587 	0834
		SUBWR 	3CH,0 			//0588 	0C3C
		BTSC 	STATUS,0 		//0589 	1403
		LJUMP 	5C5H 			//058A 	3DC5

		//;TCQ-V21.C: 868: {
		//;TCQ-V21.C: 869: SUM=SUM0-SUM10;
		LDR 	37H,0 			//058B 	0837
		STR 	33H 			//058C 	01B3
		LDR 	36H,0 			//058D 	0836
		STR 	32H 			//058E 	01B2
		LDR 	35H,0 			//058F 	0835
		STR 	31H 			//0590 	01B1
		LDR 	34H,0 			//0591 	0834
		STR 	30H 			//0592 	01B0
		LDR 	3CH,0 			//0593 	083C
		SUBWR 	30H,1 			//0594 	0CB0
		LDR 	3DH,0 			//0595 	083D
		BTSS 	STATUS,0 		//0596 	1C03
		INCRSZ 	3DH,0 		//0597 	0A3D
		SUBWR 	31H,1 			//0598 	0CB1
		LDR 	3EH,0 			//0599 	083E
		BTSS 	STATUS,0 		//059A 	1C03
		INCRSZ 	3EH,0 		//059B 	0A3E
		SUBWR 	32H,1 			//059C 	0CB2
		LDR 	3FH,0 			//059D 	083F
		BTSS 	STATUS,0 		//059E 	1C03
		INCRSZ 	3FH,0 		//059F 	0A3F
		SUBWR 	33H,1 			//05A0 	0CB3

		//;TCQ-V21.C: 870: if(SUM>30000)SUM0_num=2;
		LDWI 	0H 			//05A1 	2A00
		SUBWR 	33H,0 			//05A2 	0C33
		BTSS 	STATUS,2 		//05A3 	1D03
		LJUMP 	5AFH 			//05A4 	3DAF
		LDWI 	0H 			//05A5 	2A00
		SUBWR 	32H,0 			//05A6 	0C32
		BTSS 	STATUS,2 		//05A7 	1D03
		LJUMP 	5AFH 			//05A8 	3DAF
		LDWI 	75H 			//05A9 	2A75
		SUBWR 	31H,0 			//05AA 	0C31
		BTSS 	STATUS,2 		//05AB 	1D03
		LJUMP 	5AFH 			//05AC 	3DAF
		LDWI 	31H 			//05AD 	2A31
		SUBWR 	30H,0 			//05AE 	0C30
		BTSS 	STATUS,0 		//05AF 	1C03
		LJUMP 	5B3H 			//05B0 	3DB3
		LDWI 	2H 			//05B1 	2A02
		LJUMP 	5C6H 			//05B2 	3DC6

		//;TCQ-V21.C: 871: else if(SUM>8000)SUM0_num=4;
		LDWI 	0H 			//05B3 	2A00
		SUBWR 	33H,0 			//05B4 	0C33
		BTSS 	STATUS,2 		//05B5 	1D03
		LJUMP 	5C1H 			//05B6 	3DC1
		LDWI 	0H 			//05B7 	2A00
		SUBWR 	32H,0 			//05B8 	0C32
		BTSS 	STATUS,2 		//05B9 	1D03
		LJUMP 	5C1H 			//05BA 	3DC1
		LDWI 	1FH 			//05BB 	2A1F
		SUBWR 	31H,0 			//05BC 	0C31
		BTSS 	STATUS,2 		//05BD 	1D03
		LJUMP 	5C1H 			//05BE 	3DC1
		LDWI 	41H 			//05BF 	2A41
		SUBWR 	30H,0 			//05C0 	0C30
		BTSS 	STATUS,0 		//05C1 	1C03
		LJUMP 	5C5H 			//05C2 	3DC5
		LDWI 	4H 			//05C3 	2A04
		LJUMP 	5C6H 			//05C4 	3DC6

		//;TCQ-V21.C: 872: else SUM0_num=16;
		LDWI 	10H 			//05C5 	2A10
		STR 	68H 			//05C6 	01E8

		//;TCQ-V21.C: 877: }
		//;TCQ-V21.C: 878: if((SUM1_counter>=SUM0_num)&&(SUM10<SUM0))
		SUBWR 	7DH,0 			//05C7 	0C7D
		BTSS 	STATUS,0 		//05C8 	1C03
		LJUMP 	60AH 			//05C9 	3E0A
		LDR 	37H,0 			//05CA 	0837
		SUBWR 	3FH,0 			//05CB 	0C3F
		BTSS 	STATUS,2 		//05CC 	1D03
		LJUMP 	5D8H 			//05CD 	3DD8
		LDR 	36H,0 			//05CE 	0836
		SUBWR 	3EH,0 			//05CF 	0C3E
		BTSS 	STATUS,2 		//05D0 	1D03
		LJUMP 	5D8H 			//05D1 	3DD8
		LDR 	35H,0 			//05D2 	0835
		SUBWR 	3DH,0 			//05D3 	0C3D
		BTSS 	STATUS,2 		//05D4 	1D03
		LJUMP 	5D8H 			//05D5 	3DD8
		LDR 	34H,0 			//05D6 	0834
		SUBWR 	3CH,0 			//05D7 	0C3C
		BTSC 	STATUS,0 		//05D8 	1403
		LJUMP 	60AH 			//05D9 	3E0A

		//;TCQ-V21.C: 879: {
		//;TCQ-V21.C: 880: if(SUM1_num>16)
		LDWI 	11H 			//05DA 	2A11
		SUBWR 	69H,0 			//05DB 	0C69
		BTSS 	STATUS,0 		//05DC 	1C03
		LJUMP 	708H 			//05DD 	3F08

		//;TCQ-V21.C: 881: {
		//;TCQ-V21.C: 882: if(SUM0_num<=8)SUM0=SUM10;
		LDWI 	9H 			//05DE 	2A09
		SUBWR 	68H,0 			//05DF 	0C68
		BTSC 	STATUS,0 		//05E0 	1403
		LJUMP 	5EBH 			//05E1 	3DEB
		LDR 	3FH,0 			//05E2 	083F
		STR 	37H 			//05E3 	01B7
		LDR 	3EH,0 			//05E4 	083E
		STR 	36H 			//05E5 	01B6
		LDR 	3DH,0 			//05E6 	083D
		STR 	35H 			//05E7 	01B5
		LDR 	3CH,0 			//05E8 	083C
		STR 	34H 			//05E9 	01B4
		LJUMP 	604H 			//05EA 	3E04

		//;TCQ-V21.C: 883: else
		//;TCQ-V21.C: 884: {
		//;TCQ-V21.C: 885: SUM0+=SUM10;
		LDR 	3CH,0 			//05EB 	083C
		ADDWR 	34H,1 			//05EC 	0BB4
		LDR 	3DH,0 			//05ED 	083D
		BCR 	STATUS,2 		//05EE 	1103
		BTSC 	STATUS,0 		//05EF 	1403
		ADDWI 	1H 			//05F0 	2701
		BTSS 	STATUS,2 		//05F1 	1D03
		ADDWR 	35H,1 			//05F2 	0BB5
		LDR 	3EH,0 			//05F3 	083E
		BCR 	STATUS,2 		//05F4 	1103
		BTSC 	STATUS,0 		//05F5 	1403
		ADDWI 	1H 			//05F6 	2701
		BTSS 	STATUS,2 		//05F7 	1D03
		ADDWR 	36H,1 			//05F8 	0BB6
		LDR 	3FH,0 			//05F9 	083F
		BCR 	STATUS,2 		//05FA 	1103
		BTSC 	STATUS,0 		//05FB 	1403
		ADDWI 	1H 			//05FC 	2701
		BTSS 	STATUS,2 		//05FD 	1D03
		ADDWR 	37H,1 			//05FE 	0BB7

		//;TCQ-V21.C: 886: SUM0/=2;
		BCR 	STATUS,0 		//05FF 	1003
		RRR	37H,1 			//0600 	06B7
		RRR	36H,1 			//0601 	06B6
		RRR	35H,1 			//0602 	06B5
		RRR	34H,1 			//0603 	06B4

		//;TCQ-V21.C: 887: }
		//;TCQ-V21.C: 888: SUM1_counter=0;
		CLRR 	7DH 			//0604 	017D

		//;TCQ-V21.C: 889: ALL_SUM1=0;
		CLRR 	20H 			//0605 	0120
		CLRR 	21H 			//0606 	0121
		CLRR 	22H 			//0607 	0122
		CLRR 	23H 			//0608 	0123
		LJUMP 	708H 			//0609 	3F08

		//;TCQ-V21.C: 894: else if(SUM1_counter>=SUM1_num)
		LDR 	69H,0 			//060A 	0869
		SUBWR 	7DH,0 			//060B 	0C7D
		BTSS 	STATUS,0 		//060C 	1C03
		LJUMP 	708H 			//060D 	3F08

		//;TCQ-V21.C: 895: {
		//;TCQ-V21.C: 897: if(SUM0>SUM10)
		LDR 	37H,0 			//060E 	0837
		SUBWR 	3FH,0 			//060F 	0C3F
		BTSS 	STATUS,2 		//0610 	1D03
		LJUMP 	61CH 			//0611 	3E1C
		LDR 	36H,0 			//0612 	0836
		SUBWR 	3EH,0 			//0613 	0C3E
		BTSS 	STATUS,2 		//0614 	1D03
		LJUMP 	61CH 			//0615 	3E1C
		LDR 	35H,0 			//0616 	0835
		SUBWR 	3DH,0 			//0617 	0C3D
		BTSS 	STATUS,2 		//0618 	1D03
		LJUMP 	61CH 			//0619 	3E1C
		LDR 	34H,0 			//061A 	0834
		SUBWR 	3CH,0 			//061B 	0C3C
		BTSC 	STATUS,0 		//061C 	1403
		LJUMP 	62BH 			//061D 	3E2B

		//;TCQ-V21.C: 898: {
		//;TCQ-V21.C: 899: if(SUM1_num>16)SUM0=SUM10;
		LDWI 	11H 			//061E 	2A11
		SUBWR 	69H,0 			//061F 	0C69
		BTSS 	STATUS,0 		//0620 	1C03
		LJUMP 	704H 			//0621 	3F04
		LDR 	3FH,0 			//0622 	083F
		STR 	37H 			//0623 	01B7
		LDR 	3EH,0 			//0624 	083E
		STR 	36H 			//0625 	01B6
		LDR 	3DH,0 			//0626 	083D
		STR 	35H 			//0627 	01B5
		LDR 	3CH,0 			//0628 	083C
		STR 	34H 			//0629 	01B4

		//;TCQ-V21.C: 900: }
		LJUMP 	704H 			//062A 	3F04

		//;TCQ-V21.C: 901: else if(SUM10>(SUM0+2000))
		LDWI 	D0H 			//062B 	2AD0
		STR 	64H 			//062C 	01E4
		LDWI 	7H 			//062D 	2A07
		STR 	65H 			//062E 	01E5
		CLRR 	66H 			//062F 	0166
		CLRR 	67H 			//0630 	0167
		LDR 	34H,0 			//0631 	0834
		ADDWR 	64H,1 			//0632 	0BE4
		LDR 	35H,0 			//0633 	0835
		BTSC 	STATUS,0 		//0634 	1403
		INCRSZ 	35H,0 		//0635 	0A35
		ADDWR 	65H,1 			//0636 	0BE5
		LDR 	36H,0 			//0637 	0836
		BTSC 	STATUS,0 		//0638 	1403
		INCRSZ 	36H,0 		//0639 	0A36
		ADDWR 	66H,1 			//063A 	0BE6
		LDR 	37H,0 			//063B 	0837
		BTSC 	STATUS,0 		//063C 	1403
		INCR	37H,0 			//063D 	0937
		ADDWR 	67H,1 			//063E 	0BE7
		LDR 	3FH,0 			//063F 	083F
		SUBWR 	67H,0 			//0640 	0C67
		BTSS 	STATUS,2 		//0641 	1D03
		LJUMP 	64DH 			//0642 	3E4D
		LDR 	3EH,0 			//0643 	083E
		SUBWR 	66H,0 			//0644 	0C66
		BTSS 	STATUS,2 		//0645 	1D03
		LJUMP 	64DH 			//0646 	3E4D
		LDR 	3DH,0 			//0647 	083D
		SUBWR 	65H,0 			//0648 	0C65
		BTSS 	STATUS,2 		//0649 	1D03
		LJUMP 	64DH 			//064A 	3E4D
		LDR 	3CH,0 			//064B 	083C
		SUBWR 	64H,0 			//064C 	0C64
		BTSC 	STATUS,0 		//064D 	1403
		LJUMP 	6CDH 			//064E 	3ECD

		//;TCQ-V21.C: 902: {
		//;TCQ-V21.C: 903: SUM=SUM10-SUM0;
		LDR 	3FH,0 			//064F 	083F
		STR 	33H 			//0650 	01B3
		LDR 	3EH,0 			//0651 	083E
		STR 	32H 			//0652 	01B2
		LDR 	3DH,0 			//0653 	083D
		STR 	31H 			//0654 	01B1
		LDR 	3CH,0 			//0655 	083C
		STR 	30H 			//0656 	01B0
		LDR 	34H,0 			//0657 	0834
		SUBWR 	30H,1 			//0658 	0CB0
		LDR 	35H,0 			//0659 	0835
		BTSS 	STATUS,0 		//065A 	1C03
		INCRSZ 	35H,0 		//065B 	0A35
		SUBWR 	31H,1 			//065C 	0CB1
		LDR 	36H,0 			//065D 	0836
		BTSS 	STATUS,0 		//065E 	1C03
		INCRSZ 	36H,0 		//065F 	0A36
		SUBWR 	32H,1 			//0660 	0CB2
		LDR 	37H,0 			//0661 	0837
		BTSS 	STATUS,0 		//0662 	1C03
		INCRSZ 	37H,0 		//0663 	0A37
		SUBWR 	33H,1 			//0664 	0CB3

		//;TCQ-V21.C: 905: if((SUM10<2000000)&&(SUM<100000))
		LDWI 	0H 			//0665 	2A00
		SUBWR 	3FH,0 			//0666 	0C3F
		BTSS 	STATUS,2 		//0667 	1D03
		LJUMP 	673H 			//0668 	3E73
		LDWI 	1EH 			//0669 	2A1E
		SUBWR 	3EH,0 			//066A 	0C3E
		BTSS 	STATUS,2 		//066B 	1D03
		LJUMP 	673H 			//066C 	3E73
		LDWI 	84H 			//066D 	2A84
		SUBWR 	3DH,0 			//066E 	0C3D
		BTSS 	STATUS,2 		//066F 	1D03
		LJUMP 	673H 			//0670 	3E73
		LDWI 	80H 			//0671 	2A80
		SUBWR 	3CH,0 			//0672 	0C3C
		BTSC 	STATUS,0 		//0673 	1403
		LJUMP 	704H 			//0674 	3F04
		LDWI 	0H 			//0675 	2A00
		SUBWR 	33H,0 			//0676 	0C33
		BTSS 	STATUS,2 		//0677 	1D03
		LJUMP 	683H 			//0678 	3E83
		LDWI 	1H 			//0679 	2A01
		SUBWR 	32H,0 			//067A 	0C32
		BTSS 	STATUS,2 		//067B 	1D03
		LJUMP 	683H 			//067C 	3E83
		LDWI 	86H 			//067D 	2A86
		SUBWR 	31H,0 			//067E 	0C31
		BTSS 	STATUS,2 		//067F 	1D03
		LJUMP 	683H 			//0680 	3E83
		LDWI 	A0H 			//0681 	2AA0
		SUBWR 	30H,0 			//0682 	0C30

		//;TCQ-V21.C: 907: {
		//;TCQ-V21.C: 908: if(SUM1_num==32)
		LDR 	69H,0 			//0683 	0869
		BTSC 	STATUS,0 		//0684 	1403
		LJUMP 	705H 			//0685 	3F05
		XORWI 	20H 			//0686 	2620
		BTSS 	STATUS,2 		//0687 	1D03
		LJUMP 	6A3H 			//0688 	3EA3

		//;TCQ-V21.C: 909: {
		//;TCQ-V21.C: 910: SUM0+=SUM10;
		LDR 	3CH,0 			//0689 	083C
		ADDWR 	34H,1 			//068A 	0BB4
		LDR 	3DH,0 			//068B 	083D
		BCR 	STATUS,2 		//068C 	1103
		BTSC 	STATUS,0 		//068D 	1403
		ADDWI 	1H 			//068E 	2701
		BTSS 	STATUS,2 		//068F 	1D03
		ADDWR 	35H,1 			//0690 	0BB5
		LDR 	3EH,0 			//0691 	083E
		BCR 	STATUS,2 		//0692 	1103
		BTSC 	STATUS,0 		//0693 	1403
		ADDWI 	1H 			//0694 	2701
		BTSS 	STATUS,2 		//0695 	1D03
		ADDWR 	36H,1 			//0696 	0BB6
		LDR 	3FH,0 			//0697 	083F
		BCR 	STATUS,2 		//0698 	1103
		BTSC 	STATUS,0 		//0699 	1403
		ADDWI 	1H 			//069A 	2701
		BTSS 	STATUS,2 		//069B 	1D03
		ADDWR 	37H,1 			//069C 	0BB7

		//;TCQ-V21.C: 911: SUM0/=2;
		BCR 	STATUS,0 		//069D 	1003
		RRR	37H,1 			//069E 	06B7
		RRR	36H,1 			//069F 	06B6
		RRR	35H,1 			//06A0 	06B5
		RRR	34H,1 			//06A1 	06B4

		//;TCQ-V21.C: 912: }
		LJUMP 	704H 			//06A2 	3F04

		//;TCQ-V21.C: 913: else
		//;TCQ-V21.C: 914: {
		//;TCQ-V21.C: 915: if(SUM>50000)SUM1_num=16;
		LDWI 	0H 			//06A3 	2A00
		SUBWR 	33H,0 			//06A4 	0C33
		BTSS 	STATUS,2 		//06A5 	1D03
		LJUMP 	6B1H 			//06A6 	3EB1
		LDWI 	0H 			//06A7 	2A00
		SUBWR 	32H,0 			//06A8 	0C32
		BTSS 	STATUS,2 		//06A9 	1D03
		LJUMP 	6B1H 			//06AA 	3EB1
		LDWI 	C3H 			//06AB 	2AC3
		SUBWR 	31H,0 			//06AC 	0C31
		BTSS 	STATUS,2 		//06AD 	1D03
		LJUMP 	6B1H 			//06AE 	3EB1
		LDWI 	51H 			//06AF 	2A51
		SUBWR 	30H,0 			//06B0 	0C30
		BTSS 	STATUS,0 		//06B1 	1C03
		LJUMP 	6B5H 			//06B2 	3EB5
		LDWI 	10H 			//06B3 	2A10
		LJUMP 	6C8H 			//06B4 	3EC8

		//;TCQ-V21.C: 916: else if(SUM>20000)SUM1_num=8;
		LDWI 	0H 			//06B5 	2A00
		SUBWR 	33H,0 			//06B6 	0C33
		BTSS 	STATUS,2 		//06B7 	1D03
		LJUMP 	6C3H 			//06B8 	3EC3
		LDWI 	0H 			//06B9 	2A00
		SUBWR 	32H,0 			//06BA 	0C32
		BTSS 	STATUS,2 		//06BB 	1D03
		LJUMP 	6C3H 			//06BC 	3EC3
		LDWI 	4EH 			//06BD 	2A4E
		SUBWR 	31H,0 			//06BE 	0C31
		BTSS 	STATUS,2 		//06BF 	1D03
		LJUMP 	6C3H 			//06C0 	3EC3
		LDWI 	21H 			//06C1 	2A21
		SUBWR 	30H,0 			//06C2 	0C30
		BTSS 	STATUS,0 		//06C3 	1C03
		LJUMP 	6C7H 			//06C4 	3EC7
		LDWI 	8H 			//06C5 	2A08
		LJUMP 	6C8H 			//06C6 	3EC8

		//;TCQ-V21.C: 917: else SUM1_num=4;
		LDWI 	4H 			//06C7 	2A04
		STR 	69H 			//06C8 	01E9

		//;TCQ-V21.C: 918: if(SUM1_counter>=SUM1_num)
		SUBWR 	7DH,0 			//06C9 	0C7D
		BTSC 	STATUS,0 		//06CA 	1403
		LJUMP 	689H 			//06CB 	3E89
		LJUMP 	704H 			//06CC 	3F04

		//;TCQ-V21.C: 926: else if((LIGHT>0)&&(TH==12000))
		LDR 	55H,0 			//06CD 	0855
		IORWR 	54H,0 			//06CE 	0354
		BTSC 	STATUS,2 		//06CF 	1503
		LJUMP 	704H 			//06D0 	3F04
		LDR 	45H,0 			//06D1 	0845
		XORWI 	2EH 			//06D2 	262E
		LDWI 	E0H 			//06D3 	2AE0
		BTSC 	STATUS,2 		//06D4 	1503
		XORWR 	44H,0 			//06D5 	0444
		IORWR 	46H,0 			//06D6 	0346
		IORWR 	47H,0 			//06D7 	0347
		BTSS 	STATUS,2 		//06D8 	1D03
		LJUMP 	704H 			//06D9 	3F04

		//;TCQ-V21.C: 927: {
		//;TCQ-V21.C: 928: SUM=SUM10-SUM0;
		LDR 	3FH,0 			//06DA 	083F
		STR 	33H 			//06DB 	01B3
		LDR 	3EH,0 			//06DC 	083E
		STR 	32H 			//06DD 	01B2
		LDR 	3DH,0 			//06DE 	083D
		STR 	31H 			//06DF 	01B1
		LDR 	3CH,0 			//06E0 	083C
		STR 	30H 			//06E1 	01B0
		LDR 	34H,0 			//06E2 	0834
		SUBWR 	30H,1 			//06E3 	0CB0
		LDR 	35H,0 			//06E4 	0835
		BTSS 	STATUS,0 		//06E5 	1C03
		INCRSZ 	35H,0 		//06E6 	0A35
		SUBWR 	31H,1 			//06E7 	0CB1
		LDR 	36H,0 			//06E8 	0836
		BTSS 	STATUS,0 		//06E9 	1C03
		INCRSZ 	36H,0 		//06EA 	0A36
		SUBWR 	32H,1 			//06EB 	0CB2
		LDR 	37H,0 			//06EC 	0837
		BTSS 	STATUS,0 		//06ED 	1C03
		INCRSZ 	37H,0 		//06EE 	0A37
		SUBWR 	33H,1 			//06EF 	0CB3

		//;TCQ-V21.C: 929: TH+=SUM;
		LDR 	30H,0 			//06F0 	0830
		ADDWR 	44H,1 			//06F1 	0BC4
		LDR 	31H,0 			//06F2 	0831
		BCR 	STATUS,2 		//06F3 	1103
		BTSC 	STATUS,0 		//06F4 	1403
		ADDWI 	1H 			//06F5 	2701
		BTSS 	STATUS,2 		//06F6 	1D03
		ADDWR 	45H,1 			//06F7 	0BC5
		LDR 	32H,0 			//06F8 	0832
		BCR 	STATUS,2 		//06F9 	1103
		BTSC 	STATUS,0 		//06FA 	1403
		ADDWI 	1H 			//06FB 	2701
		BTSS 	STATUS,2 		//06FC 	1D03
		ADDWR 	46H,1 			//06FD 	0BC6
		LDR 	33H,0 			//06FE 	0833
		BCR 	STATUS,2 		//06FF 	1103
		BTSC 	STATUS,0 		//0700 	1403
		ADDWI 	1H 			//0701 	2701
		BTSS 	STATUS,2 		//0702 	1D03
		ADDWR 	47H,1 			//0703 	0BC7

		//;TCQ-V21.C: 930: }
		//;TCQ-V21.C: 932: if(SUM1_counter>=SUM1_num)
		LDR 	69H,0 			//0704 	0869
		SUBWR 	7DH,0 			//0705 	0C7D
		BTSC 	STATUS,0 		//0706 	1403
		LJUMP 	604H 			//0707 	3E04

		//;TCQ-V21.C: 936: }
		//;TCQ-V21.C: 937: }
		//;TCQ-V21.C: 938: }
		//;TCQ-V21.C: 943: }
		//;TCQ-V21.C: 950: if(stop_times>0)
		LDR 	63H,0 			//0708 	0863
		BTSC 	STATUS,2 		//0709 	1503
		LJUMP 	70DH 			//070A 	3F0D

		//;TCQ-V21.C: 951: {
		//;TCQ-V21.C: 952: stop_times--;
		DECR 	63H,1 			//070B 	0DE3

		//;TCQ-V21.C: 953: }
		LJUMP 	7B3H 			//070C 	3FB3

		//;TCQ-V21.C: 954: else
		//;TCQ-V21.C: 955: {
		//;TCQ-V21.C: 957: if(start_times>0)
		LDR 	59H,0 			//070D 	0859
		IORWR 	58H,0 			//070E 	0358
		BTSC 	STATUS,2 		//070F 	1503
		LJUMP 	77DH 			//0710 	3F7D

		//;TCQ-V21.C: 958: {
		//;TCQ-V21.C: 959: if(start_times<70)
		LDWI 	0H 			//0711 	2A00
		SUBWR 	59H,0 			//0712 	0C59
		LDWI 	46H 			//0713 	2A46
		BTSC 	STATUS,2 		//0714 	1503
		SUBWR 	58H,0 			//0715 	0C58
		BTSC 	STATUS,0 		//0716 	1403
		LJUMP 	775H 			//0717 	3F75

		//;TCQ-V21.C: 960: {
		//;TCQ-V21.C: 961: start_times++;
		INCR	58H,1 			//0718 	09D8
		BTSC 	STATUS,2 		//0719 	1503
		INCR	59H,1 			//071A 	09D9

		//;TCQ-V21.C: 968: if(SUM0>1600000)
		LDWI 	0H 			//071B 	2A00
		SUBWR 	37H,0 			//071C 	0C37
		BTSS 	STATUS,2 		//071D 	1D03
		LJUMP 	729H 			//071E 	3F29
		LDWI 	18H 			//071F 	2A18
		SUBWR 	36H,0 			//0720 	0C36
		BTSS 	STATUS,2 		//0721 	1D03
		LJUMP 	729H 			//0722 	3F29
		LDWI 	6AH 			//0723 	2A6A
		SUBWR 	35H,0 			//0724 	0C35
		BTSS 	STATUS,2 		//0725 	1D03
		LJUMP 	729H 			//0726 	3F29
		LDWI 	1H 			//0727 	2A01
		SUBWR 	34H,0 			//0728 	0C34
		BTSS 	STATUS,0 		//0729 	1C03
		LJUMP 	733H 			//072A 	3F33

		//;TCQ-V21.C: 969: {
		//;TCQ-V21.C: 970: TH=400000;
		LDWI 	6H 			//072B 	2A06
		CLRR 	47H 			//072C 	0147
		STR 	46H 			//072D 	01C6
		LDWI 	1AH 			//072E 	2A1A
		STR 	45H 			//072F 	01C5
		LDWI 	80H 			//0730 	2A80
		STR 	44H 			//0731 	01C4

		//;TCQ-V21.C: 971: }
		LJUMP 	77DH 			//0732 	3F7D

		//;TCQ-V21.C: 972: else
		//;TCQ-V21.C: 973: {
		//;TCQ-V21.C: 974: SUM=SUM0+TH;
		LDR 	37H,0 			//0733 	0837
		STR 	33H 			//0734 	01B3
		LDR 	36H,0 			//0735 	0836
		STR 	32H 			//0736 	01B2
		LDR 	35H,0 			//0737 	0835
		STR 	31H 			//0738 	01B1
		LDR 	34H,0 			//0739 	0834
		STR 	30H 			//073A 	01B0
		LDR 	44H,0 			//073B 	0844
		ADDWR 	30H,1 			//073C 	0BB0
		LDR 	45H,0 			//073D 	0845
		BCR 	STATUS,2 		//073E 	1103
		BTSC 	STATUS,0 		//073F 	1403
		ADDWI 	1H 			//0740 	2701
		BTSS 	STATUS,2 		//0741 	1D03
		ADDWR 	31H,1 			//0742 	0BB1
		LDR 	46H,0 			//0743 	0846
		BCR 	STATUS,2 		//0744 	1103
		BTSC 	STATUS,0 		//0745 	1403
		ADDWI 	1H 			//0746 	2701
		BTSS 	STATUS,2 		//0747 	1D03
		ADDWR 	32H,1 			//0748 	0BB2
		LDR 	47H,0 			//0749 	0847
		BCR 	STATUS,2 		//074A 	1103
		BTSC 	STATUS,0 		//074B 	1403
		ADDWI 	1H 			//074C 	2701
		BTSS 	STATUS,2 		//074D 	1D03
		ADDWR 	33H,1 			//074E 	0BB3

		//;TCQ-V21.C: 975: if(SUM>2000000)
		LDWI 	0H 			//074F 	2A00
		SUBWR 	33H,0 			//0750 	0C33
		BTSS 	STATUS,2 		//0751 	1D03
		LJUMP 	75DH 			//0752 	3F5D
		LDWI 	1EH 			//0753 	2A1E
		SUBWR 	32H,0 			//0754 	0C32
		BTSS 	STATUS,2 		//0755 	1D03
		LJUMP 	75DH 			//0756 	3F5D
		LDWI 	84H 			//0757 	2A84
		SUBWR 	31H,0 			//0758 	0C31
		BTSS 	STATUS,2 		//0759 	1D03
		LJUMP 	75DH 			//075A 	3F5D
		LDWI 	81H 			//075B 	2A81
		SUBWR 	30H,0 			//075C 	0C30
		BTSS 	STATUS,0 		//075D 	1C03
		LJUMP 	77DH 			//075E 	3F7D

		//;TCQ-V21.C: 976: {
		//;TCQ-V21.C: 977: TH=2000000-SUM0;
		LDWI 	1EH 			//075F 	2A1E
		CLRR 	47H 			//0760 	0147
		STR 	46H 			//0761 	01C6
		LDWI 	84H 			//0762 	2A84
		STR 	45H 			//0763 	01C5
		LDWI 	80H 			//0764 	2A80
		STR 	44H 			//0765 	01C4
		LDR 	34H,0 			//0766 	0834
		SUBWR 	44H,1 			//0767 	0CC4
		LDR 	35H,0 			//0768 	0835
		BTSS 	STATUS,0 		//0769 	1C03
		INCRSZ 	35H,0 		//076A 	0A35
		SUBWR 	45H,1 			//076B 	0CC5
		LDR 	36H,0 			//076C 	0836
		BTSS 	STATUS,0 		//076D 	1C03
		INCRSZ 	36H,0 		//076E 	0A36
		SUBWR 	46H,1 			//076F 	0CC6
		LDR 	37H,0 			//0770 	0837
		BTSS 	STATUS,0 		//0771 	1C03
		INCRSZ 	37H,0 		//0772 	0A37
		SUBWR 	47H,1 			//0773 	0CC7
		LJUMP 	77DH 			//0774 	3F7D

		//;TCQ-V21.C: 983: else
		//;TCQ-V21.C: 984: {
		//;TCQ-V21.C: 985: TH=12000;
		LDWI 	2EH 			//0775 	2A2E
		CLRR 	47H 			//0776 	0147
		CLRR 	46H 			//0777 	0146
		STR 	45H 			//0778 	01C5
		LDWI 	E0H 			//0779 	2AE0
		STR 	44H 			//077A 	01C4

		//;TCQ-V21.C: 986: start_times=0;
		CLRR 	58H 			//077B 	0158
		CLRR 	59H 			//077C 	0159

		//;TCQ-V21.C: 992: {
		//;TCQ-V21.C: 997: if((light_ad<=255)||(start_times>0))
		LDR 	34H,0 			//077D 	0834
		ADDWR 	44H,0 			//077E 	0B44
		STR 	64H 			//077F 	01E4
		LDWI 	0H 			//0780 	2A00
		BTSC 	STATUS,0 		//0781 	1403
		LDWI 	1H 			//0782 	2A01
		ADDWR 	35H,0 			//0783 	0B35
		CLRR 	66H 			//0784 	0166
		BTSC 	STATUS,0 		//0785 	1403
		INCR	66H,1 			//0786 	09E6
		ADDWR 	45H,0 			//0787 	0B45
		STR 	65H 			//0788 	01E5
		BTSC 	STATUS,0 		//0789 	1403
		INCR	66H,1 			//078A 	09E6
		LDR 	36H,0 			//078B 	0836
		ADDWR 	66H,0 			//078C 	0B66
		CLRR 	67H 			//078D 	0167
		BTSC 	STATUS,0 		//078E 	1403
		INCR	67H,1 			//078F 	09E7
		ADDWR 	46H,0 			//0790 	0B46
		STR 	66H 			//0791 	01E6
		BTSC 	STATUS,0 		//0792 	1403
		INCR	67H,1 			//0793 	09E7
		LDR 	37H,0 			//0794 	0837
		ADDWR 	67H,0 			//0795 	0B67
		ADDWR 	47H,0 			//0796 	0B47
		STR 	67H 			//0797 	01E7
		LDR 	3BH,0 			//0798 	083B
		SUBWR 	67H,0 			//0799 	0C67
		BTSS 	STATUS,2 		//079A 	1D03
		LJUMP 	7A6H 			//079B 	3FA6
		LDR 	3AH,0 			//079C 	083A
		SUBWR 	66H,0 			//079D 	0C66
		BTSS 	STATUS,2 		//079E 	1D03
		LJUMP 	7A6H 			//079F 	3FA6
		LDR 	39H,0 			//07A0 	0839
		SUBWR 	65H,0 			//07A1 	0C65
		BTSS 	STATUS,2 		//07A2 	1D03
		LJUMP 	7A6H 			//07A3 	3FA6
		LDR 	38H,0 			//07A4 	0838
		SUBWR 	64H,0 			//07A5 	0C64
		BTSC 	STATUS,0 		//07A6 	1403
		LJUMP 	7B3H 			//07A7 	3FB3

		//;TCQ-V21.C: 998: {
		//;TCQ-V21.C: 999: send_data(0xaa);
		LDWI 	AAH 			//07A8 	2AAA
		LCALL 	F9H 			//07A9 	30F9
		LDWI 	4H 			//07AA 	2A04

		//;TCQ-V21.C: 1011: wave=1;
		BCR 	STATUS,5 		//07AB 	1283
		CLRR 	54H 			//07AC 	0154
		INCR	54H,1 			//07AD 	09D4
		CLRR 	55H 			//07AE 	0155

		//;TCQ-V21.C: 1012: PC0=0;
		BCR 	7H,0 			//07AF 	1007

		//;TCQ-V21.C: 1014: SUM1_num=4;
		STR 	69H 			//07B0 	01E9

		//;TCQ-V21.C: 1016: send_data(0xaa);
		LDWI 	AAH 			//07B1 	2AAA
		LCALL 	F9H 			//07B2 	30F9

		//;TCQ-V21.C: 1018: }
		//;TCQ-V21.C: 1019: }
		//;TCQ-V21.C: 1029: }
		//;TCQ-V21.C: 1034: }
		//;TCQ-V21.C: 1036: SUM=0;
		BCR 	STATUS,5 		//07B3 	1283
		CLRR 	30H 			//07B4 	0130
		CLRR 	31H 			//07B5 	0131
		CLRR 	32H 			//07B6 	0132
		CLRR 	33H 			//07B7 	0133

		//;TCQ-V21.C: 1038: }
		//;TCQ-V21.C: 1040: if((times&0x00ff)==0)
		LDR 	5CH,1 			//07B8 	08DC
		BTSS 	STATUS,2 		//07B9 	1D03
		LJUMP 	32DH 			//07BA 	3B2D

		//;TCQ-V21.C: 1041: {
		//;TCQ-V21.C: 1042: if(times==0)SUM2=SUM1;
		LDR 	5DH,0 			//07BB 	085D
		IORWR 	5CH,0 			//07BC 	035C
		BTSS 	STATUS,2 		//07BD 	1D03
		LJUMP 	7C0H 			//07BE 	3FC0
		CLRWDT	 			//07BF 	0001

		//;TCQ-V21.C: 1050: DelayUs(228);
		LDWI 	E4H 			//07C0 	2AE4
		LCALL 	A1H 			//07C1 	30A1

		//;TCQ-V21.C: 1170: if(times==0)
		BCR 	STATUS,5 		//07C2 	1283
		BCR 	STATUS,6 		//07C3 	1303
		LDR 	5DH,0 			//07C4 	085D
		IORWR 	5CH,0 			//07C5 	035C
		BTSS 	STATUS,2 		//07C6 	1D03
		LJUMP 	32DH 			//07C7 	3B2D

		//;TCQ-V21.C: 1171: {
		//;TCQ-V21.C: 1172: SUM1=0;
		CLRR 	38H 			//07C8 	0138
		CLRR 	39H 			//07C9 	0139
		CLRR 	3AH 			//07CA 	013A
		CLRR 	3BH 			//07CB 	013B

		//;TCQ-V21.C: 1174: if(LIGHT>0)
		LDR 	55H,0 			//07CC 	0855
		IORWR 	54H,0 			//07CD 	0354
		BTSC 	STATUS,2 		//07CE 	1503
		LJUMP 	32DH 			//07CF 	3B2D

		//;TCQ-V21.C: 1175: {
		//;TCQ-V21.C: 1176: LIGHT++;
		INCR	54H,1 			//07D0 	09D4
		BTSC 	STATUS,2 		//07D1 	1503
		INCR	55H,1 			//07D2 	09D5

		//;TCQ-V21.C: 1177: if(LIGHT>15)
		LDWI 	0H 			//07D3 	2A00
		SUBWR 	55H,0 			//07D4 	0C55
		LDWI 	10H 			//07D5 	2A10
		BTSC 	STATUS,2 		//07D6 	1503
		SUBWR 	54H,0 			//07D7 	0C54
		BTSS 	STATUS,0 		//07D8 	1C03
		LJUMP 	32DH 			//07D9 	3B2D
		LDWI 	4H 			//07DA 	2A04

		//;TCQ-V21.C: 1178: {
		//;TCQ-V21.C: 1179: LIGHT=0;
		CLRR 	54H 			//07DB 	0154
		CLRR 	55H 			//07DC 	0155

		//;TCQ-V21.C: 1205: PC0=1;
		//;TCQ-V21.C: 1181: }
		//;TCQ-V21.C: 1182: }
		//;TCQ-V21.C: 1183: }
		//;TCQ-V21.C: 1185: }
		//;TCQ-V21.C: 1201: }
		//;TCQ-V21.C: 1204: wave=0;
		BSR 	7H,0 			//07DD 	1807

		//;TCQ-V21.C: 1206: delay_sub(4);
		LCALL 	D1H 			//07DE 	30D1
		LDWI 	20H 			//07DF 	2A20

		//;TCQ-V21.C: 1218: SUM=0;
		BCR 	STATUS,5 		//07E0 	1283
		BCR 	STATUS,6 		//07E1 	1303
		CLRR 	30H 			//07E2 	0130
		CLRR 	31H 			//07E3 	0131
		CLRR 	32H 			//07E4 	0132
		CLRR 	33H 			//07E5 	0133

		//;TCQ-V21.C: 1219: SUM1=0;
		CLRR 	38H 			//07E6 	0138
		CLRR 	39H 			//07E7 	0139
		CLRR 	3AH 			//07E8 	013A
		CLRR 	3BH 			//07E9 	013B

		//;TCQ-V21.C: 1221: SUM16=0;
		CLRR 	5CH 			//07EA 	015C
		CLRR 	5DH 			//07EB 	015D

		//;TCQ-V21.C: 1222: calc_average_times=0;
		CLRR 	5EH 			//07EC 	015E

		//;TCQ-V21.C: 1223: SUM1_num=32;
		STR 	69H 			//07ED 	01E9

		//;TCQ-V21.C: 1225: stop_times=2;
		LDWI 	2H 			//07EE 	2A02
		STR 	63H 			//07EF 	01E3

		//;TCQ-V21.C: 1227: TH=12000;
		LDWI 	2EH 			//07F0 	2A2E
		CLRR 	47H 			//07F1 	0147
		CLRR 	46H 			//07F2 	0146
		STR 	45H 			//07F3 	01C5
		LDWI 	E0H 			//07F4 	2AE0
		STR 	44H 			//07F5 	01C4
		LDWI 	DDH 			//07F6 	2ADD

		//;TCQ-V21.C: 1229: SUM1_counter=0;
		CLRR 	7DH 			//07F7 	017D

		//;TCQ-V21.C: 1230: ALL_SUM1=0;
		CLRR 	20H 			//07F8 	0120
		CLRR 	21H 			//07F9 	0121
		CLRR 	22H 			//07FA 	0122
		CLRR 	23H 			//07FB 	0123

		//;TCQ-V21.C: 1232: send_data(0xdd);
		LCALL 	F9H 			//07FC 	30F9

		//;TCQ-V21.C: 1233: send_data(0xdd);
		LDWI 	DDH 			//07FD 	2ADD
		LCALL 	F9H 			//07FE 	30F9
		LJUMP 	32DH 			//07FF 	3B2D
			END
