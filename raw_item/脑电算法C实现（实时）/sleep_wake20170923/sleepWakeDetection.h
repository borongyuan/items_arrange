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
#include "readcsv.h"


#define MAXHOUR				(20)
#define SECONDS_OF_EPOCH 	(30)
#define EPOCH_OF_HOUR		(120)
#define NFFT				(256)
#define RAW_SAMPLE_FS       (256) 
#define NaN					(-1)
#define ORIGINAL_THRESHOLD	(3)
#define ORIGINAL_THRESHOLD2	(3)
#define REM					(5)
#define WAKE				(4)
#define LIGHT				(3)
#define DEEP				(2)
#define WINDOWS				(5)
#define MAXENPOCH 			(MAXHOUR*EPOCH_OF_HOUR)
#define MAXSECOND			(SECONDS_OF_EPOCH*EPOCH_OF_HOUR*MAXHOUR)

//void aasm(int* rawdata, float *fftdata, int totalSecond, char *score);
void rtEpoch(int* rawdata, float *fftdata, int notFirst, float *epoch, float *epoch2, int *epochValid);
/* @�������
 * 			rawdata: ���飬�����ܳ���Ϊ��256*3600��*20Сʱ����ԭʼʱ���źţ�������256Hz
 * 			fftdata: ���飬������rawdata��ͬ�������ܳ���Ϊ��256*3600��*20Сʱ����ԭʼʱ���ź�ÿ��256��FFT�����ľ���ֵƽ��
            notFirst: ��������ʼֵΪ0��֮��ÿ��30sֵ��1 
 * *
 * @�������
 * 			epoch�����飬�����ܳ���Ϊ2400�������Ƿ�˯��������ֵ�仯���� 
 *          epoch2�����飬�ܳ�����epoch��ͬ�������ܳ���Ϊ2400��������˯��ǳ˯������ֵ�仯����
            epochValid�����飬�ܳ�����epoch��ͬ���ж�ÿ30s�Ƿ���Ч��1Ϊ��Ч��-1��Ϊ��Ч 
 * @return
 * 			��
 */
 
void nrtAASM(float *epoch, float *epoch2, int totalEpoch, int *epochValid, int *score);
/* @�������
 * 			epoch�����飬�����ܳ���Ϊ2400�������Ƿ�˯��������ֵ�仯���� 
 *          epoch2�����飬�ܳ�����epoch��ͬ�������ܳ���Ϊ2400��������˯��ǳ˯������ֵ�仯����
            totalEpoch: ������ ��ʾ�ܹ��ж��ٸ�30s
			epochValid�����飬�ܳ�����epoch��ͬ���ж�ÿ30s�Ƿ���Ч��1Ϊ��Ч��-1��Ϊ��Ч
 * *
 * @�������
 * 			score�����飬�ܳ�����epoch������ͬ���Ե���ڽ�� 
 *         
 * @return
 * 			��
 */

void eeg_detect_algorithm(int *bodyposition, int *bodymove, int style_totalSecond, int raw_totalSecond, int *score);

/* @�������
 * 			bodyposition�����飬��¼����ҹ��λ�仯ֵ 
 *          bodymove�����飬��¼����ҹ�嶯�仯ֵ 
            style_totalSecond: ������ bodyposition��Ӧ��Ԫ�ظ��� 
			raw_totalSecond�����飬�ܹ���¼�Ե������ 
 * *
 * @�������
 * 			score�����飬�ܳ�����epoch������ͬ���Ե�����λ�ںϺ���Ե���ڽ�� 
 *         
 * @return
 * 			��
 */








 
 
#endif
