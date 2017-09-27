/*******************************************************************
Describes: 	header for detection/score of wake, sleep and REM
   Author:	Jango
  Version: 	v1.0
     Date: 	2017-9-19
Copyright:	EEGSmart
********************************************************************/
#ifndef __SLEEPWAKEDETECTION_H__
#define __SLEEPWAKEDETECTION_H__
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>


#ifdef __cplusplus

extern "C" {

#endif
//void aasm(int* rawdata, float *fftdata, int totalSecond, char *score);
unsigned char* swd_initWorkingSpace();
int get_swd_WorkingSpaceSize();
int* getTotalHalfMinute(unsigned char *working_space);

/* @输入参数
 * 			rawdata: 数组，原始脑电数据
 * 			fftdata: 数组，脑电数据的FFT
 */
void swd_RealTimeHalfMinute(int* rawdata, float *fftdata, unsigned char *working_space);

/* @输入参数
 * 			bodyposition：数组，记录的整夜体位变化值 
 *          bodymove：数组，记录的整夜体动变化值 
            style_totalSecond: 整数， bodyposition对应的元素个数 
			raw_totalSecond：数组，总共记录脑电的秒数
 */
void swd_algorithm(int *bodyposition, int *bodymove, int style_totalSecond, unsigned char *working_space);


#ifdef __cplusplus

}

#endif /* end of __cplusplus */
 
#endif
