/*******************************************************************
Describes: 	main function for test to detection/score of wake, sleep and REM
   Author:	Jango
  Version: 	v1.1
     Date: 	2017-9-19
Copyright:	EEGSmart
********************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "readcsv.h"
#include "sleepWakeDetection.h"

FILE* fp;

int main()
{
	int			m,n;
	int 		i;
	int 		numEpoch;
	int 		totalEpoch;
	int         raw_totalSecond;
	int         style_totalSecond;
	int 		score[MAXENPOCH];
	int 		epochValid[MAXENPOCH];
	int*		rawdata;
	int*		fftdata;
	int*        bodyposition;
	int*        bodymove;
	float*		fftdata2;
	float		epoch[MAXENPOCH];
	float 		epoch2[MAXENPOCH];

	int*		p;
	float*		p1;
	float*		p2;
	char*		rawfile = "C:\\Users\\EEG\\Desktop\\rawdata2.csv";
	char*		fftfile = "C:\\Users\\EEG\\Desktop\\fftdata2.csv";
	char*       bpnfile = "C:\\Users\\EEG\\Desktop\\bodyposition2.csv";
	char*       bmvfile = "C:\\Users\\EEG\\Desktop\\bodymove2.csv";

	p = &epochValid[0];
	p1 = &epoch[0];
	p2 = &epoch2[0];

	n = get_col_of_raw(rawfile);
	m = get_row_of_raw(rawfile,n);
	rawdata = (int*)malloc(n*m*sizeof(int));
	get_raw_from_csv(rawfile,rawdata,m,n);

	n = get_col_of_raw(fftfile);
	m = get_row_of_raw(fftfile,n);
	fftdata = (int*)malloc(n*m*sizeof(int));
	get_raw_from_csv(fftfile,fftdata,m,n);

	fftdata2 = (float*)malloc(n*m*sizeof(float));

	for(i=0; i<m*n; i++)
		fftdata2[i] = fftdata[i];
		
	free(fftdata);

	totalEpoch = m/SECONDS_OF_EPOCH;
	numEpoch = 0;
	raw_totalSecond = m;

	while(1)
	{
		rtEpoch(&rawdata[SECONDS_OF_EPOCH*NFFT*numEpoch], &fftdata2[SECONDS_OF_EPOCH*NFFT*numEpoch], numEpoch, p1++, p2++, p++);
		numEpoch++;

		if(numEpoch==totalEpoch)
			break;
	}

	nrtAASM(epoch, epoch2, totalEpoch, epochValid, score);
	
	n = get_col_of_raw(bpnfile);
	m = get_row_of_raw(bpnfile,n);
	bodyposition = (int*)malloc(n*m*sizeof(int));
	get_raw_from_csv(bpnfile,bodyposition,m,n);
	
	n = get_col_of_raw(bmvfile);
	m = get_row_of_raw(bmvfile,n);
	bodymove = (int*)malloc(n*m*sizeof(int));
	get_raw_from_csv(bmvfile,bodymove,m,n);
	style_totalSecond = m;
	
    eeg_detect_algorithm(bodyposition, bodymove, style_totalSecond, raw_totalSecond, score);
    
	fp = fopen("rtscore.txt", "w+");
	for(i=0; i<totalEpoch; i++)
	{
		fprintf(fp,"%d\n",score[i]);
	}
	fclose(fp);
	
	free(rawdata);
	free(bodyposition);
	free(bodymove);
	free(fftdata2);

	printf("\nBingo.");

	return 0;
}

