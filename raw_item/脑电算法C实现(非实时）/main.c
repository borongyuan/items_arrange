#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sleepWakeDetection.h"
#include "readcsv.h"
/*run this program using the console pauser or add your own getch, system("pause") or input loop*/


int main()
{
	char *bodypositionname = "C:\\Users\\EEG\\Desktop\\bodyposition.csv"; //the address of test_File
	char *bodymovename = "C:\\Users\\EEG\\Desktop\\bodymove.csv";
	char *fftname = "C:\\Users\\EEG\\Desktop\\fftdata.csv";
	char *rawname = "C:\\Users\\EEG\\Desktop\\rawdata.csv";
	int row, col; // the row and col of data
	int *rawdata; // save data as vector
	int *fftdata;
	float *fftdata1;
	int *bodyposition;
	int *bodymove;
	int *score;  
    int style_totalSecond = 0;
    int raw_totalSecond = 0;
    int rawdata_len = 0;
    int index = 0;
    
	col = get_col_of_raw(rawname); //get the col of raw 
	row = get_row_of_raw(rawname, col); // get the row of raw 
	rawdata = (int*)malloc(sizeof(int) * row * col);  // get the data named raw
	get_raw_from_csv(rawname, rawdata, row, col); // get raw from csv
	raw_totalSecond = row;
	printf("size of matrix: %d x %d\n", row, col); // print row and col
	rawdata_len = row * col;
	score = (int*)malloc(sizeof(int)*(raw_totalSecond/SECONDS_OF_EPOCH));
	
	col = get_col_of_raw(fftname); //get the col of raw 
	row = get_row_of_raw(fftname, col); // get the row of raw 
	fftdata = (int*)malloc(sizeof(int) * row * col);  // get the data named raw
	fftdata1 = (float*)malloc(sizeof(float) * row * col);  // get the data named raw
	get_raw_from_csv(fftname, fftdata, row, col); // get raw from csv
	printf("size of matrix: %d x %d\n", row, col); // print row and col
	for(index=0; index<row * col; index++) 
	{
		fftdata1[index] = (float)fftdata[index];
	}
	
	col = get_col_of_raw(bodypositionname); //get the col of raw 
	row = get_row_of_raw(bodypositionname, col); // get the row of raw 
	bodyposition = (int*)malloc(sizeof(int) * row * col);  // get the data named raw
	get_raw_from_csv(bodypositionname, bodyposition, row, col); // get raw from csv
	style_totalSecond = row;
	printf("size of matrix: %d x %d\n", row, col); // print row and col
	
	col = get_col_of_raw(bodymovename); //get the col of raw 
	row = get_row_of_raw(bodymovename, col); // get the row of raw 
	bodymove = (int*)malloc(sizeof(int) * row * col);  // get the data named raw 
	get_raw_from_csv(bodymovename, bodymove, row, col); // get raw from csv
	printf("size of matrix: %d x %d\n\n", row, col); // print row and col
	
	eeg_detect_algorithm(rawdata, fftdata1, bodyposition, bodymove, style_totalSecond, raw_totalSecond, score);
	printf("总共个数：%d\n\n", raw_totalSecond/SECONDS_OF_EPOCH);
	
	for(row=0; row<raw_totalSecond/SECONDS_OF_EPOCH; row++)
	{
		printf("第%d个30s脑电分类结果为：%d\n", row+1, score[row]); 
	}
	
    return 0;		    
}
