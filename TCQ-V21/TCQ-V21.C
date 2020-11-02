/*  �ļ�����TEST_EN8F156_ADC.C
*   ��Ȩ(Copyright):   ������Ӣ����Ƽ����޹�˾ 
*   ��������(IDE):     ENIDE
*   �汾(Version):     V1.0
*   ����(Data):        2014-03-05
*   ���ܣ�             EN8F156-ADC������ʾ
*   IC:                EN8F156 SOP16
*   ����             16M /2T                    
*   ˵����             �������AN2(PA2)�ڵĵ�ѹ������PWM3P(PC4)��ռ�ձ�
*		       AN2�ŵ�ѹԽ��(0-VDD)PWM3P(PC2)ռ�ձ�Խ��(2K,0-99%)	
*                      EN8F156  SOP16 
*               ---------------
*  VDD---------|1(VDD)  (VSS)16|--------GND     
*  NC----------|2(PA7)  (PA0)15|---------NC 
*  NC----------|3(PA6)  (PA1)14|---------NC
*  NC----------|4(PA5)  (PA2)13|--------AN2
*  NC----------|5(PC3)  (PA3)12|---------NC
*  NC----------|6(PC2)  (PC0)11|---------NC
*  NC----------|7(PA4)  (PC1)10|---------NC
*  NC----------|8(PC5)  (PC4)09|-------PWM3
*			    ---------------
*/

//ѭ���ۼ�ÿ2048�Σ�84ms��������ADֵ�����ֱ����ѹ��ƫ��ֵ���൱���������źźϲ��Ļ���ֵ
//�Բ���������С����ֵ��Ϊ��������ֵ������������ֵ�ϵ�������TH��Ϊ�źż�����ޣ�
//������⵽����2048���źŻ���ֵ�������޺���Ϊ��Ŀ�궯��
//�����ƺ�������������ֵ������Ҳ����THֵ����
//һ����������ֵ��4000~8000����Դ��������ʱ���ܻᵽ14000
//�ϵ��⵽PA1��ѹ����2V��������ģʽ����TH����Ϊ�����ޣ��Ա��ڵ�·����ԣ���ʱ30����Զ��ָ�Ϊ��������

//�ĳ�ѭ���ۼ�4096�Σ�168ms����������ֵ

//����20.03.29��XBR201��·�壬TH_LOW=6000~7000�Ϻ���
//��5V��ѹ��Դ����ʱ��������������Ⱥ�̽�����
//������΢���ϣ���W12-AH345T��𲻴�

//�ĳ��ۼ�8192�Σ�340ms����������ֵ
//��Ϊ��΢ģ�飬����̽������

#include "EN8F156.H"


//**********************************************************
//*************************�궨��***************************
#define  unchar     unsigned char 
#define  unint      unsigned int
#define  unlong     unsigned long





#define  TH_LOW		12000
//12000
#define  TH_HIGH	1400000

#define  TH_PIR	2
//���¼�������ֵʱ�������������ֵ����
#define  MAX_DELTA0  4000
//5000

//�й�����-30��Ӧ8LUXʱ��ADֵ������Ϊ255ʱ�൱�ڲ����й�
#define  LIGHT_TH 255
//30

//��ʱʱ��,90��Ӧ30��,15-5S
#define DELAY_NUM 15


#define DAT_1  PC3=1
#define DAT_0  PC3=0

#define SCK_0  PA6=0
#define SCK_1  PA6=1

#define LIGHT_ON  PC0=0
#define LIGHT_OFF PC0=1

	unsigned char i,j,PIR=0,wave=0,symbol=0,SUM1_counter=0,SUM1_num=128,SUM0_num=16;
	unlong SUM1=0,SUM0=0,SUM=0,ALL_SUM1=0,SUM10=0,SUM16=0,SUM2=0,SUM3=0;
	unint k,times=0,time1=0,time2=0,start_times=0;
	unlong TH,MAX_DELTA,PIR_AD,average1,times1=0,times2=0,NOISE_PIR;
	unchar alarm_times=0,stop_times=0,calc_times=0;
   unlong s1=0,s2=0;
	unint average,t,LIGHT=0,Alarm=0;
	unchar light_ad,PIR_ad,MAX_PIR,MIN_PIR,Delay_ad,Delay_time=0,Delay_time_num=0,light_ad0,check_light_times=0,calc_average_times=0,check_sum,send_byte;
	unchar ReadAPin;
  unsigned char ReadCJ;
/*-------------------------------------------------
 *  ��������POWER_INITIAL
 *	���ܣ�  �ϵ�ϵͳ��ʼ��
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{ 
    OSCCON = 0B01110001;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
					 //Bit0=1,ϵͳʱ��Ϊ�ڲ�����
					 //Bit0=0,ʱ��Դ��FOSC<2��0>����������ѡ��ʱѡ��
	//OSCCON = 0B01110000;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
					 //Bit0=1,ϵͳʱ��Ϊ�ڲ�����
					 //Bit0=0,ʱ��Դ��FOSC<2��0>����������ѡ��ʱѡ��

	INTCON = 0;  //�ݽ�ֹ�����ж�
	PORTA = 0B00000010;//  0ʱI/O��Ϊ�����1ʱΪ����
	TRISA = 0B10111101;//PA
	PORTC = 0B00000000; //	PC3=1//ENV12
	TRISC = 0B11101100;//PC

	WPUA = 0;          //��ֹ����PA������
	WPUC = 0;       //��ֹ����PC������
	OPTION = 0B00001101;//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
					 //Bit7(RAPU)=0 ENABLED PULL UP PA
	MSCKCON = 0B00000000;//6B->0,��ֹPA4��PC5��ѹ���
					  //5B->0,TIMER2ʱ��ΪFosc
					  //4B->0,��ֹLVR       
	CMCON0 = 0B00000111; //�رձȽ�����CxINΪ����IO��
//PA6=0;
}
/*------------------------------------------------- 
 *	�������ƣ�DelayUs
 *	���ܣ�    ����ʱ���� --16M-2T--��ſ�1%����.
 *	���������Time  ��ʱʱ�䳤��   ��ʱʱ��TimeUs
 *	���ز������� 
 -------------------------------------------------*/
////��ʱʱ��ΪTime*7/8 us
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{

	}
}  
//��ʱn��50ms
void delay_sub(unchar n)
{
	unchar i;

		for(;n>0;n--)
		{
			for(i=0;i<250;i++)DelayUs(228);	//50ms
 			  #asm
 		      Clrwdt
 			  #endasm		
		}


}
/*-------------------------------------------------
 *  ������:   CS1237_Power_Down
 *	���ܣ�  CS1237����͹���ģʽ
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/
void CS1237_Power_Down(void)
{
        //SCLK = 1;
        SCK_1;
        delay_sub(1);
        //SCLK = 1;
        SCK_1;
        //SCLK = 1;
        SCK_1;
         delay_sub(1);
}
/*-------------------------------------------------
 *  ������:  ADC_INITIAL
 *	���ܣ�  ADC��ʼ��
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/
void ADC_INITIAL (void) 
{
	//ADCON1 = 0B00010000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=001,��ƵFOSC/8
	//ADCON1 = 0B01010000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=101,��ƵFOSC/16
	  ADCON1 = 0B00100000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=101,��ƵFOSC/32

	//ADCON1 = 0B01100000; //DIVS=0,ʱ��ѡFOSC
					   //ADCS[2:0]=110,��ƵFOSC/64
	ADCON0 = 0B10111001; //B7,ADFM=1,����Ҷ���                     
					   //B6:5,VCFG=00,�ο���ѹVDD
					   //B6:5,VCFG=01,�ο���ѹ�ڲ�2V
					   //B6:5,VCFG=11,�ο���ѹVref
					   //B4:2,CHS=110,ѡ��AN6ͨ��
					   //B1,GO,ADת��״̬λ
					   //B0,ADON=1,ADCʹ��
	//ANSEL = 0B00000100;   //ʹ��AN2Ϊģ������	
	ANSEL = 0B00100001;   //ʹ��AN6,AN0Ϊģ������
}                      
/////��PA0��ģ�⴮�ڷ������ݣ�������57600
void send_data(unsigned char d)
{
	unsigned char i;
	//PORTA&=0B11111110;
  TRISA0=0;
	PA0=0;
	DelayUs(17);
	for(i=0;i<8;i++)
	{
		if((d&0x01)==0)
		{
			//PORTA&=0B11111110;
			PA0=0;
		}
		else
		{
			//PORTA|=0B00000001;
			PA0=1;
		}
		DelayUs(17);


		d>>=1;
	}
	//PORTA|=0B00000001;
	PA0=1;
   TRISA0=1;
	DelayUs(50);


}

/*
////��ȡ�������ն�ADֵ
unchar READ_LIGHT(void)
{
	unchar i;//,ad_light;
	unint  ad_sum=0;

	ADCON0 = 0B10110101; //B4:2,CHS=101,ѡ��AN5ͨ��

	DelayUs(50);
	GO_DONE = 1;             //����ADC 
	DelayUs(100);

	for(i=0;i<8;i++)
	{
		GO_DONE = 1;             //����ADC 
		while( GO_DONE==1 );    //�ȴ�ADCת�����

		ad_sum+=  ADRESH<<8;
		ad_sum+=  ADRESL;
		DelayUs(20);
	}
	
	ad_sum>>=5;
	i=ad_sum;

	ADCON0 = 0B10111001; //
//	DelayUs(30);

	return i;
}
*/


////��ȡ��ͬͨ��ADֵ
unchar read_ad(unchar ch)
{
	unchar i;//,ad_light;
	unint  ad_sum=0;

//	ADCON0 = 0B10010100; //B4:2,CHS=101,ѡ��AN5ͨ��
//	DelayUs(20);
	ADCON0 = ch;//0B10110101; //B4:2,CHS=101,ѡ��AN5ͨ��

	DelayUs(100);
	GO_DONE = 1;             //����ADC 
	DelayUs(100);

	for(i=0;i<16;i++)
	{
		GO_DONE = 1;             //����ADC 
		while( GO_DONE==1 );    //�ȴ�ADCת�����

		ad_sum+=  ADRESH<<8;
		ad_sum+=  ADRESL;
		DelayUs(20);
	}
	
	ad_sum>>=6;
	i=ad_sum;

	ADCON0 = 0B10111001; //
	DelayUs(50);

	return i;
}


/*-------------------------------------------------
 *  ��������Con_CS1237
 *	���ܣ� ����CS1237оƬ
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/
void Con_CS1237(void)
{
        unsigned char i;
        unsigned char dat;
        unsigned short count_i=0;//�����ʱ��
        
   /*    SetPinMux(10, 0, 0);//SCK
        SetPinMux(10, 1, 0);//SDA

        SetPinDir(10,0,1);
        SetPinDir(10,1,0); */          
        dat = 0B00111100;// 0100 1000
        SCK_0;//ʱ������s
        while(PC3 ==1)//оƬ׼�����������  ʱ���Ѿ�Ϊ0������Ҳ��Ҫ��CS1237ȫ������Ϊ0���㶼׼����
        {
                DelayUs(500);
                count_i++;
                if(count_i > 15000)
                {
                        SCK_1;
                        TRISC3=0;
                        DAT_1;
                      //  printf("here error\r\n");
                        return;//��ʱ����ֱ���˳�����
                }
        }
        TRISC3=0;//PC3��ʱ�ĳ��������CJ1237����
        for(i=0;i<29;i++)// 1 - 29
        {
              SCK_1;DelayUs(1);SCK_0;DelayUs(1);
        }
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//30
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//31
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//32
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//33
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//34
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//35
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//36
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//37     д����0x65
        for(i=0;i<8;i++)// 38 - 45�������ˣ�д8λ����
        {
                SCK_1;DelayUs(1);
                if(dat&0x80)
                        DAT_1;
                else
                        DAT_0;
                    
                dat <<= 1;
                SCK_0;DelayUs(1);
        }
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//46������������������
        
} 
//��ȡоƬ����������
unsigned char Read_CON(void)
{
        unsigned char i;
        unsigned char dat=0;//��ȡ��������
        unsigned short count_i=0;//�����ʱ��
        unsigned char k=0,j=0;//�м����
        SCK_0;//ʱ������
        TRISC3=1;
        while(PC3 ==1)//оƬ׼�����������  ʱ���Ѿ�Ϊ0������Ҳ��Ҫ��CS1237ȫ������Ϊ0���㶼׼����
        {
                DelayUs(5000);
                count_i++;
                if(count_i > 15000)
                {
                        SCK_1;
                        TRISC3=0;
                        DAT_1;
                        //printf("here outtime error\r\n");
                        return 0XFF;//��ʱ����ֱ���˳�����
                }
        }
        for(i=0;i<29;i++)// 1 - 29
        {
                SCK_1;DelayUs(1);SCK_0;DelayUs(1);
        }
        TRISC3=0;
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//30
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//31
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//32
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//33
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//34
        SCK_1;DelayUs(1);DAT_1;SCK_0;DelayUs(1);//35
        SCK_1;DelayUs(1);DAT_0;SCK_0;DelayUs(1);//36
        DAT_1;
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//37     д����0x56
        dat=0;
        TRISC3=1;
        for(i=0;i<8;i++)// 38 - 45�������ˣ���ȡ����
        {
                dat <<= 1;
                SCK_1;DelayUs(1); SCK_0;DelayUs(1);
                if(PC3 ==1)
                       
                        dat++;
                 
               
               
        }
       SCK_1;DelayUs(1);SCK_0;DelayUs(1);//46������������������
        return dat;
}
/*-------------------------------------------------
 *  ��������Read_CS1237
 *	���ܣ� ��ȡADC���ݣ����ص���һ���з�������
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/
     
//��ȡADC���ݣ����ص���һ���з�������
long Read_CS1237(void)
{
        unsigned char i;
        long dat=0;//��ȡ��������
        unsigned char count_i=0;//�����ʱ��
//        DOUT = 1;//�˿�����1��51�ر�
        SCK_0;//ʱ������
         TRISC3=1;
        while(PC3==1)//оƬ׼�����������  ʱ���Ѿ�Ϊ0������Ҳ��Ҫ��CS1237����Ϊ0���㶼׼����
        {
                DelayUs(5000);
                count_i++;
                if(count_i > 300)
                {
                        SCK_1;
                         TRISC3=0;
                        DAT_1;
                        //printf("Read_CS1237 outtime error\r\n");
                        return 0XFF;//��ʱ����ֱ���˳�����
                }
        }
//        DOUT = 1;//�˿�����1��51�ر�
        for(i=0;i<24;i++)//��ȡ24λ��Чת��
        {
                SCK_1;
                DelayUs(1);

                dat <<= 1;
                if(PC3==1)
                {
                dat ++;
							}
                SCK_0;
                DelayUs(1);        
        }
        for(i=0;i<3;i++)//һ������27������
        {
                SCK_1;DelayUs(1);SCK_0;DelayUs(1);
        }
        //DAT_1;
        //�ȸ��ݺ궨���������Чλ������һЩ����
        //i = 24 - ADC_Bit;//i��ʾ��Ҫ������λ��
       // dat >>= i;//���������λ��
        return dat;
}       
/*-------------------------------------------------
 *  ��������interrupt ISR
 *	���ܣ�  �жϴ�������
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/
/*void interrupt ISR(void)//PIC_HI-TECHʹ��
{ 
  //PA��ƽ�仯�ж�**********************
	 if(PAIE && PAIF)//
    {
         if(PA0==1)
            {

             if(PC3==1)
              {
            LIGHT_OFF;
        delay_sub(15);	//0.75s
            LIGHT_ON;
           		}	   
					}

		PAIF = 0;  //��PAIF��־λ

	 
    }
} */


/*-------------------------------------------------
 *  ������: PA2_Level_Change_INITIAL
 *	���ܣ�  PA�˿�(PA2)��ƽ�仯�жϳ�ʼ��
 *  ���룺  ��
 *  �����  ��
--------------------------------------------------*/
/*void PA0_Level_Change_INITIAL(void)
{
	//ANSEL = 0B11111110;//�ر��ж�����ģ�����빦��
	TRISA0 =1; //SET PA2 INPUT
	ReadAPin = PORTA;//��PA��ƽ�仯�ж�
	PAIF =0;   //�� PA INT�жϱ�־λ
    IOCA0 =1;  //ʹ��PA2��ƽ�仯�ж�
	PAIE =1;   //ʹ�� PA INT�ж�
  //GIE =1;    //ʹ��ȫ���ж�
}*/
/*/////��PA6��ģ�⴮�ڷ������ݣ�������57600
void send_data(unsigned char d)
{
	unsigned char i;
	//PORTA&=0B11111110;
	PA6=0;
	DelayUs(17);
	for(i=0;i<8;i++)
	{
		if((d&0x01)==0)
		{
			//PORTA&=0B11111110;
			PA6=0;
		}
		else
		{
			//PORTA|=0B00000001;
			PA6=1;
		}
		DelayUs(17);


		d>>=1;
	}
	//PORTA|=0B00000001;
	PA6=1;
	DelayUs(50);


}*/




/*-------------------------------------------------
 *  ������:  main
 *	���ܣ�  ������
 *  ���룺  ��
 *  �����  ��
 --------------------------------------------------*/

void main()
{

	POWER_INITIAL();	//ϵͳ��ʼ��
	

	ADC_INITIAL();		//ADC��ʼ��	
 //  PA0_Level_Change_INITIAL();
  // GIE = 1;	//�����ж�
    CS1237_Power_Down();
    Con_CS1237();
    ReadCJ=Read_CON();
    MAX_PIR=0X00;
    MIN_PIR=0XFF;
//����
//	PC3=0;
//	LIGHT_ON;
	

//��ʱ0.5��
	delay_sub(10);

	/*	j=0;
	while(1)
	{
  
	  SUM=0;
		
	  for(i=0;i<4;i++)	//0.57s
	  {
	  	for(t=0;t<4096;t++)
	  	{
			GO_DONE = 1;             //����ADC
			while( GO_DONE==1 );    //�ȴ�ADCת�����

			k =  ADRESH<<8;
			k+=  ADRESL;
		
			SUM+=k;
	
	  	}




 		#asm
 		  Clrwdt
 		#endasm		


	  }

		k=SUM>>14;
		if((k>30)&&(k<563)&&(j>9))break;

		j++;

		if(j>60)break;	//�ϵ�35������ֱ����ѹû�н���1.1V����������ѭ��

	}*/

//���
//	PC3=1;
	wave=0;
  LIGHT_OFF;

//��ʱ0.3��
	delay_sub(6);


//����ֱ����ѹƽ��ֵ
	SUM=0;

/*
	average=0;
	j=1;
	while((average<=34)||(average>=580))
	{
*/

	  for(i=0;i<32;i++)	//2.28S
	  {
	  	for(t=0;t<2048;t++)	
	  	{
			GO_DONE = 1;             //����ADC
			while( GO_DONE==1 );    //�ȴ�ADCת�����

			k =  ADRESH<<8;
			k+=  ADRESL;
		
			SUM+=k;
	
	  	}

 		#asm
 		  Clrwdt
 		#endasm

	  }

	  average=SUM>>16;

/*
	  j++;
	  if(j>15)
	  {
		if(j<22)	//����ָʾ
		{
			if((j%2)==0)LIGHT_ON;
			else LIGHT_OFF;
		}

				check_sum=0xFB;
				//check_sum=send_byte;
				send_data(check_sum);

				send_byte= average>>2;
				check_sum+=send_byte;
				send_data(send_byte);
				
				check_sum+=1;
				send_data(check_sum);
			
	  }

	}

	LIGHT_OFF;
*/

/*
//��ȡPA1�ܽ�ADֵ
	i=read_ad(0XA5);

//	send_data(0x11);
//	send_data(i);

	if(i>250)
	{
		TH=TH_HIGH;
		start_times=1;	//�ϵ���⵽����ģʽ��־������������Ϊ������
	}
	else
	{
		TH=TH_LOW;		//��������
		start_times=0;
	}
*/

		TH=TH_LOW;		//��������
	//	start_times=0;


//��ȡ�й�ADֵ
	light_ad=read_ad(0XB5);
	light_ad0=light_ad;

	for(i=0;i<20;i++)DelayUs(228);	//4ms

	
	SUM=0;
    unint m=0;
    NOISE_PIR=0XFFFFFFFF;
  // delay_sub(400);//�������������ֵ�տ�ʼ���ԣ���ʱ20s����
	while(1)
	{
	//	j=0;
		
		while(1)
		{
		  /*GO_DONE = 1;             //����ADC 
			while( GO_DONE==1 );    //�ȴ�ADCת�����

			k =  ADRESH<<8;
			k+=  ADRESL;


			times++;
			
			SUM+=k;

			if(k>average){k-=average;}
			else {t=k;k=average-t;}
			SUM1+=k;        			
     */
       times++;
       
       PIR_AD= Read_CS1237();      //Ԥ���׼ֵ���м䣬�ɼ�һ��ʱ�����źźͻ�׼���ۻ�ֵ��Ϊ������һ��ʱ��ȡһ�αȽ�ȡ��Сֵ
       
       PIR_AD+=0X7FFFFF;
       PIR_AD&=0X00FFFFFF;
      /* send_data(PIR_AD>>16);
       send_data(PIR_AD>>8);
       send_data(PIR_AD);*/
     // PIR_ad=PIR_AD>>16;
      // PIR_ad+=0X7F;
       // send_data(PIR_ad);
       average1=0X7FFFFF;
       if(PIR_AD>average1) k=PIR_AD-average1;
       if(PIR_AD<average1) k=average1-PIR_AD;
       SUM3+=k;
        times1++;
      if(times1>=8192)
       {
        times1=0;
        
            if(SUM3<NOISE_PIR) NOISE_PIR=SUM3;
            
            if(SUM3-NOISE_PIR>TH_PIR) 
            {   
            PA1=0;
            times2=1;
            }
         send_data(NOISE_PIR>>24);
         send_data(NOISE_PIR>>16);
         send_data(NOISE_PIR>>8);
         send_data(NOISE_PIR);
         send_data(SUM3>>24);
         send_data(SUM3>>16);
         send_data(SUM3>>8);
         send_data(SUM3);
            SUM3=0;
			}
       if(times2>0)
            {
          times2++;
          if(times2>2048) 
             {
               PA1=1;
               times2=0;
             }
        		}
      // SUM3+=PIR_AD;      //�������256��Լ200ms
       
    /*     send_byte=PIR_AD;
         check_sum+=send_byte;
         send_data(send_byte);*/
      //MAX_PIR MIN_PIR
   
    
      // if(PIR_ad>MAX_PIR) MAX_PIR=PIR_ad;
       //if(MIN_PIR>PIR_ad) MIN_PIR=PIR_ad;
   
             
       
       // senddata(PIR_AD);
  
 

     
		if(times>=512)	//ÿ336msͳ��һ����������ֵ��Ȼ�����ж�
			{


/*
				if(start_times>0)
				{
					if(start_times<240){start_times++;}
					else
					{
						TH=TH_LOW;
						start_times=0;
					}
				}
*/
				times=0;

				calc_average_times++;
			
				SUM16+=SUM;
				
				if(calc_average_times>=8)	//ÿ2.8S����һ��ƽ��ֵ��Ȼ�����¼���ֱ����ѹֵ
				{
					calc_average_times=0;
					
					SUM16>>=16;
					average+=SUM16;
					average/=2;
					SUM16=0;
				}
				
				if(check_light_times<6)	//ÿ2���ȡһ�θй�ADֵ
				{
					check_light_times++;
				}
				else
				{
					if(LIGHT==0)	//��û�е���ʱ�Ŷ�ȡ�й�ADֵ
					{
						//light_ad=READ_LIGHT();
						light_ad=read_ad(0XB5);

						if((light_ad<=(light_ad0+2))&&(light_ad0<=(light_ad+2)))
							light_ad=light_ad0;

						light_ad0=light_ad;

						check_light_times=0;

					}

				}


				if(SUM0==0)SUM0=SUM1+1000;	
//�ϵ��һ�β⵽���ź�ֵ��Ϊ��������ֵ��+500�Ǳ�����������ֵ��С

				if(SUM1_counter==0)
				{
					SUM10=SUM1;
					MAX_DELTA=SUM10/6;		
					if(MAX_DELTA<MAX_DELTA0)MAX_DELTA=MAX_DELTA0;
				}
				
					if((SUM10<(SUM1+MAX_DELTA))&&(SUM1<(SUM10+MAX_DELTA)))//����������һ����Χ��ʱ
					{
						SUM1_counter++;
						ALL_SUM1+=SUM1;
						SUM10=ALL_SUM1/SUM1_counter;
						MAX_DELTA=SUM10/6;
						if(MAX_DELTA<MAX_DELTA0)MAX_DELTA=MAX_DELTA0;

						if(SUM0>SUM10)
						{
							SUM=SUM0-SUM10;
							if(SUM>30000)SUM0_num=2;
							else if(SUM>8000)SUM0_num=4;
							else SUM0_num=16;
						}
						else
						{
							SUM0_num=16;
						}
						if((SUM1_counter>=SUM0_num)&&(SUM10<SUM0))
						{
							if(SUM1_num>16)	//û�е�����ʱ������������ֵ��С
							{
								if(SUM0_num<=8)SUM0=SUM10;
								else
								{
									SUM0+=SUM10;
									SUM0/=2;
								}
								SUM1_counter=0;
								ALL_SUM1=0;
							}

						}

						else if(SUM1_counter>=SUM1_num)
						{
							
							if(SUM0>SUM10)
							{
								if(SUM1_num>16)SUM0=SUM10;	//û�е�����ʱ������������ֵ��С
							}
							else if(SUM10>(SUM0+2000))
							{
								SUM=SUM10-SUM0;

								if((SUM10<2000000)&&(SUM<100000))
		//��������ֵû�дﵽ����ʱ,�����¼�⵽������ֵ����ֵС��100000ʱ����������ֵ����
								{
									if(SUM1_num==32)	//��δ����ʱֱ���޸�����ֵ
									{
										SUM0+=SUM10;
										SUM0/=2;
									}
									else
									{
										if(SUM>50000)SUM1_num=16;
										else if(SUM>20000)SUM1_num=8;
										else SUM1_num=4;
										if(SUM1_counter>=SUM1_num)
										{
											SUM0+=SUM10;
											SUM0/=2;
										}
									}
								}
							}
							else if((LIGHT>0)&&(TH==TH_LOW))
							{
								SUM=SUM10-SUM0;	
								TH+=SUM;		//�Ƶ���ʱ��������ֵ����һ��
							}

							if(SUM1_counter>=SUM1_num)
							{
								SUM1_counter=0;
								ALL_SUM1=0;
							}
						}
					}
					else
					{
						SUM1_counter=0;
						ALL_SUM1=0;
					}


				//send_byte=0x35;



				if(stop_times>0)	//�����0.88�����ڲ����ж��Ƿ���Ŀ�궯��
				{
					stop_times--;	
				}
				else
				{

					if(start_times>0)
					{
						if(start_times<70)	//�ϵ������ڲ���ģʽ�£����������ʱ250*88ms=22S���Զ��ָ���������						{
						{
							start_times++;
/*
							if(SUM0>600000)
							{
								TH=10000;
							}
							else */
							if(SUM0>1600000)
							{
								TH=400000;
							}
							else
							{
								SUM=SUM0+TH;
								if(SUM>2000000)
								{
									TH=2000000-SUM0;
								}
								//if(TH<30000)TH=30000;
							}

						}
						else
						{
							TH=TH_LOW;
							start_times=0;
						}

					}

					if(SUM1>(SUM0+TH))
					{
						//SUM=SUM1-SUM0;

					//	if(SUM>TH)
					//	{
							if((light_ad<=LIGHT_TH)||(start_times>0))
							{
								send_data(0xaa);

								
								//if(alarm_times<2)
								//{
								//	alarm_times++;
							//	  }
								//if(alarm_times>=2)	//�������γ�������Ϊ��Ŀ�궯��
								{
									LIGHT=1;
							
									//PC3=0;
									wave=1;
								  LIGHT_ON;

									SUM1_num=4;

									send_data(0xaa);

								}
							}

/*
							else
							{
								send_data(0xbb);
								send_data(0xbb);

							}
	*/						
						}
					//	else
					//	{
					//		alarm_times=0;
					//	}
				}

				SUM=0;
			  
			}  

		if((times&0x00ff)==0)	//0����256ʱ��ÿ170ms?����һ�����ݣ�����������ͬ
			{
  				if(times==0)SUM2=SUM1;
          				#asm
 		  			Clrwdt
 				#endasm	
        


    
         DelayUs(228);	//200us

	
   /*    send_byte=ReadCJ;
         check_sum+=send_byte;
         send_data(send_byte);

        send_byte=average1;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=MAX_PIR;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=MIN_PIR;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=times1;
         check_sum+=send_byte;
         send_data(send_byte);  

  send_byte=NOISE_PIR;
         check_sum+=send_byte;
         send_data(send_byte);  


         send_byte=SUM3>>16;
         check_sum+=send_byte;
         send_data(send_byte);

        send_byte=SUM3>>8;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=SUM3;
         check_sum+=send_byte;
         send_data(send_byte);

				check_sum=0xF0;
				send_data(0xF0);   */                 

				/*send_byte=TH>>13;
				check_sum+=send_byte;
				send_data(send_byte);

				k=TH_LOW;
				send_byte=k>>7;
				check_sum+=send_byte;
				send_data(send_byte);

				//send_byte=light_ad;
				check_sum+=light_ad;
				send_data(light_ad);

				send_byte=average>>2;
				check_sum+=send_byte;
				send_data(send_byte);

				send_byte=SUM0>>14;
				check_sum+=send_byte;
				send_data(send_byte);

				send_byte=SUM0>>6;
				check_sum+=send_byte;
				send_data(send_byte);

				send_byte=SUM2>>14;
				check_sum+=send_byte;
				send_data(send_byte);

				send_byte=SUM2>>6;
				check_sum+=send_byte;
				send_data(send_byte);*/

    /*    send_byte=PA0;
         check_sum+=send_byte;
         send_data(send_byte);
 
          send_byte=read_ad(0XB9);
         check_sum+=send_byte;
         send_data(send_byte);



         send_byte=wave;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=PC3;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=Delay_time_num;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=Delay_ad;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=Alarm;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=PA6;
         check_sum+=send_byte;
         send_data(send_byte);

         send_byte=time1;
         check_sum+=send_byte;
         send_data(send_byte);

				check_sum+=1;
				send_data(check_sum);

   
         TRISA0=1;
         PA0=0;      */
				if(times==0)
				{
					SUM1=0;

					if(LIGHT>0)	//�Ƶ���ʱ
					{
						LIGHT++;
						if(LIGHT>DELAY_NUM)
						{
							LIGHT=0;
							break;
						}
					}
				}
    
			}


/*
			if(LIGHT>0)	//�Ƶ���ʱ
			{
				LIGHT++;
				if(LIGHT>DELAY_NUM)
				{
					LIGHT=0;
					break;
				}
			}
*/
      
       
		}
	
		//PC3=1;
		wave=0;
    LIGHT_OFF;
		delay_sub(4);	//0.2s


/*
		for(t=0;t<4;t++)	//0.2s
		{
			for(i=0;i<250;i++)DelayUs(228);	//50ms
 			#asm
 		      Clrwdt
 		  	#endasm		
		}
*/
		SUM=0;
		SUM1=0;
		times=0;
		SUM16=0;
		calc_average_times=0;
		SUM1_num=32;
		
		stop_times=2;
	//	if(start_times==0)
		TH=TH_LOW;

		SUM1_counter=0;
		ALL_SUM1=0;

		send_data(0xdd);
		send_data(0xdd);


	}


}