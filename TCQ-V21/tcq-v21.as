opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_POWER_INITIAL
	FNCALL	_main,_ADC_INITIAL
	FNCALL	_main,_CS1237_Power_Down
	FNCALL	_main,_Con_CS1237
	FNCALL	_main,_Read_CON
	FNCALL	_main,_delay_sub
	FNCALL	_main,_read_ad
	FNCALL	_main,_DelayUs
	FNCALL	_main,_Read_CS1237
	FNCALL	_main,_send_data
	FNCALL	_main,___lldiv
	FNCALL	_CS1237_Power_Down,_delay_sub
	FNCALL	_Read_CS1237,_DelayUs
	FNCALL	_Read_CON,_DelayUs
	FNCALL	_Con_CS1237,_DelayUs
	FNCALL	_read_ad,_DelayUs
	FNCALL	_send_data,_DelayUs
	FNCALL	_delay_sub,_DelayUs
	FNROOT	_main
	global	_SUM0_num
	global	_SUM1_num
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"TCQ-V21.C"
	line	79

;initializer for _SUM0_num
	retlw	010h

;initializer for _SUM1_num
	retlw	080h
	global	_ALL_SUM1
	global	_MAX_DELTA
	global	_NOISE_PIR
	global	_PIR_AD
	global	_SUM
	global	_SUM0
	global	_SUM1
	global	_SUM10
	global	_SUM3
	global	_TH
	global	_average1
	global	_times1
	global	_times2
	global	_LIGHT
	global	_k
	global	_start_times
	global	_t
	global	_times
	global	_calc_average_times
	global	_check_light_times
	global	_i
	global	_light_ad
	global	_light_ad0
	global	_stop_times
	global	_SUM1_counter
	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_MSCKCON
_MSCKCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_GO_DONE
_GO_DONE	set	249
	global	_PA0
_PA0	set	40
	global	_PA1
_PA1	set	41
	global	_PA6
_PA6	set	46
	global	_PC0
_PC0	set	56
	global	_PC3
_PC3	set	59
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	145
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISC3
_TRISC3	set	1083
	file	"tcq-v21.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_SUM1_counter:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_ALL_SUM1:
       ds      4

_MAX_DELTA:
       ds      4

_NOISE_PIR:
       ds      4

_PIR_AD:
       ds      4

_SUM:
       ds      4

_SUM0:
       ds      4

_SUM1:
       ds      4

_SUM10:
       ds      4

_SUM3:
       ds      4

_TH:
       ds      4

_average1:
       ds      4

_times1:
       ds      4

_times2:
       ds      4

_LIGHT:
       ds      2

_k:
       ds      2

_start_times:
       ds      2

_t:
       ds      2

_times:
       ds      2

_calc_average_times:
       ds      1

_check_light_times:
       ds      1

_i:
       ds      1

_light_ad:
       ds      1

_light_ad0:
       ds      1

_stop_times:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"TCQ-V21.C"
_SUM0_num:
       ds      1

psect	dataBANK0
	file	"TCQ-V21.C"
_SUM1_num:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+044h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_POWER_INITIAL
?_POWER_INITIAL:	; 0 bytes @ 0x0
	global	??_POWER_INITIAL
??_POWER_INITIAL:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x0
	global	?_delay_sub
?_delay_sub:	; 0 bytes @ 0x0
	global	?_CS1237_Power_Down
?_CS1237_Power_Down:	; 0 bytes @ 0x0
	global	?_ADC_INITIAL
?_ADC_INITIAL:	; 0 bytes @ 0x0
	global	??_ADC_INITIAL
??_ADC_INITIAL:	; 0 bytes @ 0x0
	global	?_send_data
?_send_data:	; 0 bytes @ 0x0
	global	?_Con_CS1237
?_Con_CS1237:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_ad
?_read_ad:	; 1 bytes @ 0x0
	global	?_Read_CON
?_Read_CON:	; 1 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x1
	ds	1
	global	??_delay_sub
??_delay_sub:	; 0 bytes @ 0x2
	global	??_send_data
??_send_data:	; 0 bytes @ 0x2
	global	??_read_ad
??_read_ad:	; 0 bytes @ 0x2
	global	??_Con_CS1237
??_Con_CS1237:	; 0 bytes @ 0x2
	global	??_Read_CON
??_Read_CON:	; 0 bytes @ 0x2
	global	?_Read_CS1237
?_Read_CS1237:	; 4 bytes @ 0x2
	global	delay_sub@n
delay_sub@n:	; 1 bytes @ 0x2
	global	send_data@d
send_data@d:	; 1 bytes @ 0x2
	global	Con_CS1237@count_i
Con_CS1237@count_i:	; 2 bytes @ 0x2
	global	Read_CON@count_i
Read_CON@count_i:	; 2 bytes @ 0x2
	ds	1
	global	delay_sub@i
delay_sub@i:	; 1 bytes @ 0x3
	global	send_data@i
send_data@i:	; 1 bytes @ 0x3
	ds	1
	global	??_CS1237_Power_Down
??_CS1237_Power_Down:	; 0 bytes @ 0x4
	global	read_ad@ch
read_ad@ch:	; 1 bytes @ 0x4
	global	Con_CS1237@dat
Con_CS1237@dat:	; 1 bytes @ 0x4
	global	Read_CON@dat
Read_CON@dat:	; 1 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	Con_CS1237@i
Con_CS1237@i:	; 1 bytes @ 0x5
	global	Read_CON@i
Read_CON@i:	; 1 bytes @ 0x5
	global	read_ad@ad_sum
read_ad@ad_sum:	; 2 bytes @ 0x5
	ds	1
	global	??_Read_CS1237
??_Read_CS1237:	; 0 bytes @ 0x6
	global	Read_CS1237@dat
Read_CS1237@dat:	; 4 bytes @ 0x6
	ds	1
	global	read_ad@i
read_ad@i:	; 1 bytes @ 0x7
	ds	1
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	ds	2
	global	Read_CS1237@i
Read_CS1237@i:	; 1 bytes @ 0xA
	ds	2
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 0, data 2, bss 69, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80      4      74
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?_Read_CS1237	long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lldiv
;;   _CS1237_Power_Down->_delay_sub
;;   _Read_CS1237->_DelayUs
;;   _Read_CON->_DelayUs
;;   _Con_CS1237->_DelayUs
;;   _read_ad->_DelayUs
;;   _send_data->_DelayUs
;;   _delay_sub->_DelayUs
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0    1297
;;                                              0 BANK0      4     4      0
;;                      _POWER_INITIAL
;;                        _ADC_INITIAL
;;                  _CS1237_Power_Down
;;                         _Con_CS1237
;;                           _Read_CON
;;                          _delay_sub
;;                            _read_ad
;;                            _DelayUs
;;                        _Read_CS1237
;;                          _send_data
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (1) _CS1237_Power_Down                                    0     0      0     137
;;                          _delay_sub
;; ---------------------------------------------------------------------------------
;; (1) _Read_CS1237                                         10     6      4     163
;;                                              2 COMMON     9     5      4
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _Read_CON                                             6     6      0     188
;;                                              2 COMMON     4     4      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _Con_CS1237                                           4     4      0     186
;;                                              2 COMMON     4     4      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _read_ad                                              6     6      0     163
;;                                              2 COMMON     6     6      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _send_data                                            2     2      0     115
;;                                              2 COMMON     2     2      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _delay_sub                                            2     2      0     137
;;                                              2 COMMON     2     2      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) ___lldiv                                             13     5      8     162
;;                                              0 COMMON    13     5      8
;; ---------------------------------------------------------------------------------
;; (1) _ADC_INITIAL                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DelayUs                                              2     2      0      46
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _POWER_INITIAL                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _POWER_INITIAL
;;   _ADC_INITIAL
;;   _CS1237_Power_Down
;;     _delay_sub
;;       _DelayUs
;;   _Con_CS1237
;;     _DelayUs
;;   _Read_CON
;;     _DelayUs
;;   _delay_sub
;;     _DelayUs
;;   _read_ad
;;     _DelayUs
;;   _DelayUs
;;   _Read_CS1237
;;     _DelayUs
;;   _send_data
;;     _DelayUs
;;   ___lldiv
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       6        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      5B       8        0.0%
;;ABS                  0      0      58       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      4      4A       4       92.5%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      D       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 546 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  m               2    0        unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       4       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_POWER_INITIAL
;;		_ADC_INITIAL
;;		_CS1237_Power_Down
;;		_Con_CS1237
;;		_Read_CON
;;		_delay_sub
;;		_read_ad
;;		_DelayUs
;;		_Read_CS1237
;;		_send_data
;;		___lldiv
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"TCQ-V21.C"
	line	546
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	548
	
l3492:	
;TCQ-V21.C: 548: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	551
;TCQ-V21.C: 551: ADC_INITIAL();
	fcall	_ADC_INITIAL
	line	554
;TCQ-V21.C: 554: CS1237_Power_Down();
	fcall	_CS1237_Power_Down
	line	555
;TCQ-V21.C: 555: Con_CS1237();
	fcall	_Con_CS1237
	line	556
;TCQ-V21.C: 558: MIN_PIR=0XFF;
	fcall	_Read_CON
	line	565
;TCQ-V21.C: 608: wave=0;
	movlw	(0Ah)
	fcall	_delay_sub
	line	609
	
l3494:	
;TCQ-V21.C: 609: PC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	612
;TCQ-V21.C: 612: delay_sub(6);
	movlw	(06h)
	fcall	_delay_sub
	line	616
	
l3496:	
;TCQ-V21.C: 616: SUM=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_SUM)
	clrf	(_SUM+1)
	clrf	(_SUM+2)
	clrf	(_SUM+3)
	line	625
	
l3498:	
;TCQ-V21.C: 625: for(i=0;i<32;i++)
	clrf	(_i)
	line	627
	
l3504:	
;TCQ-V21.C: 626: {
;TCQ-V21.C: 627: for(t=0;t<2048;t++)
	clrf	(_t)
	clrf	(_t+1)
	line	628
	
l1243:	
	line	629
;TCQ-V21.C: 628: {
;TCQ-V21.C: 629: GO_DONE = 1;
	bsf	(249/8),(249)&7
	line	630
;TCQ-V21.C: 630: while( GO_DONE==1 );
	
l1245:	
	btfsc	(249/8),(249)&7
	goto	u1181
	goto	u1180
u1181:
	goto	l1245
u1180:
	line	632
	
l3510:	
;TCQ-V21.C: 632: k = ADRESH<<8;
	movf	(30),w	;volatile
	movwf	(_k+1)
	clrf	(_k)
	line	633
;TCQ-V21.C: 633: k+= ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_k),f
	skipnc
	incf	(_k+1),f
	line	635
;TCQ-V21.C: 635: SUM+=k;
	movf	(_k),w
	movwf	((??_main+0)+0)
	movf	(_k+1),w
	movwf	((??_main+0)+0+1)
	clrf	((??_main+0)+0+2)
	clrf	((??_main+0)+0+3)
	movf	0+(??_main+0)+0,w
	addwf	(_SUM),f
	movf	1+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1191
	addwf	(_SUM+1),f
u1191:
	movf	2+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1192
	addwf	(_SUM+2),f
u1192:
	movf	3+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1193
	addwf	(_SUM+3),f
u1193:

	line	627
	
l3512:	
	incf	(_t),f
	skipnz
	incf	(_t+1),f
	
l3514:	
	movlw	high(0800h)
	subwf	(_t+1),w
	movlw	low(0800h)
	skipnz
	subwf	(_t),w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l1243
u1200:
	
l1244:	
	line	640
# 640 "TCQ-V21.C"
     Clrwdt ;#
psect	maintext
	line	625
	
l3516:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(_i),f
	
l3518:	
	movlw	(020h)
	subwf	(_i),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l3504
u1210:
	line	694
	
l3520:	
;TCQ-V21.C: 694: TH=12000;
	movlw	0
	movwf	(_TH+3)
	movlw	0
	movwf	(_TH+2)
	movlw	02Eh
	movwf	(_TH+1)
	movlw	0E0h
	movwf	(_TH)

	line	699
	
l3522:	
;TCQ-V21.C: 699: light_ad=read_ad(0XB5);
	movlw	(0B5h)
	fcall	_read_ad
	movwf	(_light_ad)
	line	700
	
l3524:	
;TCQ-V21.C: 700: light_ad0=light_ad;
	movf	(_light_ad),w
	movwf	(_light_ad0)
	line	702
	
l3526:	
;TCQ-V21.C: 702: for(i=0;i<20;i++)DelayUs(228);
	clrf	(_i)
	
l3532:	
	movlw	(0E4h)
	fcall	_DelayUs
	
l3534:	
	incf	(_i),f
	
l3536:	
	movlw	(014h)
	subwf	(_i),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l3532
u1220:
	
l1249:	
	line	705
;TCQ-V21.C: 706: unsigned int m=0;
	clrf	(_SUM)
	clrf	(_SUM+1)
	clrf	(_SUM+2)
	clrf	(_SUM+3)
	line	707
	
l3538:	
;TCQ-V21.C: 707: NOISE_PIR=0XFFFFFFFF;
	movlw	0FFh
	movwf	(_NOISE_PIR+3)
	movlw	0FFh
	movwf	(_NOISE_PIR+2)
	movlw	0FFh
	movwf	(_NOISE_PIR+1)
	movlw	0FFh
	movwf	(_NOISE_PIR)

	goto	l3540
	line	709
;TCQ-V21.C: 709: while(1)
	
l1250:	
	line	730
	
l3540:	
;TCQ-V21.C: 714: {
;TCQ-V21.C: 730: times++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_times),f
	skipnz
	incf	(_times+1),f
	line	732
	
l3542:	
;TCQ-V21.C: 732: PIR_AD= Read_CS1237();
	fcall	_Read_CS1237
	movf	(3+(?_Read_CS1237)),w
	movwf	(_PIR_AD+3)
	movf	(2+(?_Read_CS1237)),w
	movwf	(_PIR_AD+2)
	movf	(1+(?_Read_CS1237)),w
	movwf	(_PIR_AD+1)
	movf	(0+(?_Read_CS1237)),w
	movwf	(_PIR_AD)

	line	734
	
l3544:	
;TCQ-V21.C: 734: PIR_AD+=0X7FFFFF;
	movlw	0FFh
	addwf	(_PIR_AD),f
	movlw	0FFh
	skipc
	addwf	(_PIR_AD+1),f
	movlw	07Fh
	skipnc
movlw 128
	addwf	(_PIR_AD+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_PIR_AD+3),f
	line	735
	
l3546:	
;TCQ-V21.C: 735: PIR_AD&=0X00FFFFFF;
	movlw	0FFh
	andwf	(_PIR_AD),f
	movlw	0FFh
	andwf	(_PIR_AD+1),f
	movlw	0FFh
	andwf	(_PIR_AD+2),f
	movlw	0
	andwf	(_PIR_AD+3),f
	line	742
	
l3548:	
;TCQ-V21.C: 742: average1=0X7FFFFF;
	movlw	0
	movwf	(_average1+3)
	movlw	07Fh
	movwf	(_average1+2)
	movlw	0FFh
	movwf	(_average1+1)
	movlw	0FFh
	movwf	(_average1)

	line	743
	
l3550:	
;TCQ-V21.C: 743: if(PIR_AD>average1) k=PIR_AD-average1;
	movlw	0
	subwf	(_PIR_AD+3),w
	skipz
	goto	u1235
	movlw	080h
	subwf	(_PIR_AD+2),w
	skipz
	goto	u1235
	movlw	0
	subwf	(_PIR_AD+1),w
	skipz
	goto	u1235
	movlw	0
	subwf	(_PIR_AD),w
u1235:
	skipc
	goto	u1231
	goto	u1230
u1231:
	goto	l1252
u1230:
	
l3552:	
	movf	(_PIR_AD+1),w
	movwf	(_k+1)
	movf	(_PIR_AD),w
	movwf	(_k)
	movlw	low(0FFFFh)
	subwf	(_k),f
	movlw	high(0FFFFh)
	skipc
	decf	(_k+1),f
	subwf	(_k+1),f
	
l1252:	
	line	744
;TCQ-V21.C: 744: if(PIR_AD<average1) k=average1-PIR_AD;
	movlw	0
	subwf	(_PIR_AD+3),w
	skipz
	goto	u1245
	movlw	07Fh
	subwf	(_PIR_AD+2),w
	skipz
	goto	u1245
	movlw	0FFh
	subwf	(_PIR_AD+1),w
	skipz
	goto	u1245
	movlw	0FFh
	subwf	(_PIR_AD),w
u1245:
	skipnc
	goto	u1241
	goto	u1240
u1241:
	goto	l1253
u1240:
	
l3554:	
	movlw	low(0FFFFh)
	movwf	(_k)
	movlw	high(0FFFFh)
	movwf	((_k))+1
	movf	(_PIR_AD),w
	subwf	(_k),f
	movf	(_PIR_AD+1),w
	skipc
	decf	(_k+1),f
	subwf	(_k+1),f
	
l1253:	
	line	745
;TCQ-V21.C: 745: SUM3+=k;
	movf	(_k),w
	movwf	((??_main+0)+0)
	movf	(_k+1),w
	movwf	((??_main+0)+0+1)
	clrf	((??_main+0)+0+2)
	clrf	((??_main+0)+0+3)
	movf	0+(??_main+0)+0,w
	addwf	(_SUM3),f
	movf	1+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1251
	addwf	(_SUM3+1),f
u1251:
	movf	2+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1252
	addwf	(_SUM3+2),f
u1252:
	movf	3+(??_main+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1253
	addwf	(_SUM3+3),f
u1253:

	line	746
	
l3556:	
;TCQ-V21.C: 746: times1++;
	incf	(_times1),f
	skipnz
	incf	(_times1+1),f
	skipnz
	incf	(_times1+2),f
	skipnz
	incf	(_times1+3),f
	line	747
	
l3558:	
;TCQ-V21.C: 747: if(times1>=8192)
	movlw	0
	subwf	(_times1+3),w
	skipz
	goto	u1265
	movlw	0
	subwf	(_times1+2),w
	skipz
	goto	u1265
	movlw	020h
	subwf	(_times1+1),w
	skipz
	goto	u1265
	movlw	0
	subwf	(_times1),w
u1265:
	skipc
	goto	u1261
	goto	u1260
u1261:
	goto	l3588
u1260:
	line	749
	
l3560:	
;TCQ-V21.C: 748: {
;TCQ-V21.C: 749: times1=0;
	clrf	(_times1)
	clrf	(_times1+1)
	clrf	(_times1+2)
	clrf	(_times1+3)
	line	751
	
l3562:	
;TCQ-V21.C: 751: if(SUM3<NOISE_PIR) NOISE_PIR=SUM3;
	movf	(_NOISE_PIR+3),w
	subwf	(_SUM3+3),w
	skipz
	goto	u1275
	movf	(_NOISE_PIR+2),w
	subwf	(_SUM3+2),w
	skipz
	goto	u1275
	movf	(_NOISE_PIR+1),w
	subwf	(_SUM3+1),w
	skipz
	goto	u1275
	movf	(_NOISE_PIR),w
	subwf	(_SUM3),w
u1275:
	skipnc
	goto	u1271
	goto	u1270
u1271:
	goto	l1255
u1270:
	
l3564:	
	movf	(_SUM3+3),w
	movwf	(_NOISE_PIR+3)
	movf	(_SUM3+2),w
	movwf	(_NOISE_PIR+2)
	movf	(_SUM3+1),w
	movwf	(_NOISE_PIR+1)
	movf	(_SUM3),w
	movwf	(_NOISE_PIR)

	
l1255:	
	line	753
;TCQ-V21.C: 753: if(SUM3-NOISE_PIR>2)
	movf	(_NOISE_PIR),w
	subwf	(_SUM3),w
	movwf	((??_main+0)+0+0)
	movf	(_SUM3+1),w
	movwf	((??_main+0)+0+1)
	movf	(_NOISE_PIR+1),w
	skipc
	incfsz	(_NOISE_PIR+1),w
	goto	u1281
	goto	u1282
u1281:
	subwf	((??_main+0)+0+1),f
u1282:
	movf	(_SUM3+2),w
	movwf	((??_main+0)+0+2)
	movf	(_NOISE_PIR+2),w
	skipc
	incfsz	(_NOISE_PIR+2),w
	goto	u1283
	goto	u1284
u1283:
	subwf	((??_main+0)+0+2),f
u1284:
	movf	(_SUM3+3),w
	movwf	((??_main+0)+0+3)
	movf	(_NOISE_PIR+3),w
	skipc
	incfsz	(_NOISE_PIR+3),w
	goto	u1285
	goto	u1286
u1285:
	subwf	((??_main+0)+0+3),f
u1286:

	movlw	0
	subwf	3+(??_main+0)+0,w
	skipz
	goto	u1295
	movlw	0
	subwf	2+(??_main+0)+0,w
	skipz
	goto	u1295
	movlw	0
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u1295
	movlw	03h
	subwf	0+(??_main+0)+0,w
u1295:
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l3570
u1290:
	line	755
	
l3566:	
;TCQ-V21.C: 754: {
;TCQ-V21.C: 755: PA1=0;
	bcf	(41/8),(41)&7
	line	756
	
l3568:	
;TCQ-V21.C: 756: times2=1;
	clrf	(_times2)
	incf	(_times2),f
	clrf	(_times2+1)
	clrf	(_times2+2)
	clrf	(_times2+3)
	line	758
	
l3570:	
;TCQ-V21.C: 757: }
;TCQ-V21.C: 758: send_data(NOISE_PIR>>24);
	movf	0+(((_NOISE_PIR))+3),w
	fcall	_send_data
	line	759
	
l3572:	
;TCQ-V21.C: 759: send_data(NOISE_PIR>>16);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(((_NOISE_PIR))+2),w
	fcall	_send_data
	line	760
	
l3574:	
;TCQ-V21.C: 760: send_data(NOISE_PIR>>8);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(((_NOISE_PIR))+1),w
	fcall	_send_data
	line	761
	
l3576:	
;TCQ-V21.C: 761: send_data(NOISE_PIR);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_NOISE_PIR),w
	fcall	_send_data
	line	762
	
l3578:	
;TCQ-V21.C: 762: send_data(SUM3>>24);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(((_SUM3))+3),w
	fcall	_send_data
	line	763
	
l3580:	
;TCQ-V21.C: 763: send_data(SUM3>>16);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(((_SUM3))+2),w
	fcall	_send_data
	line	764
	
l3582:	
;TCQ-V21.C: 764: send_data(SUM3>>8);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(((_SUM3))+1),w
	fcall	_send_data
	line	765
	
l3584:	
;TCQ-V21.C: 765: send_data(SUM3);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_SUM3),w
	fcall	_send_data
	line	766
	
l3586:	
;TCQ-V21.C: 766: SUM3=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_SUM3)
	clrf	(_SUM3+1)
	clrf	(_SUM3+2)
	clrf	(_SUM3+3)
	line	768
	
l3588:	
;TCQ-V21.C: 767: }
;TCQ-V21.C: 768: if(times2>0)
	movf	(_times2+3),w
	iorwf	(_times2+2),w
	iorwf	(_times2+1),w
	iorwf	(_times2),w
	skipnz
	goto	u1301
	goto	u1300
u1301:
	goto	l3596
u1300:
	line	770
	
l3590:	
;TCQ-V21.C: 769: {
;TCQ-V21.C: 770: times2++;
	incf	(_times2),f
	skipnz
	incf	(_times2+1),f
	skipnz
	incf	(_times2+2),f
	skipnz
	incf	(_times2+3),f
	line	771
	
l3592:	
;TCQ-V21.C: 771: if(times2>2048)
	movlw	0
	subwf	(_times2+3),w
	skipz
	goto	u1315
	movlw	0
	subwf	(_times2+2),w
	skipz
	goto	u1315
	movlw	08h
	subwf	(_times2+1),w
	skipz
	goto	u1315
	movlw	01h
	subwf	(_times2),w
u1315:
	skipc
	goto	u1311
	goto	u1310
u1311:
	goto	l3596
u1310:
	line	773
	
l3594:	
;TCQ-V21.C: 772: {
;TCQ-V21.C: 773: PA1=1;
	bsf	(41/8),(41)&7
	line	774
;TCQ-V21.C: 774: times2=0;
	clrf	(_times2)
	clrf	(_times2+1)
	clrf	(_times2+2)
	clrf	(_times2+3)
	line	795
	
l3596:	
;TCQ-V21.C: 775: }
;TCQ-V21.C: 776: }
;TCQ-V21.C: 795: if(times>=512)
	movlw	high(0200h)
	subwf	(_times+1),w
	movlw	low(0200h)
	skipnz
	subwf	(_times),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l3762
u1320:
	line	810
	
l3598:	
;TCQ-V21.C: 796: {
;TCQ-V21.C: 810: times=0;
	clrf	(_times)
	clrf	(_times+1)
	line	812
	
l3600:	
;TCQ-V21.C: 814: SUM16+=SUM;
	incf	(_calc_average_times),f
	line	816
	
l3602:	
;TCQ-V21.C: 816: if(calc_average_times>=8)
	movlw	(08h)
	subwf	(_calc_average_times),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l3606
u1330:
	line	818
	
l3604:	
;TCQ-V21.C: 823: SUM16=0;
	clrf	(_calc_average_times)
	line	826
	
l3606:	
;TCQ-V21.C: 824: }
;TCQ-V21.C: 826: if(check_light_times<6)
	movlw	(06h)
	subwf	(_check_light_times),w
	skipnc
	goto	u1341
	goto	u1340
u1341:
	goto	l3610
u1340:
	line	828
	
l3608:	
;TCQ-V21.C: 827: {
;TCQ-V21.C: 828: check_light_times++;
	incf	(_check_light_times),f
	line	829
;TCQ-V21.C: 829: }
	goto	l3622
	line	832
	
l3610:	
;TCQ-V21.C: 830: else
;TCQ-V21.C: 831: {
;TCQ-V21.C: 832: if(LIGHT==0)
	movf	((_LIGHT+1)),w
	iorwf	((_LIGHT)),w
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l3622
u1350:
	line	835
	
l3612:	
;TCQ-V21.C: 833: {
;TCQ-V21.C: 835: light_ad=read_ad(0XB5);
	movlw	(0B5h)
	fcall	_read_ad
	movwf	(_light_ad)
	line	837
	
l3614:	
;TCQ-V21.C: 837: if((light_ad<=(light_ad0+2))&&(light_ad0<=(light_ad+2)))
	movf	(_light_ad0),w
	addlw	low(02h)
	movwf	(??_main+0)+0
	movlw	high(02h)
	skipnc
	movlw	(high(02h)+1)&0ffh
	movwf	((??_main+0)+0)+1
	movf	1+(??_main+0)+0,w
	xorlw	80h
	movwf	(??_main+2)+0
	movlw	80h
	subwf	(??_main+2)+0,w
	skipz
	goto	u1365
	movf	(_light_ad),w
	subwf	0+(??_main+0)+0,w
u1365:

	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l1264
u1360:
	
l3616:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_light_ad),w
	addlw	low(02h)
	movwf	(??_main+0)+0
	movlw	high(02h)
	skipnc
	movlw	(high(02h)+1)&0ffh
	movwf	((??_main+0)+0)+1
	movf	1+(??_main+0)+0,w
	xorlw	80h
	movwf	(??_main+2)+0
	movlw	80h
	subwf	(??_main+2)+0,w
	skipz
	goto	u1375
	movf	(_light_ad0),w
	subwf	0+(??_main+0)+0,w
u1375:

	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l1264
u1370:
	line	838
	
l3618:	
;TCQ-V21.C: 838: light_ad=light_ad0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_light_ad0),w
	movwf	(_light_ad)
	
l1264:	
	line	840
;TCQ-V21.C: 840: light_ad0=light_ad;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_light_ad),w
	movwf	(_light_ad0)
	line	842
	
l3620:	
;TCQ-V21.C: 842: check_light_times=0;
	clrf	(_check_light_times)
	line	849
	
l3622:	
;TCQ-V21.C: 844: }
;TCQ-V21.C: 846: }
;TCQ-V21.C: 849: if(SUM0==0)SUM0=SUM1+1000;
	movf	(_SUM0+3),w
	iorwf	(_SUM0+2),w
	iorwf	(_SUM0+1),w
	iorwf	(_SUM0),w
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l3626
u1380:
	
l3624:	
	movf	(_SUM1+3),w
	movwf	(_SUM0+3)
	movf	(_SUM1+2),w
	movwf	(_SUM0+2)
	movf	(_SUM1+1),w
	movwf	(_SUM0+1)
	movf	(_SUM1),w
	movwf	(_SUM0)

	movlw	0E8h
	addwf	(_SUM0),f
	movlw	03h
	skipnc
movlw 4
	addwf	(_SUM0+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_SUM0+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_SUM0+3),f
	line	852
	
l3626:	
;TCQ-V21.C: 852: if(SUM1_counter==0)
	movf	(_SUM1_counter),f
	skipz
	goto	u1391
	goto	u1390
u1391:
	goto	l1266
u1390:
	line	854
	
l3628:	
;TCQ-V21.C: 853: {
;TCQ-V21.C: 854: SUM10=SUM1;
	movf	(_SUM1+3),w
	movwf	(_SUM10+3)
	movf	(_SUM1+2),w
	movwf	(_SUM10+2)
	movf	(_SUM1+1),w
	movwf	(_SUM10+1)
	movf	(_SUM1),w
	movwf	(_SUM10)

	line	855
	
l3630:	
;TCQ-V21.C: 855: MAX_DELTA=SUM10/6;
	movlw	06h
	movwf	(?___lldiv)
	clrf	(?___lldiv+1)
	clrf	(?___lldiv+2)
	clrf	(?___lldiv+3)

	movf	(_SUM10+3),w
	movwf	3+(?___lldiv)+04h
	movf	(_SUM10+2),w
	movwf	2+(?___lldiv)+04h
	movf	(_SUM10+1),w
	movwf	1+(?___lldiv)+04h
	movf	(_SUM10),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(_MAX_DELTA+3)
	movf	(2+(?___lldiv)),w
	movwf	(_MAX_DELTA+2)
	movf	(1+(?___lldiv)),w
	movwf	(_MAX_DELTA+1)
	movf	(0+(?___lldiv)),w
	movwf	(_MAX_DELTA)

	line	856
	
l3632:	
;TCQ-V21.C: 856: if(MAX_DELTA<4000)MAX_DELTA=4000;
	movlw	0
	subwf	(_MAX_DELTA+3),w
	skipz
	goto	u1405
	movlw	0
	subwf	(_MAX_DELTA+2),w
	skipz
	goto	u1405
	movlw	0Fh
	subwf	(_MAX_DELTA+1),w
	skipz
	goto	u1405
	movlw	0A0h
	subwf	(_MAX_DELTA),w
u1405:
	skipnc
	goto	u1401
	goto	u1400
u1401:
	goto	l1266
u1400:
	
l3634:	
	movlw	0
	movwf	(_MAX_DELTA+3)
	movlw	0
	movwf	(_MAX_DELTA+2)
	movlw	0Fh
	movwf	(_MAX_DELTA+1)
	movlw	0A0h
	movwf	(_MAX_DELTA)

	line	857
	
l1266:	
	line	859
;TCQ-V21.C: 857: }
;TCQ-V21.C: 859: if((SUM10<(SUM1+MAX_DELTA))&&(SUM1<(SUM10+MAX_DELTA)))
	movf	(_SUM1),w
	addwf	(_MAX_DELTA),w
	movwf	((??_main+0)+0+0)
	movlw	0
	skipnc
	movlw	1
	addwf	(_SUM1+1),w
	clrf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+2),f
	addwf	(_MAX_DELTA+1),w
	movwf	((??_main+0)+0+1)
	skipnc
	incf	((??_main+0)+0+2),f
	movf	(_SUM1+2),w
	addwf	((??_main+0)+0+2),w
	clrf	((??_main+0)+0+3)
	skipnc
	incf	((??_main+0)+0+3),f
	addwf	(_MAX_DELTA+2),w
	movwf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+3),f
	movf	(_SUM1+3),w
	addwf	((??_main+0)+0+3),w
	addwf	(_MAX_DELTA+3),w
	movwf	((??_main+0)+0+3)
	movf	3+(??_main+0)+0,w
	subwf	(_SUM10+3),w
	skipz
	goto	u1415
	movf	2+(??_main+0)+0,w
	subwf	(_SUM10+2),w
	skipz
	goto	u1415
	movf	1+(??_main+0)+0,w
	subwf	(_SUM10+1),w
	skipz
	goto	u1415
	movf	0+(??_main+0)+0,w
	subwf	(_SUM10),w
u1415:
	skipnc
	goto	u1411
	goto	u1410
u1411:
	goto	l3674
u1410:
	
l3636:	
	movf	(_SUM10),w
	addwf	(_MAX_DELTA),w
	movwf	((??_main+0)+0+0)
	movlw	0
	skipnc
	movlw	1
	addwf	(_SUM10+1),w
	clrf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+2),f
	addwf	(_MAX_DELTA+1),w
	movwf	((??_main+0)+0+1)
	skipnc
	incf	((??_main+0)+0+2),f
	movf	(_SUM10+2),w
	addwf	((??_main+0)+0+2),w
	clrf	((??_main+0)+0+3)
	skipnc
	incf	((??_main+0)+0+3),f
	addwf	(_MAX_DELTA+2),w
	movwf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+3),f
	movf	(_SUM10+3),w
	addwf	((??_main+0)+0+3),w
	addwf	(_MAX_DELTA+3),w
	movwf	((??_main+0)+0+3)
	movf	3+(??_main+0)+0,w
	subwf	(_SUM1+3),w
	skipz
	goto	u1425
	movf	2+(??_main+0)+0,w
	subwf	(_SUM1+2),w
	skipz
	goto	u1425
	movf	1+(??_main+0)+0,w
	subwf	(_SUM1+1),w
	skipz
	goto	u1425
	movf	0+(??_main+0)+0,w
	subwf	(_SUM1),w
u1425:
	skipnc
	goto	u1421
	goto	u1420
u1421:
	goto	l3674
u1420:
	line	861
	
l3638:	
;TCQ-V21.C: 860: {
;TCQ-V21.C: 861: SUM1_counter++;
	incf	(_SUM1_counter),f
	line	862
	
l3640:	
;TCQ-V21.C: 862: ALL_SUM1+=SUM1;
	movf	(_SUM1),w
	addwf	(_ALL_SUM1),f
	movf	(_SUM1+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1431
	addwf	(_ALL_SUM1+1),f
u1431:
	movf	(_SUM1+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1432
	addwf	(_ALL_SUM1+2),f
u1432:
	movf	(_SUM1+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1433
	addwf	(_ALL_SUM1+3),f
u1433:

	line	863
	
l3642:	
;TCQ-V21.C: 863: SUM10=ALL_SUM1/SUM1_counter;
	movf	(_SUM1_counter),w
	movwf	(?___lldiv)
	clrf	(?___lldiv+1)
	clrf	(?___lldiv+2)
	clrf	(?___lldiv+3)

	movf	(_ALL_SUM1+3),w
	movwf	3+(?___lldiv)+04h
	movf	(_ALL_SUM1+2),w
	movwf	2+(?___lldiv)+04h
	movf	(_ALL_SUM1+1),w
	movwf	1+(?___lldiv)+04h
	movf	(_ALL_SUM1),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(_SUM10+3)
	movf	(2+(?___lldiv)),w
	movwf	(_SUM10+2)
	movf	(1+(?___lldiv)),w
	movwf	(_SUM10+1)
	movf	(0+(?___lldiv)),w
	movwf	(_SUM10)

	line	864
	
l3644:	
;TCQ-V21.C: 864: MAX_DELTA=SUM10/6;
	movlw	06h
	movwf	(?___lldiv)
	clrf	(?___lldiv+1)
	clrf	(?___lldiv+2)
	clrf	(?___lldiv+3)

	movf	(_SUM10+3),w
	movwf	3+(?___lldiv)+04h
	movf	(_SUM10+2),w
	movwf	2+(?___lldiv)+04h
	movf	(_SUM10+1),w
	movwf	1+(?___lldiv)+04h
	movf	(_SUM10),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(_MAX_DELTA+3)
	movf	(2+(?___lldiv)),w
	movwf	(_MAX_DELTA+2)
	movf	(1+(?___lldiv)),w
	movwf	(_MAX_DELTA+1)
	movf	(0+(?___lldiv)),w
	movwf	(_MAX_DELTA)

	line	865
	
l3646:	
;TCQ-V21.C: 865: if(MAX_DELTA<4000)MAX_DELTA=4000;
	movlw	0
	subwf	(_MAX_DELTA+3),w
	skipz
	goto	u1445
	movlw	0
	subwf	(_MAX_DELTA+2),w
	skipz
	goto	u1445
	movlw	0Fh
	subwf	(_MAX_DELTA+1),w
	skipz
	goto	u1445
	movlw	0A0h
	subwf	(_MAX_DELTA),w
u1445:
	skipnc
	goto	u1441
	goto	u1440
u1441:
	goto	l1269
u1440:
	
l3648:	
	movlw	0
	movwf	(_MAX_DELTA+3)
	movlw	0
	movwf	(_MAX_DELTA+2)
	movlw	0Fh
	movwf	(_MAX_DELTA+1)
	movlw	0A0h
	movwf	(_MAX_DELTA)

	
l1269:	
	line	867
;TCQ-V21.C: 867: if(SUM0>SUM10)
	movf	(_SUM0+3),w
	subwf	(_SUM10+3),w
	skipz
	goto	u1455
	movf	(_SUM0+2),w
	subwf	(_SUM10+2),w
	skipz
	goto	u1455
	movf	(_SUM0+1),w
	subwf	(_SUM10+1),w
	skipz
	goto	u1455
	movf	(_SUM0),w
	subwf	(_SUM10),w
u1455:
	skipnc
	goto	u1451
	goto	u1450
u1451:
	goto	l3658
u1450:
	line	869
	
l3650:	
;TCQ-V21.C: 868: {
;TCQ-V21.C: 869: SUM=SUM0-SUM10;
	movf	(_SUM0+3),w
	movwf	(_SUM+3)
	movf	(_SUM0+2),w
	movwf	(_SUM+2)
	movf	(_SUM0+1),w
	movwf	(_SUM+1)
	movf	(_SUM0),w
	movwf	(_SUM)

	movf	(_SUM10),w
	subwf	(_SUM),f
	movf	(_SUM10+1),w
	skipc
	incfsz	(_SUM10+1),w
	subwf	(_SUM+1),f
	movf	(_SUM10+2),w
	skipc
	incfsz	(_SUM10+2),w
	subwf	(_SUM+2),f
	movf	(_SUM10+3),w
	skipc
	incfsz	(_SUM10+3),w
	subwf	(_SUM+3),f
	line	870
;TCQ-V21.C: 870: if(SUM>30000)SUM0_num=2;
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1465
	movlw	0
	subwf	(_SUM+2),w
	skipz
	goto	u1465
	movlw	075h
	subwf	(_SUM+1),w
	skipz
	goto	u1465
	movlw	031h
	subwf	(_SUM),w
u1465:
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l3654
u1460:
	
l3652:	
	movlw	(02h)
	movwf	(_SUM0_num)
	goto	l1275
	line	871
	
l3654:	
;TCQ-V21.C: 871: else if(SUM>8000)SUM0_num=4;
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1475
	movlw	0
	subwf	(_SUM+2),w
	skipz
	goto	u1475
	movlw	01Fh
	subwf	(_SUM+1),w
	skipz
	goto	u1475
	movlw	041h
	subwf	(_SUM),w
u1475:
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l3658
u1470:
	
l3656:	
	movlw	(04h)
	movwf	(_SUM0_num)
	goto	l1275
	line	872
	
l3658:	
;TCQ-V21.C: 872: else SUM0_num=16;
	movlw	(010h)
	movwf	(_SUM0_num)
	line	877
	
l1275:	
	line	878
;TCQ-V21.C: 877: }
;TCQ-V21.C: 878: if((SUM1_counter>=SUM0_num)&&(SUM10<SUM0))
	movf	(_SUM0_num),w
	subwf	(_SUM1_counter),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l3678
u1480:
	
l3662:	
	movf	(_SUM0+3),w
	subwf	(_SUM10+3),w
	skipz
	goto	u1495
	movf	(_SUM0+2),w
	subwf	(_SUM10+2),w
	skipz
	goto	u1495
	movf	(_SUM0+1),w
	subwf	(_SUM10+1),w
	skipz
	goto	u1495
	movf	(_SUM0),w
	subwf	(_SUM10),w
u1495:
	skipnc
	goto	u1491
	goto	u1490
u1491:
	goto	l3678
u1490:
	line	880
	
l3664:	
;TCQ-V21.C: 879: {
;TCQ-V21.C: 880: if(SUM1_num>16)
	movlw	(011h)
	subwf	(_SUM1_num),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l3726
u1500:
	line	882
	
l3666:	
;TCQ-V21.C: 881: {
;TCQ-V21.C: 882: if(SUM0_num<=8)SUM0=SUM10;
	movlw	(09h)
	subwf	(_SUM0_num),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l3670
u1510:
	
l3668:	
	movf	(_SUM10+3),w
	movwf	(_SUM0+3)
	movf	(_SUM10+2),w
	movwf	(_SUM0+2)
	movf	(_SUM10+1),w
	movwf	(_SUM0+1)
	movf	(_SUM10),w
	movwf	(_SUM0)

	goto	l3674
	line	885
	
l3670:	
;TCQ-V21.C: 883: else
;TCQ-V21.C: 884: {
;TCQ-V21.C: 885: SUM0+=SUM10;
	movf	(_SUM10),w
	addwf	(_SUM0),f
	movf	(_SUM10+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1521
	addwf	(_SUM0+1),f
u1521:
	movf	(_SUM10+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1522
	addwf	(_SUM0+2),f
u1522:
	movf	(_SUM10+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1523
	addwf	(_SUM0+3),f
u1523:

	line	886
	
l3672:	
;TCQ-V21.C: 886: SUM0/=2;
	clrc
	rrf	(_SUM0+3),f
	rrf	(_SUM0+2),f
	rrf	(_SUM0+1),f
	rrf	(_SUM0),f
	line	888
	
l3674:	
;TCQ-V21.C: 887: }
;TCQ-V21.C: 888: SUM1_counter=0;
	clrf	(_SUM1_counter)
	line	889
	
l3676:	
;TCQ-V21.C: 889: ALL_SUM1=0;
	clrf	(_ALL_SUM1)
	clrf	(_ALL_SUM1+1)
	clrf	(_ALL_SUM1+2)
	clrf	(_ALL_SUM1+3)
	goto	l3726
	line	894
	
l3678:	
;TCQ-V21.C: 894: else if(SUM1_counter>=SUM1_num)
	movf	(_SUM1_num),w
	subwf	(_SUM1_counter),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l3726
u1530:
	line	897
	
l3680:	
;TCQ-V21.C: 895: {
;TCQ-V21.C: 897: if(SUM0>SUM10)
	movf	(_SUM0+3),w
	subwf	(_SUM10+3),w
	skipz
	goto	u1545
	movf	(_SUM0+2),w
	subwf	(_SUM10+2),w
	skipz
	goto	u1545
	movf	(_SUM0+1),w
	subwf	(_SUM10+1),w
	skipz
	goto	u1545
	movf	(_SUM0),w
	subwf	(_SUM10),w
u1545:
	skipnc
	goto	u1541
	goto	u1540
u1541:
	goto	l3686
u1540:
	line	899
	
l3682:	
;TCQ-V21.C: 898: {
;TCQ-V21.C: 899: if(SUM1_num>16)SUM0=SUM10;
	movlw	(011h)
	subwf	(_SUM1_num),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l1284
u1550:
	
l3684:	
	movf	(_SUM10+3),w
	movwf	(_SUM0+3)
	movf	(_SUM10+2),w
	movwf	(_SUM0+2)
	movf	(_SUM10+1),w
	movwf	(_SUM0+1)
	movf	(_SUM10),w
	movwf	(_SUM0)

	goto	l1284
	
l1283:	
	line	900
;TCQ-V21.C: 900: }
	goto	l1284
	line	901
	
l3686:	
;TCQ-V21.C: 901: else if(SUM10>(SUM0+2000))
	movlw	0D0h
	movwf	((??_main+0)+0)
	movlw	07h
	movwf	((??_main+0)+0+1)
	movlw	0
	movwf	((??_main+0)+0+2)
	movlw	0
	movwf	((??_main+0)+0+3)
	movf	(_SUM0),w
	addwf	(??_main+0)+0,f
	movf	(_SUM0+1),w
	skipnc
	incfsz	(_SUM0+1),w
	goto	u1560
	goto	u1561
u1560:
	addwf	(??_main+0)+1,f
u1561:
	movf	(_SUM0+2),w
	skipnc
	incfsz	(_SUM0+2),w
	goto	u1562
	goto	u1563
u1562:
	addwf	(??_main+0)+2,f
u1563:
	movf	(_SUM0+3),w
	skipnc
	incf	(_SUM0+3),w
	addwf	(??_main+0)+3,f
	movf	(_SUM10+3),w
	subwf	3+(??_main+0)+0,w
	skipz
	goto	u1575
	movf	(_SUM10+2),w
	subwf	2+(??_main+0)+0,w
	skipz
	goto	u1575
	movf	(_SUM10+1),w
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u1575
	movf	(_SUM10),w
	subwf	0+(??_main+0)+0,w
u1575:
	skipnc
	goto	u1571
	goto	u1570
u1571:
	goto	l3712
u1570:
	line	903
	
l3688:	
;TCQ-V21.C: 902: {
;TCQ-V21.C: 903: SUM=SUM10-SUM0;
	movf	(_SUM10+3),w
	movwf	(_SUM+3)
	movf	(_SUM10+2),w
	movwf	(_SUM+2)
	movf	(_SUM10+1),w
	movwf	(_SUM+1)
	movf	(_SUM10),w
	movwf	(_SUM)

	movf	(_SUM0),w
	subwf	(_SUM),f
	movf	(_SUM0+1),w
	skipc
	incfsz	(_SUM0+1),w
	subwf	(_SUM+1),f
	movf	(_SUM0+2),w
	skipc
	incfsz	(_SUM0+2),w
	subwf	(_SUM+2),f
	movf	(_SUM0+3),w
	skipc
	incfsz	(_SUM0+3),w
	subwf	(_SUM+3),f
	line	905
;TCQ-V21.C: 905: if((SUM10<2000000)&&(SUM<100000))
	movlw	0
	subwf	(_SUM10+3),w
	skipz
	goto	u1585
	movlw	01Eh
	subwf	(_SUM10+2),w
	skipz
	goto	u1585
	movlw	084h
	subwf	(_SUM10+1),w
	skipz
	goto	u1585
	movlw	080h
	subwf	(_SUM10),w
u1585:
	skipnc
	goto	u1581
	goto	u1580
u1581:
	goto	l1284
u1580:
	
l3690:	
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1595
	movlw	01h
	subwf	(_SUM+2),w
	skipz
	goto	u1595
	movlw	086h
	subwf	(_SUM+1),w
	skipz
	goto	u1595
	movlw	0A0h
	subwf	(_SUM),w
u1595:
	skipnc
	goto	u1591
	goto	u1590
u1591:
	goto	l1284
u1590:
	line	908
	
l3692:	
;TCQ-V21.C: 907: {
;TCQ-V21.C: 908: if(SUM1_num==32)
	movf	(_SUM1_num),w
	xorlw	020h
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l3698
u1600:
	line	910
	
l3694:	
;TCQ-V21.C: 909: {
;TCQ-V21.C: 910: SUM0+=SUM10;
	movf	(_SUM10),w
	addwf	(_SUM0),f
	movf	(_SUM10+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1611
	addwf	(_SUM0+1),f
u1611:
	movf	(_SUM10+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1612
	addwf	(_SUM0+2),f
u1612:
	movf	(_SUM10+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1613
	addwf	(_SUM0+3),f
u1613:

	line	911
	
l3696:	
;TCQ-V21.C: 911: SUM0/=2;
	clrc
	rrf	(_SUM0+3),f
	rrf	(_SUM0+2),f
	rrf	(_SUM0+1),f
	rrf	(_SUM0),f
	line	912
;TCQ-V21.C: 912: }
	goto	l1284
	line	915
	
l3698:	
;TCQ-V21.C: 913: else
;TCQ-V21.C: 914: {
;TCQ-V21.C: 915: if(SUM>50000)SUM1_num=16;
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1625
	movlw	0
	subwf	(_SUM+2),w
	skipz
	goto	u1625
	movlw	0C3h
	subwf	(_SUM+1),w
	skipz
	goto	u1625
	movlw	051h
	subwf	(_SUM),w
u1625:
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l3702
u1620:
	
l3700:	
	movlw	(010h)
	movwf	(_SUM1_num)
	goto	l1290
	line	916
	
l3702:	
;TCQ-V21.C: 916: else if(SUM>20000)SUM1_num=8;
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1635
	movlw	0
	subwf	(_SUM+2),w
	skipz
	goto	u1635
	movlw	04Eh
	subwf	(_SUM+1),w
	skipz
	goto	u1635
	movlw	021h
	subwf	(_SUM),w
u1635:
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l3706
u1630:
	
l3704:	
	movlw	(08h)
	movwf	(_SUM1_num)
	goto	l1290
	line	917
	
l3706:	
;TCQ-V21.C: 917: else SUM1_num=4;
	movlw	(04h)
	movwf	(_SUM1_num)
	
l1290:	
	line	918
;TCQ-V21.C: 918: if(SUM1_counter>=SUM1_num)
	movf	(_SUM1_num),w
	subwf	(_SUM1_counter),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l1283
u1640:
	goto	l3694
	line	926
	
l3712:	
;TCQ-V21.C: 926: else if((LIGHT>0)&&(TH==12000))
	movf	(_LIGHT+1),w
	iorwf	(_LIGHT),w
	skipnz
	goto	u1651
	goto	u1650
u1651:
	goto	l1284
u1650:
	
l3714:	
		movf	(_TH+1),w
	xorlw	46
	movlw	224
	skipnz
	xorwf	(_TH),w
	iorwf	(_TH+2),w
	iorwf	(_TH+3),w

	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l1284
u1660:
	line	928
	
l3716:	
;TCQ-V21.C: 927: {
;TCQ-V21.C: 928: SUM=SUM10-SUM0;
	movf	(_SUM10+3),w
	movwf	(_SUM+3)
	movf	(_SUM10+2),w
	movwf	(_SUM+2)
	movf	(_SUM10+1),w
	movwf	(_SUM+1)
	movf	(_SUM10),w
	movwf	(_SUM)

	movf	(_SUM0),w
	subwf	(_SUM),f
	movf	(_SUM0+1),w
	skipc
	incfsz	(_SUM0+1),w
	subwf	(_SUM+1),f
	movf	(_SUM0+2),w
	skipc
	incfsz	(_SUM0+2),w
	subwf	(_SUM+2),f
	movf	(_SUM0+3),w
	skipc
	incfsz	(_SUM0+3),w
	subwf	(_SUM+3),f
	line	929
;TCQ-V21.C: 929: TH+=SUM;
	movf	(_SUM),w
	addwf	(_TH),f
	movf	(_SUM+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1671
	addwf	(_TH+1),f
u1671:
	movf	(_SUM+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1672
	addwf	(_TH+2),f
u1672:
	movf	(_SUM+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1673
	addwf	(_TH+3),f
u1673:

	line	932
	
l1284:	
;TCQ-V21.C: 930: }
;TCQ-V21.C: 932: if(SUM1_counter>=SUM1_num)
	movf	(_SUM1_num),w
	subwf	(_SUM1_counter),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l1280
u1680:
	goto	l3674
	line	938
	
l1280:	
	line	950
;TCQ-V21.C: 936: }
;TCQ-V21.C: 937: }
;TCQ-V21.C: 938: }
	
l3726:	
;TCQ-V21.C: 943: }
;TCQ-V21.C: 950: if(stop_times>0)
	movf	(_stop_times),w
	skipz
	goto	u1690
	goto	l3730
u1690:
	line	952
	
l3728:	
;TCQ-V21.C: 951: {
;TCQ-V21.C: 952: stop_times--;
	decf	(_stop_times),f
	line	953
;TCQ-V21.C: 953: }
	goto	l3760
	line	957
	
l3730:	
;TCQ-V21.C: 954: else
;TCQ-V21.C: 955: {
;TCQ-V21.C: 957: if(start_times>0)
	movf	(_start_times+1),w
	iorwf	(_start_times),w
	skipnz
	goto	u1701
	goto	u1700
u1701:
	goto	l3748
u1700:
	line	959
	
l3732:	
;TCQ-V21.C: 958: {
;TCQ-V21.C: 959: if(start_times<70)
	movlw	high(046h)
	subwf	(_start_times+1),w
	movlw	low(046h)
	skipnz
	subwf	(_start_times),w
	skipnc
	goto	u1711
	goto	u1710
u1711:
	goto	l3744
u1710:
	line	961
	
l3734:	
;TCQ-V21.C: 960: {
;TCQ-V21.C: 961: start_times++;
	incf	(_start_times),f
	skipnz
	incf	(_start_times+1),f
	line	968
	
l3736:	
;TCQ-V21.C: 968: if(SUM0>1600000)
	movlw	0
	subwf	(_SUM0+3),w
	skipz
	goto	u1725
	movlw	018h
	subwf	(_SUM0+2),w
	skipz
	goto	u1725
	movlw	06Ah
	subwf	(_SUM0+1),w
	skipz
	goto	u1725
	movlw	01h
	subwf	(_SUM0),w
u1725:
	skipc
	goto	u1721
	goto	u1720
u1721:
	goto	l3740
u1720:
	line	970
	
l3738:	
;TCQ-V21.C: 969: {
;TCQ-V21.C: 970: TH=400000;
	movlw	0
	movwf	(_TH+3)
	movlw	06h
	movwf	(_TH+2)
	movlw	01Ah
	movwf	(_TH+1)
	movlw	080h
	movwf	(_TH)

	line	971
;TCQ-V21.C: 971: }
	goto	l3748
	line	974
	
l3740:	
;TCQ-V21.C: 972: else
;TCQ-V21.C: 973: {
;TCQ-V21.C: 974: SUM=SUM0+TH;
	movf	(_SUM0+3),w
	movwf	(_SUM+3)
	movf	(_SUM0+2),w
	movwf	(_SUM+2)
	movf	(_SUM0+1),w
	movwf	(_SUM+1)
	movf	(_SUM0),w
	movwf	(_SUM)

	movf	(_TH),w
	addwf	(_SUM),f
	movf	(_TH+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1731
	addwf	(_SUM+1),f
u1731:
	movf	(_TH+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1732
	addwf	(_SUM+2),f
u1732:
	movf	(_TH+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1733
	addwf	(_SUM+3),f
u1733:

	line	975
;TCQ-V21.C: 975: if(SUM>2000000)
	movlw	0
	subwf	(_SUM+3),w
	skipz
	goto	u1745
	movlw	01Eh
	subwf	(_SUM+2),w
	skipz
	goto	u1745
	movlw	084h
	subwf	(_SUM+1),w
	skipz
	goto	u1745
	movlw	081h
	subwf	(_SUM),w
u1745:
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l1305
u1740:
	line	977
	
l3742:	
;TCQ-V21.C: 976: {
;TCQ-V21.C: 977: TH=2000000-SUM0;
	movlw	0
	movwf	(_TH+3)
	movlw	01Eh
	movwf	(_TH+2)
	movlw	084h
	movwf	(_TH+1)
	movlw	080h
	movwf	(_TH)

	movf	(_SUM0),w
	subwf	(_TH),f
	movf	(_SUM0+1),w
	skipc
	incfsz	(_SUM0+1),w
	subwf	(_TH+1),f
	movf	(_SUM0+2),w
	skipc
	incfsz	(_SUM0+2),w
	subwf	(_TH+2),f
	movf	(_SUM0+3),w
	skipc
	incfsz	(_SUM0+3),w
	subwf	(_TH+3),f
	goto	l3748
	line	985
	
l3744:	
;TCQ-V21.C: 983: else
;TCQ-V21.C: 984: {
;TCQ-V21.C: 985: TH=12000;
	movlw	0
	movwf	(_TH+3)
	movlw	0
	movwf	(_TH+2)
	movlw	02Eh
	movwf	(_TH+1)
	movlw	0E0h
	movwf	(_TH)

	line	986
	
l3746:	
;TCQ-V21.C: 986: start_times=0;
	clrf	(_start_times)
	clrf	(_start_times+1)
	goto	l3748
	line	987
	
l1305:	
	line	991
	
l3748:	
;TCQ-V21.C: 992: {
;TCQ-V21.C: 997: if((light_ad<=255)||(start_times>0))
	movf	(_SUM0),w
	addwf	(_TH),w
	movwf	((??_main+0)+0+0)
	movlw	0
	skipnc
	movlw	1
	addwf	(_SUM0+1),w
	clrf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+2),f
	addwf	(_TH+1),w
	movwf	((??_main+0)+0+1)
	skipnc
	incf	((??_main+0)+0+2),f
	movf	(_SUM0+2),w
	addwf	((??_main+0)+0+2),w
	clrf	((??_main+0)+0+3)
	skipnc
	incf	((??_main+0)+0+3),f
	addwf	(_TH+2),w
	movwf	((??_main+0)+0+2)
	skipnc
	incf	((??_main+0)+0+3),f
	movf	(_SUM0+3),w
	addwf	((??_main+0)+0+3),w
	addwf	(_TH+3),w
	movwf	((??_main+0)+0+3)
	movf	(_SUM1+3),w
	subwf	3+(??_main+0)+0,w
	skipz
	goto	u1755
	movf	(_SUM1+2),w
	subwf	2+(??_main+0)+0,w
	skipz
	goto	u1755
	movf	(_SUM1+1),w
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u1755
	movf	(_SUM1),w
	subwf	0+(??_main+0)+0,w
u1755:
	skipnc
	goto	u1751
	goto	u1750
u1751:
	goto	l3760
u1750:
	line	999
	
l3750:	
;TCQ-V21.C: 998: {
;TCQ-V21.C: 999: send_data(0xaa);
	movlw	(0AAh)
	fcall	_send_data
	line	1008
	
l3752:	
;TCQ-V21.C: 1011: wave=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LIGHT)
	incf	(_LIGHT),f
	clrf	(_LIGHT+1)
	line	1012
	
l3754:	
;TCQ-V21.C: 1012: PC0=0;
	bcf	(56/8),(56)&7
	line	1014
	
l3756:	
;TCQ-V21.C: 1014: SUM1_num=4;
	movlw	(04h)
	movwf	(_SUM1_num)
	line	1016
	
l3758:	
;TCQ-V21.C: 1016: send_data(0xaa);
	movlw	(0AAh)
	fcall	_send_data
	line	1036
	
l3760:	
;TCQ-V21.C: 1018: }
;TCQ-V21.C: 1019: }
;TCQ-V21.C: 1029: }
;TCQ-V21.C: 1034: }
;TCQ-V21.C: 1036: SUM=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_SUM)
	clrf	(_SUM+1)
	clrf	(_SUM+2)
	clrf	(_SUM+3)
	line	1040
	
l3762:	
;TCQ-V21.C: 1038: }
;TCQ-V21.C: 1040: if((times&0x00ff)==0)
	movf	(_times),f
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l3540
u1760:
	line	1042
	
l3764:	
;TCQ-V21.C: 1041: {
;TCQ-V21.C: 1042: if(times==0)SUM2=SUM1;
	movf	((_times+1)),w
	iorwf	((_times)),w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l3768
u1770:
	line	1044
	
l3766:	
# 1044 "TCQ-V21.C"
        Clrwdt ;#
psect	maintext
	line	1050
	
l3768:	
;TCQ-V21.C: 1050: DelayUs(228);
	movlw	(0E4h)
	fcall	_DelayUs
	line	1170
	
l3770:	
;TCQ-V21.C: 1170: if(times==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_times+1)),w
	iorwf	((_times)),w
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l3540
u1780:
	line	1172
	
l3772:	
;TCQ-V21.C: 1171: {
;TCQ-V21.C: 1172: SUM1=0;
	clrf	(_SUM1)
	clrf	(_SUM1+1)
	clrf	(_SUM1+2)
	clrf	(_SUM1+3)
	line	1174
	
l3774:	
;TCQ-V21.C: 1174: if(LIGHT>0)
	movf	(_LIGHT+1),w
	iorwf	(_LIGHT),w
	skipnz
	goto	u1791
	goto	u1790
u1791:
	goto	l3540
u1790:
	line	1176
	
l3776:	
;TCQ-V21.C: 1175: {
;TCQ-V21.C: 1176: LIGHT++;
	incf	(_LIGHT),f
	skipnz
	incf	(_LIGHT+1),f
	line	1177
	
l3778:	
;TCQ-V21.C: 1177: if(LIGHT>15)
	movlw	high(010h)
	subwf	(_LIGHT+1),w
	movlw	low(010h)
	skipnz
	subwf	(_LIGHT),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l1250
u1800:
	line	1179
	
l3780:	
;TCQ-V21.C: 1178: {
;TCQ-V21.C: 1179: LIGHT=0;
	clrf	(_LIGHT)
	clrf	(_LIGHT+1)
	line	713
;TCQ-V21.C: 1181: }
;TCQ-V21.C: 1182: }
;TCQ-V21.C: 1183: }
;TCQ-V21.C: 1185: }
;TCQ-V21.C: 1201: }
;TCQ-V21.C: 1204: wave=0;
	
l1313:	
	line	1205
;TCQ-V21.C: 1205: PC0=1;
	bsf	(56/8),(56)&7
	line	1206
	
l3782:	
;TCQ-V21.C: 1206: delay_sub(4);
	movlw	(04h)
	fcall	_delay_sub
	line	1218
	
l3784:	
;TCQ-V21.C: 1218: SUM=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_SUM)
	clrf	(_SUM+1)
	clrf	(_SUM+2)
	clrf	(_SUM+3)
	line	1219
	
l3786:	
;TCQ-V21.C: 1219: SUM1=0;
	clrf	(_SUM1)
	clrf	(_SUM1+1)
	clrf	(_SUM1+2)
	clrf	(_SUM1+3)
	line	1220
	
l3788:	
;TCQ-V21.C: 1221: SUM16=0;
	clrf	(_times)
	clrf	(_times+1)
	line	1222
	
l3790:	
;TCQ-V21.C: 1222: calc_average_times=0;
	clrf	(_calc_average_times)
	line	1223
	
l3792:	
;TCQ-V21.C: 1223: SUM1_num=32;
	movlw	(020h)
	movwf	(_SUM1_num)
	line	1225
	
l3794:	
;TCQ-V21.C: 1225: stop_times=2;
	movlw	(02h)
	movwf	(_stop_times)
	line	1227
	
l3796:	
;TCQ-V21.C: 1227: TH=12000;
	movlw	0
	movwf	(_TH+3)
	movlw	0
	movwf	(_TH+2)
	movlw	02Eh
	movwf	(_TH+1)
	movlw	0E0h
	movwf	(_TH)

	line	1229
	
l3798:	
;TCQ-V21.C: 1229: SUM1_counter=0;
	clrf	(_SUM1_counter)
	line	1230
	
l3800:	
;TCQ-V21.C: 1230: ALL_SUM1=0;
	clrf	(_ALL_SUM1)
	clrf	(_ALL_SUM1+1)
	clrf	(_ALL_SUM1+2)
	clrf	(_ALL_SUM1+3)
	line	1232
	
l3802:	
;TCQ-V21.C: 1232: send_data(0xdd);
	movlw	(0DDh)
	fcall	_send_data
	line	1233
	
l3804:	
;TCQ-V21.C: 1233: send_data(0xdd);
	movlw	(0DDh)
	fcall	_send_data
	goto	l3540
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1239
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_CS1237_Power_Down
psect	text318,local,class=CODE,delta=2
global __ptext318
__ptext318:

;; *************** function _CS1237_Power_Down *****************
;; Defined at:
;;		line 157 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_sub
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text318
	file	"TCQ-V21.C"
	line	157
	global	__size_of_CS1237_Power_Down
	__size_of_CS1237_Power_Down	equ	__end_of_CS1237_Power_Down-_CS1237_Power_Down
	
_CS1237_Power_Down:	
	opt	stack 5
; Regs used in _CS1237_Power_Down: [wreg+status,2+status,0+pclath+cstack]
	line	159
	
l3484:	
;TCQ-V21.C: 159: PA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	160
	
l3486:	
;TCQ-V21.C: 160: delay_sub(1);
	movlw	(01h)
	fcall	_delay_sub
	line	162
	
l3488:	
;TCQ-V21.C: 162: PA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(46/8),(46)&7
	line	164
	
l3490:	
;TCQ-V21.C: 164: PA6=1;
	bsf	(46/8),(46)&7
	line	165
;TCQ-V21.C: 165: delay_sub(1);
	movlw	(01h)
	fcall	_delay_sub
	line	166
	
l1183:	
	return
	opt stack 0
GLOBAL	__end_of_CS1237_Power_Down
	__end_of_CS1237_Power_Down:
;; =============== function _CS1237_Power_Down ends ============

	signat	_CS1237_Power_Down,88
	global	_Read_CS1237
psect	text319,local,class=CODE,delta=2
global __ptext319
__ptext319:

;; *************** function _Read_CS1237 *****************
;; Defined at:
;;		line 415 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  dat             4    6[COMMON] long 
;;  i               1   10[COMMON] unsigned char 
;;  count_i         1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  4    2[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         5       0       0
;;      Temps:          0       0       0
;;      Totals:         9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text319
	file	"TCQ-V21.C"
	line	415
	global	__size_of_Read_CS1237
	__size_of_Read_CS1237	equ	__end_of_Read_CS1237-_Read_CS1237
	
_Read_CS1237:	
	opt	stack 6
; Regs used in _Read_CS1237: [wreg+status,2+status,0+pclath+cstack]
	line	417
	
l3434:	
;TCQ-V21.C: 418: unsigned char count_i=0;
	clrf	(Read_CS1237@dat)
	clrf	(Read_CS1237@dat+1)
	clrf	(Read_CS1237@dat+2)
	clrf	(Read_CS1237@dat+3)
	line	420
;TCQ-V21.C: 420: PA6=0;
	bcf	(46/8),(46)&7
	line	421
;TCQ-V21.C: 421: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	422
;TCQ-V21.C: 422: while(PC3==1)
	goto	l1229
	line	424
	
l3436:	
;TCQ-V21.C: 425: count_i++;
	movlw	(088h)
	fcall	_DelayUs
	line	434
;TCQ-V21.C: 426: if(count_i > 300)
	
l1229:	
	line	422
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(59/8),(59)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l3436
u1140:
	line	436
	
l3444:	
;TCQ-V21.C: 433: }
;TCQ-V21.C: 434: }
;TCQ-V21.C: 436: for(i=0;i<24;i++)
	clrf	(Read_CS1237@i)
	line	437
	
l1234:	
	line	438
;TCQ-V21.C: 437: {
;TCQ-V21.C: 438: PA6=1;
	bsf	(46/8),(46)&7
	line	439
	
l3450:	
;TCQ-V21.C: 439: DelayUs(1);
	movlw	(01h)
	fcall	_DelayUs
	line	441
	
l3452:	
;TCQ-V21.C: 441: dat <<= 1;
	clrc
	rlf	(Read_CS1237@dat),f
	rlf	(Read_CS1237@dat+1),f
	rlf	(Read_CS1237@dat+2),f
	rlf	(Read_CS1237@dat+3),f
	line	442
	
l3454:	
;TCQ-V21.C: 442: if(PC3==1)
	btfss	(59/8),(59)&7
	goto	u1151
	goto	u1150
u1151:
	goto	l3458
u1150:
	line	444
	
l3456:	
;TCQ-V21.C: 443: {
;TCQ-V21.C: 444: dat ++;
	incf	(Read_CS1237@dat),f
	skipnz
	incf	(Read_CS1237@dat+1),f
	skipnz
	incf	(Read_CS1237@dat+2),f
	skipnz
	incf	(Read_CS1237@dat+3),f
	line	446
	
l3458:	
;TCQ-V21.C: 445: }
;TCQ-V21.C: 446: PA6=0;
	bcf	(46/8),(46)&7
	line	447
	
l3460:	
;TCQ-V21.C: 447: DelayUs(1);
	movlw	(01h)
	fcall	_DelayUs
	line	436
	
l3462:	
	incf	(Read_CS1237@i),f
	
l3464:	
	movlw	(018h)
	subwf	(Read_CS1237@i),w
	skipc
	goto	u1161
	goto	u1160
u1161:
	goto	l1234
u1160:
	line	449
	
l3466:	
;TCQ-V21.C: 448: }
;TCQ-V21.C: 449: for(i=0;i<3;i++)
	clrf	(Read_CS1237@i)
	line	450
	
l1237:	
	line	451
;TCQ-V21.C: 450: {
;TCQ-V21.C: 451: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3472:	
	movlw	(01h)
	fcall	_DelayUs
	
l3474:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	449
	
l3476:	
	incf	(Read_CS1237@i),f
	
l3478:	
	movlw	(03h)
	subwf	(Read_CS1237@i),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l1237
u1170:
	line	457
	
l3480:	
;TCQ-V21.C: 452: }
;TCQ-V21.C: 457: return dat;
	movf	(Read_CS1237@dat+3),w
	movwf	(?_Read_CS1237+3)
	movf	(Read_CS1237@dat+2),w
	movwf	(?_Read_CS1237+2)
	movf	(Read_CS1237@dat+1),w
	movwf	(?_Read_CS1237+1)
	movf	(Read_CS1237@dat),w
	movwf	(?_Read_CS1237)

	line	458
	
l1232:	
	return
	opt stack 0
GLOBAL	__end_of_Read_CS1237
	__end_of_Read_CS1237:
;; =============== function _Read_CS1237 ends ============

	signat	_Read_CS1237,92
	global	_Read_CON
psect	text320,local,class=CODE,delta=2
global __ptext320
__ptext320:

;; *************** function _Read_CON *****************
;; Defined at:
;;		line 356 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  count_i         2    2[COMMON] unsigned short 
;;  i               1    5[COMMON] unsigned char 
;;  dat             1    4[COMMON] unsigned char 
;;  j               1    0        unsigned char 
;;  k               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text320
	file	"TCQ-V21.C"
	line	356
	global	__size_of_Read_CON
	__size_of_Read_CON	equ	__end_of_Read_CON-_Read_CON
	
_Read_CON:	
	opt	stack 6
; Regs used in _Read_CON: [wreg+status,2+status,0+pclath+cstack]
	line	358
	
l3326:	
	line	359
;TCQ-V21.C: 360: unsigned char k=0,j=0;
	clrf	(Read_CON@count_i)
	clrf	(Read_CON@count_i+1)
	line	361
	
l3328:	
;TCQ-V21.C: 361: PA6=0;
	bcf	(46/8),(46)&7
	line	362
	
l3330:	
;TCQ-V21.C: 362: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	363
;TCQ-V21.C: 363: while(PC3 ==1)
	goto	l1217
	line	365
	
l3332:	
;TCQ-V21.C: 364: {
;TCQ-V21.C: 365: DelayUs(5000);
	movlw	(088h)
	fcall	_DelayUs
	line	366
	
l3334:	
;TCQ-V21.C: 366: count_i++;
	incf	(Read_CON@count_i),f
	skipnz
	incf	(Read_CON@count_i+1),f
	line	367
	
l3336:	
;TCQ-V21.C: 367: if(count_i > 15000)
	movlw	high(03A99h)
	subwf	(Read_CON@count_i+1),w
	movlw	low(03A99h)
	skipnz
	subwf	(Read_CON@count_i),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l1217
u1090:
	line	369
	
l3338:	
;TCQ-V21.C: 368: {
;TCQ-V21.C: 369: PA6=1;
	bsf	(46/8),(46)&7
	line	370
;TCQ-V21.C: 370: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	371
;TCQ-V21.C: 371: PC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	373
	
l3340:	
;TCQ-V21.C: 373: return 0XFF;
	movlw	(0FFh)
	goto	l1220
	line	375
	
l1217:	
	line	363
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(59/8),(59)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l3332
u1100:
	line	376
	
l3344:	
;TCQ-V21.C: 374: }
;TCQ-V21.C: 375: }
;TCQ-V21.C: 376: for(i=0;i<29;i++)
	clrf	(Read_CON@i)
	line	377
	
l1222:	
	line	378
;TCQ-V21.C: 377: {
;TCQ-V21.C: 378: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3350:	
	movlw	(01h)
	fcall	_DelayUs
	
l3352:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	376
	
l3354:	
	incf	(Read_CON@i),f
	
l3356:	
	movlw	(01Dh)
	subwf	(Read_CON@i),w
	skipc
	goto	u1111
	goto	u1110
u1111:
	goto	l1222
u1110:
	
l1223:	
	line	380
;TCQ-V21.C: 379: }
;TCQ-V21.C: 380: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	381
;TCQ-V21.C: 381: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	
l3358:	
	movlw	(01h)
	fcall	_DelayUs
	
l3360:	
	bsf	(59/8),(59)&7
	
l3362:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	382
	
l3364:	
;TCQ-V21.C: 382: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3366:	
	bcf	(59/8),(59)&7
	
l3368:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	383
	
l3370:	
;TCQ-V21.C: 383: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3372:	
	bsf	(59/8),(59)&7
	
l3374:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	384
	
l3376:	
;TCQ-V21.C: 384: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3378:	
	bcf	(59/8),(59)&7
	
l3380:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	385
	
l3382:	
;TCQ-V21.C: 385: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3384:	
	bsf	(59/8),(59)&7
	
l3386:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	386
	
l3388:	
;TCQ-V21.C: 386: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3390:	
	bsf	(59/8),(59)&7
	
l3392:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	387
	
l3394:	
;TCQ-V21.C: 387: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3396:	
	bcf	(59/8),(59)&7
	
l3398:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	388
	
l3400:	
;TCQ-V21.C: 388: PC3=1;
	bsf	(59/8),(59)&7
	line	389
	
l3402:	
;TCQ-V21.C: 389: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3404:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	390
	
l3406:	
;TCQ-V21.C: 390: dat=0;
	clrf	(Read_CON@dat)
	line	391
	
l3408:	
;TCQ-V21.C: 391: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	392
	
l3410:	
;TCQ-V21.C: 392: for(i=0;i<8;i++)
	clrf	(Read_CON@i)
	line	393
	
l1224:	
	line	394
;TCQ-V21.C: 393: {
;TCQ-V21.C: 394: dat <<= 1;
	clrc
	rlf	(Read_CON@dat),f
	line	395
;TCQ-V21.C: 395: PA6=1;DelayUs(1); PA6=0;DelayUs(1);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	
l3416:	
	movlw	(01h)
	fcall	_DelayUs
	
l3418:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	396
	
l3420:	
;TCQ-V21.C: 396: if(PC3 ==1)
	btfss	(59/8),(59)&7
	goto	u1121
	goto	u1120
u1121:
	goto	l1226
u1120:
	line	398
	
l3422:	
;TCQ-V21.C: 398: dat++;
	incf	(Read_CON@dat),f
	
l1226:	
	line	392
	incf	(Read_CON@i),f
	
l3424:	
	movlw	(08h)
	subwf	(Read_CON@i),w
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l1224
u1130:
	
l1225:	
	line	403
;TCQ-V21.C: 402: }
;TCQ-V21.C: 403: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3426:	
	movlw	(01h)
	fcall	_DelayUs
	
l3428:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	404
	
l3430:	
;TCQ-V21.C: 404: return dat;
	movf	(Read_CON@dat),w
	line	405
	
l1220:	
	return
	opt stack 0
GLOBAL	__end_of_Read_CON
	__end_of_Read_CON:
;; =============== function _Read_CON ends ============

	signat	_Read_CON,89
	global	_Con_CS1237
psect	text321,local,class=CODE,delta=2
global __ptext321
__ptext321:

;; *************** function _Con_CS1237 *****************
;; Defined at:
;;		line 302 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  count_i         2    2[COMMON] unsigned short 
;;  i               1    5[COMMON] unsigned char 
;;  dat             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text321
	file	"TCQ-V21.C"
	line	302
	global	__size_of_Con_CS1237
	__size_of_Con_CS1237	equ	__end_of_Con_CS1237-_Con_CS1237
	
_Con_CS1237:	
	opt	stack 6
; Regs used in _Con_CS1237: [wreg+status,2+status,0+pclath+cstack]
	line	305
	
l3230:	
;TCQ-V21.C: 303: unsigned char i;
;TCQ-V21.C: 304: unsigned char dat;
;TCQ-V21.C: 305: unsigned short count_i=0;
	clrf	(Con_CS1237@count_i)
	clrf	(Con_CS1237@count_i+1)
	line	312
	
l3232:	
;TCQ-V21.C: 312: dat = 0B00111100;
	movlw	(03Ch)
	movwf	(Con_CS1237@dat)
	line	313
	
l3234:	
;TCQ-V21.C: 313: PA6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7
	line	314
;TCQ-V21.C: 314: while(PC3 ==1)
	goto	l1204
	line	316
	
l3236:	
;TCQ-V21.C: 315: {
;TCQ-V21.C: 316: DelayUs(500);
	movlw	(0F4h)
	fcall	_DelayUs
	line	317
	
l3238:	
;TCQ-V21.C: 317: count_i++;
	incf	(Con_CS1237@count_i),f
	skipnz
	incf	(Con_CS1237@count_i+1),f
	line	318
	
l3240:	
;TCQ-V21.C: 318: if(count_i > 15000)
	movlw	high(03A99h)
	subwf	(Con_CS1237@count_i+1),w
	movlw	low(03A99h)
	skipnz
	subwf	(Con_CS1237@count_i),w
	skipc
	goto	u1041
	goto	u1040
u1041:
	goto	l1204
u1040:
	line	320
	
l3242:	
;TCQ-V21.C: 319: {
;TCQ-V21.C: 320: PA6=1;
	bsf	(46/8),(46)&7
	line	321
;TCQ-V21.C: 321: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	322
;TCQ-V21.C: 322: PC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	324
;TCQ-V21.C: 324: return;
	goto	l1207
	line	326
	
l1204:	
	line	314
	btfsc	(59/8),(59)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l3236
u1050:
	
l1208:	
	line	327
;TCQ-V21.C: 325: }
;TCQ-V21.C: 326: }
;TCQ-V21.C: 327: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	328
	
l3244:	
;TCQ-V21.C: 328: for(i=0;i<29;i++)
	clrf	(Con_CS1237@i)
	line	329
	
l1209:	
	line	330
;TCQ-V21.C: 329: {
;TCQ-V21.C: 330: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	
l3250:	
	movlw	(01h)
	fcall	_DelayUs
	
l3252:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	328
	
l3254:	
	incf	(Con_CS1237@i),f
	
l3256:	
	movlw	(01Dh)
	subwf	(Con_CS1237@i),w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l1209
u1060:
	
l1210:	
	line	332
;TCQ-V21.C: 331: }
;TCQ-V21.C: 332: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3258:	
	movlw	(01h)
	fcall	_DelayUs
	
l3260:	
	bsf	(59/8),(59)&7
	
l3262:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	333
	
l3264:	
;TCQ-V21.C: 333: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3266:	
	bsf	(59/8),(59)&7
	
l3268:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	334
	
l3270:	
;TCQ-V21.C: 334: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3272:	
	bcf	(59/8),(59)&7
	
l3274:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	335
	
l3276:	
;TCQ-V21.C: 335: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3278:	
	bcf	(59/8),(59)&7
	
l3280:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	336
	
l3282:	
;TCQ-V21.C: 336: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3284:	
	bsf	(59/8),(59)&7
	
l3286:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	337
	
l3288:	
;TCQ-V21.C: 337: PA6=1;DelayUs(1);PC3=0;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3290:	
	bcf	(59/8),(59)&7
	
l3292:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	338
	
l3294:	
;TCQ-V21.C: 338: PA6=1;DelayUs(1);PC3=1;PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3296:	
	bsf	(59/8),(59)&7
	
l3298:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	339
	
l3300:	
;TCQ-V21.C: 339: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	
l3302:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	340
	
l3304:	
;TCQ-V21.C: 340: for(i=0;i<8;i++)
	clrf	(Con_CS1237@i)
	line	341
	
l1211:	
	line	342
;TCQ-V21.C: 341: {
;TCQ-V21.C: 342: PA6=1;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3310:	
	movlw	(01h)
	fcall	_DelayUs
	line	343
	
l3312:	
;TCQ-V21.C: 343: if(dat&0x80)
	btfss	(Con_CS1237@dat),(7)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l1213
u1070:
	line	344
	
l3314:	
;TCQ-V21.C: 344: PC3=1;
	bsf	(59/8),(59)&7
	goto	l1214
	line	345
	
l1213:	
	line	346
;TCQ-V21.C: 345: else
;TCQ-V21.C: 346: PC3=0;
	bcf	(59/8),(59)&7
	
l1214:	
	line	348
;TCQ-V21.C: 348: dat <<= 1;
	clrc
	rlf	(Con_CS1237@dat),f
	line	349
;TCQ-V21.C: 349: PA6=0;DelayUs(1);
	bcf	(46/8),(46)&7
	
l3316:	
	movlw	(01h)
	fcall	_DelayUs
	line	340
	
l3318:	
	incf	(Con_CS1237@i),f
	
l3320:	
	movlw	(08h)
	subwf	(Con_CS1237@i),w
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l1211
u1080:
	
l1212:	
	line	351
;TCQ-V21.C: 350: }
;TCQ-V21.C: 351: PA6=1;DelayUs(1);PA6=0;DelayUs(1);
	bsf	(46/8),(46)&7
	
l3322:	
	movlw	(01h)
	fcall	_DelayUs
	
l3324:	
	bcf	(46/8),(46)&7
	movlw	(01h)
	fcall	_DelayUs
	line	353
	
l1207:	
	return
	opt stack 0
GLOBAL	__end_of_Con_CS1237
	__end_of_Con_CS1237:
;; =============== function _Con_CS1237 ends ============

	signat	_Con_CS1237,88
	global	_read_ad
psect	text322,local,class=CODE,delta=2
global __ptext322
__ptext322:

;; *************** function _read_ad *****************
;; Defined at:
;;		line 263 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    4[COMMON] unsigned char 
;;  ad_sum          2    5[COMMON] unsigned int 
;;  i               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          2       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text322
	file	"TCQ-V21.C"
	line	263
	global	__size_of_read_ad
	__size_of_read_ad	equ	__end_of_read_ad-_read_ad
	
_read_ad:	
	opt	stack 6
; Regs used in _read_ad: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;read_ad@ch stored from wreg
	line	265
	movwf	(read_ad@ch)
	
l3194:	
;TCQ-V21.C: 264: unsigned char i;
;TCQ-V21.C: 265: unsigned int ad_sum=0;
	clrf	(read_ad@ad_sum)
	clrf	(read_ad@ad_sum+1)
	line	269
	
l3196:	
;TCQ-V21.C: 269: ADCON0 = ch;
	movf	(read_ad@ch),w
	movwf	(31)	;volatile
	line	271
	
l3198:	
;TCQ-V21.C: 271: DelayUs(100);
	movlw	(064h)
	fcall	_DelayUs
	line	272
	
l3200:	
;TCQ-V21.C: 272: GO_DONE = 1;
	bsf	(249/8),(249)&7
	line	273
	
l3202:	
;TCQ-V21.C: 273: DelayUs(100);
	movlw	(064h)
	fcall	_DelayUs
	line	275
	
l3204:	
;TCQ-V21.C: 275: for(i=0;i<16;i++)
	clrf	(read_ad@i)
	line	276
	
l1196:	
	line	277
;TCQ-V21.C: 276: {
;TCQ-V21.C: 277: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	278
;TCQ-V21.C: 278: while( GO_DONE==1 );
	
l1198:	
	btfsc	(249/8),(249)&7
	goto	u1011
	goto	u1010
u1011:
	goto	l1198
u1010:
	line	280
	
l3208:	
;TCQ-V21.C: 280: ad_sum+= ADRESH<<8;
	movf	(30),w	;volatile
	movwf	(??_read_ad+0)+0
	clrf	(??_read_ad+0)+0+1
	movf	(??_read_ad+0)+0,w
	movwf	(??_read_ad+0)+1
	clrf	(??_read_ad+0)+0
	movf	0+(??_read_ad+0)+0,w
	addwf	(read_ad@ad_sum),f
	skipnc
	incf	(read_ad@ad_sum+1),f
	movf	1+(??_read_ad+0)+0,w
	addwf	(read_ad@ad_sum+1),f
	line	281
	
l3210:	
;TCQ-V21.C: 281: ad_sum+= ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	addwf	(read_ad@ad_sum),f
	skipnc
	incf	(read_ad@ad_sum+1),f
	line	282
	
l3212:	
;TCQ-V21.C: 282: DelayUs(20);
	movlw	(014h)
	fcall	_DelayUs
	line	275
	
l3214:	
	incf	(read_ad@i),f
	
l3216:	
	movlw	(010h)
	subwf	(read_ad@i),w
	skipc
	goto	u1021
	goto	u1020
u1021:
	goto	l1196
u1020:
	line	285
	
l3218:	
;TCQ-V21.C: 283: }
;TCQ-V21.C: 285: ad_sum>>=6;
	movlw	06h
	
u1035:
	clrc
	rrf	(read_ad@ad_sum+1),f
	rrf	(read_ad@ad_sum),f
	addlw	-1
	skipz
	goto	u1035
	line	286
	
l3220:	
;TCQ-V21.C: 286: i=ad_sum;
	movf	(read_ad@ad_sum),w
	movwf	(read_ad@i)
	line	288
	
l3222:	
;TCQ-V21.C: 288: ADCON0 = 0B10111001;
	movlw	(0B9h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	289
	
l3224:	
;TCQ-V21.C: 289: DelayUs(50);
	movlw	(032h)
	fcall	_DelayUs
	line	291
	
l3226:	
;TCQ-V21.C: 291: return i;
	movf	(read_ad@i),w
	line	292
	
l1201:	
	return
	opt stack 0
GLOBAL	__end_of_read_ad
	__end_of_read_ad:
;; =============== function _read_ad ends ============

	signat	_read_ad,4217
	global	_send_data
psect	text323,local,class=CODE,delta=2
global __ptext323
__ptext323:

;; *************** function _send_data *****************
;; Defined at:
;;		line 196 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;  d               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  d               1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text323
	file	"TCQ-V21.C"
	line	196
	global	__size_of_send_data
	__size_of_send_data	equ	__end_of_send_data-_send_data
	
_send_data:	
	opt	stack 6
; Regs used in _send_data: [wreg+status,2+status,0+pclath+cstack]
;send_data@d stored from wreg
	line	199
	movwf	(send_data@d)
	
l3172:	
;TCQ-V21.C: 197: unsigned char i;
;TCQ-V21.C: 199: TRISA0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	200
;TCQ-V21.C: 200: PA0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	201
	
l3174:	
;TCQ-V21.C: 201: DelayUs(17);
	movlw	(011h)
	fcall	_DelayUs
	line	202
	
l3176:	
;TCQ-V21.C: 202: for(i=0;i<8;i++)
	clrf	(send_data@i)
	line	203
	
l1189:	
	line	204
;TCQ-V21.C: 203: {
;TCQ-V21.C: 204: if((d&0x01)==0)
	btfsc	(send_data@d),(0)&7
	goto	u991
	goto	u990
u991:
	goto	l1191
u990:
	line	207
	
l3182:	
;TCQ-V21.C: 205: {
;TCQ-V21.C: 207: PA0=0;
	bcf	(40/8),(40)&7
	line	208
;TCQ-V21.C: 208: }
	goto	l3184
	line	209
	
l1191:	
	line	212
;TCQ-V21.C: 209: else
;TCQ-V21.C: 210: {
;TCQ-V21.C: 212: PA0=1;
	bsf	(40/8),(40)&7
	line	214
	
l3184:	
;TCQ-V21.C: 213: }
;TCQ-V21.C: 214: DelayUs(17);
	movlw	(011h)
	fcall	_DelayUs
	line	217
	
l3186:	
;TCQ-V21.C: 217: d>>=1;
	clrc
	rrf	(send_data@d),f
	line	202
	
l3188:	
	incf	(send_data@i),f
	
l3190:	
	movlw	(08h)
	subwf	(send_data@i),w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l1189
u1000:
	
l1190:	
	line	220
;TCQ-V21.C: 218: }
;TCQ-V21.C: 220: PA0=1;
	bsf	(40/8),(40)&7
	line	221
;TCQ-V21.C: 221: TRISA0=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1064/8)^080h,(1064)&7
	line	222
	
l3192:	
;TCQ-V21.C: 222: DelayUs(50);
	movlw	(032h)
	fcall	_DelayUs
	line	225
	
l1193:	
	return
	opt stack 0
GLOBAL	__end_of_send_data
	__end_of_send_data:
;; =============== function _send_data ends ============

	signat	_send_data,4216
	global	_delay_sub
psect	text324,local,class=CODE,delta=2
global __ptext324
__ptext324:

;; *************** function _delay_sub *****************
;; Defined at:
;;		line 137 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;  n               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  n               1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_CS1237_Power_Down
;;		_main
;; This function uses a non-reentrant model
;;
psect	text324
	file	"TCQ-V21.C"
	line	137
	global	__size_of_delay_sub
	__size_of_delay_sub	equ	__end_of_delay_sub-_delay_sub
	
_delay_sub:	
	opt	stack 6
; Regs used in _delay_sub: [wreg+status,2+status,0+pclath+cstack]
;delay_sub@n stored from wreg
	line	140
	movwf	(delay_sub@n)
	
l3154:	
;TCQ-V21.C: 138: unsigned char i;
;TCQ-V21.C: 140: for(;n>0;n--)
	movf	(delay_sub@n),f
	skipz
	goto	u961
	goto	u960
u961:
	goto	l3158
u960:
	goto	l1180
	line	142
	
l3158:	
;TCQ-V21.C: 141: {
;TCQ-V21.C: 142: for(i=0;i<250;i++)DelayUs(228);
	clrf	(delay_sub@i)
	
l3164:	
	movlw	(0E4h)
	fcall	_DelayUs
	
l3166:	
	incf	(delay_sub@i),f
	
l3168:	
	movlw	(0FAh)
	subwf	(delay_sub@i),w
	skipc
	goto	u971
	goto	u970
u971:
	goto	l3164
u970:
	
l1179:	
	line	144
# 144 "TCQ-V21.C"
         Clrwdt ;#
psect	text324
	line	140
	
l3170:	
	decf	(delay_sub@n),f
	movf	(delay_sub@n),f
	skipz
	goto	u981
	goto	u980
u981:
	goto	l3158
u980:
	line	149
	
l1180:	
	return
	opt stack 0
GLOBAL	__end_of_delay_sub
	__end_of_delay_sub:
;; =============== function _delay_sub ends ============

	signat	_delay_sub,4216
	global	___lldiv
psect	text325,local,class=CODE,delta=2
global __ptext325
__ptext325:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    8[COMMON] unsigned long 
;;  counter         1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         8       0       0
;;      Locals:         5       0       0
;;      Temps:          0       0       0
;;      Totals:        13       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text325
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 7
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l3128:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	10
	
l3130:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u921
	goto	u920
u921:
	goto	l3150
u920:
	line	11
	
l3132:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	12
	goto	l3136
	line	13
	
l3134:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	14
	incf	(___lldiv@counter),f
	line	12
	
l3136:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u931
	goto	u930
u931:
	goto	l3134
u930:
	line	17
	
l3138:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	18
	
l3140:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u945
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u945
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u945
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u945:
	skipc
	goto	u941
	goto	u940
u941:
	goto	l3146
u940:
	line	19
	
l3142:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l3144:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	22
	
l3146:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	23
	
l3148:	
	decfsz	(___lldiv@counter),f
	goto	u951
	goto	u950
u951:
	goto	l3138
u950:
	line	25
	
l3150:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	26
	
l2165:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	_ADC_INITIAL
psect	text326,local,class=CODE,delta=2
global __ptext326
__ptext326:

;; *************** function _ADC_INITIAL *****************
;; Defined at:
;;		line 174 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text326
	file	"TCQ-V21.C"
	line	174
	global	__size_of_ADC_INITIAL
	__size_of_ADC_INITIAL	equ	__end_of_ADC_INITIAL-_ADC_INITIAL
	
_ADC_INITIAL:	
	opt	stack 7
; Regs used in _ADC_INITIAL: [wreg]
	line	179
	
l3126:	
;TCQ-V21.C: 179: ADCON1 = 0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	184
;TCQ-V21.C: 184: ADCON0 = 0B10111001;
	movlw	(0B9h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	192
;TCQ-V21.C: 192: ANSEL = 0B00100001;
	movlw	(021h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	193
	
l1186:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_INITIAL
	__end_of_ADC_INITIAL:
;; =============== function _ADC_INITIAL ends ============

	signat	_ADC_INITIAL,88
	global	_DelayUs
psect	text327,local,class=CODE,delta=2
global __ptext327
__ptext327:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 128 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[COMMON] unsigned char 
;;  a               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_delay_sub
;;		_send_data
;;		_read_ad
;;		_Con_CS1237
;;		_Read_CON
;;		_Read_CS1237
;;		_main
;; This function uses a non-reentrant model
;;
psect	text327
	file	"TCQ-V21.C"
	line	128
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 6
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	130
	movwf	(DelayUs@Time)
	
l3120:	
;TCQ-V21.C: 129: unsigned char a;
;TCQ-V21.C: 130: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l3124
	
l3122:	
;TCQ-V21.C: 131: {
	incf	(DelayUs@a),f
	
l3124:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u911
	goto	u910
u911:
	goto	l3122
u910:
	line	134
	
l1173:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_POWER_INITIAL
psect	text328,local,class=CODE,delta=2
global __ptext328
__ptext328:

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 96 in file "TCQ-V21.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text328
	file	"TCQ-V21.C"
	line	96
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 7
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	97
	
l3102:	
;TCQ-V21.C: 97: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	104
	
l3104:	
;TCQ-V21.C: 104: INTCON = 0;
	clrf	(11)	;volatile
	line	105
	
l3106:	
;TCQ-V21.C: 105: PORTA = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	106
	
l3108:	
;TCQ-V21.C: 106: TRISA = 0B10111101;
	movlw	(0BDh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	107
	
l3110:	
;TCQ-V21.C: 107: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	108
;TCQ-V21.C: 108: TRISC = 0B11101100;
	movlw	(0ECh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	110
	
l3112:	
;TCQ-V21.C: 110: WPUA = 0;
	clrf	(149)^080h	;volatile
	line	111
	
l3114:	
;TCQ-V21.C: 111: WPUC = 0;
	clrf	(136)^080h	;volatile
	line	112
;TCQ-V21.C: 112: OPTION = 0B00001101;
	movlw	(0Dh)
	movwf	(129)^080h	;volatile
	line	114
	
l3116:	
;TCQ-V21.C: 114: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	117
	
l3118:	
;TCQ-V21.C: 117: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	119
	
l1167:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
psect	text329,local,class=CODE,delta=2
global __ptext329
__ptext329:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
