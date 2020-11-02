/*  文件名：TEST_EN8F156_ADC.C
*   版权(Copyright):   深圳市英锐恩科技有限公司 
*   开发环境(IDE):     ENIDE
*   版本(Version):     V1.0
*   日期(Data):        2014-03-05
*   功能：             EN8F156-ADC功能演示
*   IC:                EN8F156 SOP16
*   晶振：             16M /2T                    
*   说明：             程序根据AN2(PA2)口的电压来调节PWM3P(PC4)的占空比
*		       AN2脚电压越高(0-VDD)PWM3P(PC2)占空比越大(2K,0-99%)	
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

//循环累计每2048次（84ms）采样的AD值相对于直流电压的偏差值，相当于噪声和信号合并的积分值
//以采样到的最小积分值作为噪声积分值，在噪声积分值上叠加门限TH作为信号检测门限，
//连续检测到两个2048次信号积分值超过门限后认为有目标动作
//在亮灯后允许噪声积分值上升，也允许TH值上升
//一般噪声积分值在4000~8000，电源干扰严重时可能会到14000
//上电检测到PA1电压大于2V后进入测试模式，将TH设置为高门限，以便于电路板测试，延时30秒后自动恢复为正常门限

//改成循环累计4096次（168ms）采样积分值

//用于20.03.29版XBR201电路板，TH_LOW=6000~7000较合适
//用5V稳压电源供电时，可以提高灵敏度和探测距离
//用于蓝微灯上，与W12-AH345T差别不大

//改成累计8192次（340ms）采样积分值
//改为蓝微模组，用在探测器上

#include "EN8F156.H"


//**********************************************************
//*************************宏定义***************************
#define  unchar     unsigned char 
#define  unint      unsigned int
#define  unlong     unsigned long





#define  TH_LOW		12000
//12000
#define  TH_HIGH	1400000

#define  TH_PIR	2
//重新计算噪声值时允许的最大噪声值波动
#define  MAX_DELTA0  4000
//5000

//感光门限-30对应8LUX时的AD值，设置为255时相当于不检测感光
#define  LIGHT_TH 255
//30

//延时时间,90对应30秒,15-5S
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
 *  函数名：POWER_INITIAL
 *	功能：  上电系统初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{ 
    OSCCON = 0B01110001;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
					 //Bit0=1,系统时钟为内部振荡器
					 //Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
	//OSCCON = 0B01110000;//WDT 32KHZ IRCF=111=16MHZ/2=8MHZ,0.125US/T
					 //Bit0=1,系统时钟为内部振荡器
					 //Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择

	INTCON = 0;  //暂禁止所有中断
	PORTA = 0B00000010;//  0时I/O口为输出，1时为输入
	TRISA = 0B10111101;//PA
	PORTC = 0B00000000; //	PC3=1//ENV12
	TRISC = 0B11101100;//PC

	WPUA = 0;          //禁止所有PA口上拉
	WPUC = 0;       //禁止所有PC口上拉
	OPTION = 0B00001101;//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
					 //Bit7(RAPU)=0 ENABLED PULL UP PA
	MSCKCON = 0B00000000;//6B->0,禁止PA4，PC5稳压输出
					  //5B->0,TIMER2时钟为Fosc
					  //4B->0,禁止LVR       
	CMCON0 = 0B00000111; //关闭比较器，CxIN为数字IO口
//PA6=0;
}
/*------------------------------------------------- 
 *	函数名称：DelayUs
 *	功能：    短延时函数 --16M-2T--大概快1%左右.
 *	输入参数：Time  延时时间长度   延时时长TimeUs
 *	返回参数：无 
 -------------------------------------------------*/
////延时时间为Time*7/8 us
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{

	}
}  
//延时n个50ms
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
 *  函数名:   CS1237_Power_Down
 *	功能：  CS1237进入低功耗模式
 *  输入：  无
 *  输出：  无
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
 *  函数名:  ADC_INITIAL
 *	功能：  ADC初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void ADC_INITIAL (void) 
{
	//ADCON1 = 0B00010000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=001,分频FOSC/8
	//ADCON1 = 0B01010000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=101,分频FOSC/16
	  ADCON1 = 0B00100000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=101,分频FOSC/32

	//ADCON1 = 0B01100000; //DIVS=0,时钟选FOSC
					   //ADCS[2:0]=110,分频FOSC/64
	ADCON0 = 0B10111001; //B7,ADFM=1,结果右对齐                     
					   //B6:5,VCFG=00,参考电压VDD
					   //B6:5,VCFG=01,参考电压内部2V
					   //B6:5,VCFG=11,参考电压Vref
					   //B4:2,CHS=110,选择AN6通道
					   //B1,GO,AD转换状态位
					   //B0,ADON=1,ADC使能
	//ANSEL = 0B00000100;   //使能AN2为模拟输入	
	ANSEL = 0B00100001;   //使能AN6,AN0为模拟输入
}                      
/////用PA0口模拟串口发送数据，波特率57600
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
////读取环境光照度AD值
unchar READ_LIGHT(void)
{
	unchar i;//,ad_light;
	unint  ad_sum=0;

	ADCON0 = 0B10110101; //B4:2,CHS=101,选择AN5通道

	DelayUs(50);
	GO_DONE = 1;             //启动ADC 
	DelayUs(100);

	for(i=0;i<8;i++)
	{
		GO_DONE = 1;             //启动ADC 
		while( GO_DONE==1 );    //等待ADC转换完成

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


////读取不同通道AD值
unchar read_ad(unchar ch)
{
	unchar i;//,ad_light;
	unint  ad_sum=0;

//	ADCON0 = 0B10010100; //B4:2,CHS=101,选择AN5通道
//	DelayUs(20);
	ADCON0 = ch;//0B10110101; //B4:2,CHS=101,选择AN5通道

	DelayUs(100);
	GO_DONE = 1;             //启动ADC 
	DelayUs(100);

	for(i=0;i<16;i++)
	{
		GO_DONE = 1;             //启动ADC 
		while( GO_DONE==1 );    //等待ADC转换完成

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
 *  函数名：Con_CS1237
 *	功能： 配置CS1237芯片
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void Con_CS1237(void)
{
        unsigned char i;
        unsigned char dat;
        unsigned short count_i=0;//溢出计时器
        
   /*    SetPinMux(10, 0, 0);//SCK
        SetPinMux(10, 1, 0);//SDA

        SetPinDir(10,0,1);
        SetPinDir(10,1,0); */          
        dat = 0B00111100;// 0100 1000
        SCK_0;//时钟拉低s
        while(PC3 ==1)//芯片准备好数据输出  时钟已经为0，数据也需要等CS1237全部拉低为0才算都准备好
        {
                DelayUs(500);
                count_i++;
                if(count_i > 15000)
                {
                        SCK_1;
                        TRISC3=0;
                        DAT_1;
                      //  printf("here error\r\n");
                        return;//超时，则直接退出程序
                }
        }
        TRISC3=0;//PC3临时改成输出进行CJ1237配置
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
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//37     写入了0x65
        for(i=0;i<8;i++)// 38 - 45个脉冲了，写8位数据
        {
                SCK_1;DelayUs(1);
                if(dat&0x80)
                        DAT_1;
                else
                        DAT_0;
                    
                dat <<= 1;
                SCK_0;DelayUs(1);
        }
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//46个脉冲拉高数据引脚
        
} 
//读取芯片的配置数据
unsigned char Read_CON(void)
{
        unsigned char i;
        unsigned char dat=0;//读取到的数据
        unsigned short count_i=0;//溢出计时器
        unsigned char k=0,j=0;//中间变量
        SCK_0;//时钟拉低
        TRISC3=1;
        while(PC3 ==1)//芯片准备好数据输出  时钟已经为0，数据也需要等CS1237全部拉低为0才算都准备好
        {
                DelayUs(5000);
                count_i++;
                if(count_i > 15000)
                {
                        SCK_1;
                        TRISC3=0;
                        DAT_1;
                        //printf("here outtime error\r\n");
                        return 0XFF;//超时，则直接退出程序
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
        SCK_1;DelayUs(1);SCK_0;DelayUs(1);//37     写入了0x56
        dat=0;
        TRISC3=1;
        for(i=0;i<8;i++)// 38 - 45个脉冲了，读取数据
        {
                dat <<= 1;
                SCK_1;DelayUs(1); SCK_0;DelayUs(1);
                if(PC3 ==1)
                       
                        dat++;
                 
               
               
        }
       SCK_1;DelayUs(1);SCK_0;DelayUs(1);//46个脉冲拉高数据引脚
        return dat;
}
/*-------------------------------------------------
 *  函数名：Read_CS1237
 *	功能： 读取ADC数据，返回的是一个有符号数据
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
     
//读取ADC数据，返回的是一个有符号数据
long Read_CS1237(void)
{
        unsigned char i;
        long dat=0;//读取到的数据
        unsigned char count_i=0;//溢出计时器
//        DOUT = 1;//端口锁存1，51必备
        SCK_0;//时钟拉低
         TRISC3=1;
        while(PC3==1)//芯片准备好数据输出  时钟已经为0，数据也需要等CS1237拉低为0才算都准备好
        {
                DelayUs(5000);
                count_i++;
                if(count_i > 300)
                {
                        SCK_1;
                         TRISC3=0;
                        DAT_1;
                        //printf("Read_CS1237 outtime error\r\n");
                        return 0XFF;//超时，则直接退出程序
                }
        }
//        DOUT = 1;//端口锁存1，51必备
        for(i=0;i<24;i++)//获取24位有效转换
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
        for(i=0;i<3;i++)//一共输入27个脉冲
        {
                SCK_1;DelayUs(1);SCK_0;DelayUs(1);
        }
        //DAT_1;
        //先根据宏定义里面的有效位，丢弃一些数据
        //i = 24 - ADC_Bit;//i表示将要丢弃的位数
       // dat >>= i;//丢弃多余的位数
        return dat;
}       
/*-------------------------------------------------
 *  函数名：interrupt ISR
 *	功能：  中断处理函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
/*void interrupt ISR(void)//PIC_HI-TECH使用
{ 
  //PA电平变化中断**********************
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

		PAIF = 0;  //清PAIF标志位

	 
    }
} */


/*-------------------------------------------------
 *  函数名: PA2_Level_Change_INITIAL
 *	功能：  PA端口(PA2)电平变化中断初始化
 *  输入：  无
 *  输出：  无
--------------------------------------------------*/
/*void PA0_Level_Change_INITIAL(void)
{
	//ANSEL = 0B11111110;//关闭中断引脚模拟输入功能
	TRISA0 =1; //SET PA2 INPUT
	ReadAPin = PORTA;//清PA电平变化中断
	PAIF =0;   //清 PA INT中断标志位
    IOCA0 =1;  //使能PA2电平变化中断
	PAIE =1;   //使能 PA INT中断
  //GIE =1;    //使能全局中断
}*/
/*/////用PA6口模拟串口发送数据，波特率57600
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
 *  函数名:  main
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/

void main()
{

	POWER_INITIAL();	//系统初始化
	

	ADC_INITIAL();		//ADC初始化	
 //  PA0_Level_Change_INITIAL();
  // GIE = 1;	//开总中断
    CS1237_Power_Down();
    Con_CS1237();
    ReadCJ=Read_CON();
    MAX_PIR=0X00;
    MIN_PIR=0XFF;
//亮灯
//	PC3=0;
//	LIGHT_ON;
	

//延时0.5秒
	delay_sub(10);

	/*	j=0;
	while(1)
	{
  
	  SUM=0;
		
	  for(i=0;i<4;i++)	//0.57s
	  {
	  	for(t=0;t<4096;t++)
	  	{
			GO_DONE = 1;             //启动ADC
			while( GO_DONE==1 );    //等待ADC转换完成

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

		if(j>60)break;	//上电35秒后如果直流电压没有降到1.1V以下则跳出循环

	}*/

//灭灯
//	PC3=1;
	wave=0;
  LIGHT_OFF;

//延时0.3秒
	delay_sub(6);


//计算直流电压平均值
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
			GO_DONE = 1;             //启动ADC
			while( GO_DONE==1 );    //等待ADC转换完成

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
		if(j<22)	//故障指示
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
//读取PA1管脚AD值
	i=read_ad(0XA5);

//	send_data(0x11);
//	send_data(i);

	if(i>250)
	{
		TH=TH_HIGH;
		start_times=1;	//上电后检测到测试模式标志，将门限设置为高门限
	}
	else
	{
		TH=TH_LOW;		//正常门限
		start_times=0;
	}
*/

		TH=TH_LOW;		//正常门限
	//	start_times=0;


//读取感光AD值
	light_ad=read_ad(0XB5);
	light_ad0=light_ad;

	for(i=0;i<20;i++)DelayUs(228);	//4ms

	
	SUM=0;
    unint m=0;
    NOISE_PIR=0XFFFFFFFF;
  // delay_sub(400);//看到红外输出的值刚开始不对，延时20s看看
	while(1)
	{
	//	j=0;
		
		while(1)
		{
		  /*GO_DONE = 1;             //启动ADC 
			while( GO_DONE==1 );    //等待ADC转换完成

			k =  ADRESH<<8;
			k+=  ADRESL;


			times++;
			
			SUM+=k;

			if(k>average){k-=average;}
			else {t=k;k=average-t;}
			SUM1+=k;        			
     */
       times++;
       
       PIR_AD= Read_CS1237();      //预设基准值在中间，采集一定时间内信号和基准的累积值作为噪声，一段时间取一次比较取最小值
       
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
      // SUM3+=PIR_AD;      //这个过程256次约200ms
       
    /*     send_byte=PIR_AD;
         check_sum+=send_byte;
         send_data(send_byte);*/
      //MAX_PIR MIN_PIR
   
    
      // if(PIR_ad>MAX_PIR) MAX_PIR=PIR_ad;
       //if(MIN_PIR>PIR_ad) MIN_PIR=PIR_ad;
   
             
       
       // senddata(PIR_AD);
  
 

     
		if(times>=512)	//每336ms统计一次噪声积分值，然后做判断
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
				
				if(calc_average_times>=8)	//每2.8S计算一次平均值，然后重新计算直流电压值
				{
					calc_average_times=0;
					
					SUM16>>=16;
					average+=SUM16;
					average/=2;
					SUM16=0;
				}
				
				if(check_light_times<6)	//每2秒读取一次感光AD值
				{
					check_light_times++;
				}
				else
				{
					if(LIGHT==0)	//灯没有点亮时才读取感光AD值
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
//上电第一次测到的信号值作为噪声积分值，+500是避免噪声积分值过小

				if(SUM1_counter==0)
				{
					SUM10=SUM1;
					MAX_DELTA=SUM10/6;		
					if(MAX_DELTA<MAX_DELTA0)MAX_DELTA=MAX_DELTA0;
				}
				
					if((SUM10<(SUM1+MAX_DELTA))&&(SUM1<(SUM10+MAX_DELTA)))//噪声波动在一定范围内时
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
							if(SUM1_num>16)	//没有点亮灯时允许噪声积分值减小
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
								if(SUM1_num>16)SUM0=SUM10;	//没有点亮灯时允许噪声积分值减小
							}
							else if(SUM10>(SUM0+2000))
							{
								SUM=SUM10-SUM0;

								if((SUM10<2000000)&&(SUM<100000))
		//噪声积分值没有达到满幅时,并且新检测到的噪声值增加值小于100000时，允许噪声值增大
								{
									if(SUM1_num==32)	//灯未点亮时直接修改噪声值
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
								TH+=SUM;		//灯点亮时允许门限值增加一次
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



				if(stop_times>0)	//灯灭后0.88秒以内不再判断是否有目标动作
				{
					stop_times--;	
				}
				else
				{

					if(start_times>0)
					{
						if(start_times<70)	//上电后如果在测试模式下，进入检测后延时250*88ms=22S后自动恢复正常门限						{
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
								//if(alarm_times>=2)	//连续两次超门限认为有目标动作
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

		if((times&0x00ff)==0)	//0或者256时，每170ms?发送一次数据，两次数据相同
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

					if(LIGHT>0)	//灯点亮时
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
			if(LIGHT>0)	//灯点亮时
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