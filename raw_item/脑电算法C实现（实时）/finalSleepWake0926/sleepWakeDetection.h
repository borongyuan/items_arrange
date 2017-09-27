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

/* @�������
 * 			rawdata: ���飬ԭʼ�Ե�����
 * 			fftdata: ���飬�Ե����ݵ�FFT
 */
void swd_RealTimeHalfMinute(int* rawdata, float *fftdata, unsigned char *working_space);

/* @�������
 * 			bodyposition�����飬��¼����ҹ��λ�仯ֵ 
 *          bodymove�����飬��¼����ҹ�嶯�仯ֵ 
            style_totalSecond: ������ bodyposition��Ӧ��Ԫ�ظ��� 
			raw_totalSecond�����飬�ܹ���¼�Ե������
 */
void swd_algorithm(int *bodyposition, int *bodymove, int style_totalSecond, unsigned char *working_space);


#ifdef __cplusplus

}

#endif /* end of __cplusplus */
 
#endif
