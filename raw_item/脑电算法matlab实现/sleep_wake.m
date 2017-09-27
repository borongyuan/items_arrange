% clear all;clc;
% close all;
% warning off  all;

%% file name
%--------liyugao
% 有效
% namelyg1 = 'C:\Users\Bryan\Desktop\sleep702\0901\android_liyugao_20170901_003609\android_liyugao_20170901_003609_rawdata.csv';
% namelyg2 = 'C:\Users\Bryan\Desktop\sleep702\0904\liyugao\android_liyugao_20170902_002346\android_liyugao_20170902_002346_rawdata.csv';
% namelyg3 = 'C:\Users\Bryan\Desktop\sleep702\0904\liyugao\liyugao170903000039\android_liyugao_20170904_000039_rawdata.csv';
% %-------lanruiming
% %有效
% namelrm1 = 'C:\Users\Bryan\Desktop\sleep702\0904\lanruiming\eee_1.csv';
% namelrm2 = 'C:\Users\Bryan\Desktop\sleep702\0904\lanruiming\eee_2.csv';
% namelrm3 = 'C:\Users\Bryan\Desktop\sleep702\0904\lanruiming\eee_3.csv';
% %------------linfeng
% %有效
% namelf1 = 'C:\Users\Bryan\Desktop\sleep702\0904\linfeng\android_linf_20170903_021130\android_linf_20170903_021130_rawdata.csv';
% namelf2 = 'C:\Users\Bryan\Desktop\sleep702\0904\linfeng\android_linf_20170902_004601\android_linf_20170902_004601_rawdata.csv';
% %--------------hehe
% %alpha几乎看不出来
% namezhh1 = 'C:\Users\Bryan\Desktop\sleep702\0904\zhouhuahe\android_zhh_20170902_230256\android_zhh_20170902_230256_rawdata.csv';
% namezhh2 = 'C:\Users\Bryan\Desktop\sleep702\0904\zhouhuahe\android_zhh_20170904_014155\android_zhh_20170904_014155_rawdata.csv';
% %---------------liyunting
% %作废
% namelyt1 = 'C:\Users\Bryan\Desktop\sleep702\0904\liyunting\android_liyunting_102_20170903_000750\android_trackrawdata_liyunting_102_20170903_000750.csv';
% namelyt2 = 'C:\Users\Bryan\Desktop\sleep702\0904\liyunting\android_liyunting_102_20170904_011859\android_trackrawdata_liyunting_102_20170904_011859.csv';
% namelyt3 = 'C:\Users\Bryan\Desktop\sleep702\0904\liyunting\android_liyunting_102_20170902_000021\android_trackrawdata_liyunting_102_20170902_000021.csv';
% %--------------lujingjing
% %有效
% nameljj1= 'C:\Users\Bryan\Desktop\sleep702\0904\lujingjing\android_ljj_24_20170902_012226\android_trackrawdata_ljj_24_20170902_012226.csv';
% nameljj2 = 'C:\Users\Bryan\Desktop\sleep702\0904\lujingjing\android_ljj_24_20170903_014159\android_trackrawdata_ljj_24_20170903_014159.csv';
% % 严重丢包
% nameljj3 = 'C:\Users\Bryan\Desktop\sleep702\0904\lujingjing\android_ljj_24_20170903_230048\android_trackrawdata_ljj_24_20170903_230048.csv';
% %-----------------zhousiming
% % 作废
% namezsm1= 'C:\Users\Bryan\Desktop\sleep702\0904\zhousiming\android_zhousiming_17_20170902_222944\android_trackrawdata_zhousiming_17_20170902_222944.csv';
% namezsm2= 'C:\Users\Bryan\Desktop\sleep702\0904\zhousiming\android_zhousiming_17_20170903_213253\android_trackrawdata_zhousiming_17_20170903_213253.csv';
% namezsm3= 'C:\Users\Bryan\Desktop\sleep702\0904\zhousiming\zhousiming0901\android_trackrawdata_zhousiming_17_20170901_225549.csv';
% namezsm4 = 'C:\Users\Bryan\Desktop\sleep702\0905\android_zhousiming_17_20170905_005212\android_trackrawdata_zhousiming_17_20170905_005212.csv'; 
% %-------- songyu
% namesy1 = 'C:\Users\Bryan\Desktop\sleep702\0828\songyu\android_songyu_9_20170826_235212\android_trackrawdata_songyu_9_20170826_235212.csv';
namelyg1  = 'iOS_EEG_18682134494_20170915_185829_rawdata.csv';



%% read csv and plot raw
% data1 = csvread(namelyg1);
% data2 = csvread(namelyg2);
% data3 = csvread(namelyg3);
% data4 = csvread(namelrm1);
% data5 = csvread(namelrm2);
% data6 = csvread(namelrm3);
% data7 = csvread(namelf1);
% data8 = csvread(namelf2);
% data9 = csvread(namelyg3);
% data10 = csvread(namezhh1);
% data11 = csvread(namezhh2);
% data12 = csvread(nameljj1);
% data13 = csvread(nameljj2);
% data14 = csvread(namesy1);
% data = [data1; data2; data3; data4; data5; data6; data7; data8; data9; data10; data11; data12; data13; data14];
data = csvread(namelyg1);
% figure('name', 'raw'); plot(   reshape(data', 1 , [])  ); title('raw'); axis tight;







%% denoise raw and plot
% data = data - mean(reshape(data',1,[]));

% ab = abs(data);
% ab = reshape(data', 1, []);
% n = floor(length(ab) / (30 * 256) );
% mat = reshape(ab(1:30*256*n), 30*256, n);
% smat1 = max(mat, [], 1) > 500;
% figure, plot(smat1); ylim([-0.2 1.2]);



% Ind = max(abs(data), [], 2) > 500;
% data(Ind, :) = [];
% figure('name', 'raw'); plot(   reshape(data', 1 , [])  ); title('denoise raw'); axis tight;




 
%% fft
fftData = abs(fft(data, [], 2)).^2;
csvwrite('fftdata.csv',fftData);
halfFft = fftData(:, 1:round(size(fftData, 2) / 2));
temp = halfFft(:, 1:50);
%compute feature per second
sum1 = mean(temp(:, 10:15) ,2) ./ mean(temp(:, 18:23)  , 2);
s1 = sum1';
%mean feature within 30 seconds 
num = floor(length(s1) / 30);
ms1 = mean(reshape(s1(1:30*num), 30, []));


% ms1 = smoothpoly(ms1, 5, 0);
% ms1 = smoothpoly(ms1, 5, 0);
ms1 = averagingfilter(ms1,8);
ms1 = averagingfilter(ms1,8);
ms1 = averagingfilter(ms1,8);
ms1 = averagingfilter(ms1,8);
%% compute threshold
k = 3;
len = 5;
thr = k * ones(1,length(ms1));
coef = 0.5;
coef2 = 0.5;
startpoint=31;
k1 = [1,startpoint-1];
for i = startpoint:length(ms1)
    if(((thr(i-1)>ms1(i-1))&&thr(i-1)<ms1(i))||(thr(i-1)<ms1(i-1)&&thr(i-1)>ms1(i)))
        k1 = [k1(2),i];
        if(k1(2)-k1(1)>=len)
            thr(i) = coef*mean(ms1(k1(1):k1(2)-1))+coef2*ms1(i);
        else
            thr(i) = thr(i-1);
        end
%     elseif (((thr(i-1)>ms1(i-1))&&thr(i-1)>ms1(i))||(thr(i-1)>ms1(i-1)&&thr(i-1)>ms1(i)))
%        thr(i)=thr(i-1);
        
    else
        
%         thr(i) = coef*mean(ms1(k1(1):k1(2)-1)) + coef2*mean(ms1(k1(2):i));
           thr(i)=thr(i-1);
     end
  end



%% plot threshold and feature
x = 1:length(ms1);
figure('name', 'mean');
subplot(1, 1, 1); plot( x, ms1, 'b', x, thr, 'r'); title('10~15 / 18~23'); axis tight;
