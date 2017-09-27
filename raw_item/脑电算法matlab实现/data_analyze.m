% clc;clear;close all;
% % data1=csvread('android_trackrawdata_Jango_180_20170829_235730.csv');
% data2=csvread('android_trackrawdata_liaoliming_179_20170830_025335.csv');
% data3=csvread('android_trackrawdata_songyu_9_20170830_001001.csv');
% data4=csvread('android_trackrawdata_liaoliming_179_20170831_045709.csv');
% data5=csvread('C:\Users\EEG\Documents\WeChat Files\Liao910814\Files\android_trackrawdata_liaoliming_179_20170831_011958.csv');
% data6=csvread('C:\Users\EEG\Documents\WeChat Files\Liao910814\Files\android_trackrawdata_Jango_180_20170831_003414.csv');
% data5=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_liyugao_20170901_003609_rawdata.csv');
% data6=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liaoliming_179_20170901_000556.csv');s
% data6=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_songyu_9_20170828_232327.csv');
%  data7=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_songyu_9_20170827_230221.csv');
% data8=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_songyu_9_20170826_235212.csv');
% data8=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_songyu_9_20170822_233904.csv');
% data8=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_songyu_9_20170729_001424.csv');
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liyunting_102_20170904_011859.csv');%无效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_zhh_20170904_014155_rawdata.csv');%不明显
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_ljj_24_20170903_230048.csv'); %无效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_zhousiming_17_20170903_213253.csv');%无效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_linf_20170903_021130_rawdata.csv');%不明显
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_ljj_24_20170903_014159.csv');%不明显
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liyunting_102_20170903_000750.csv');%无效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_zhh_20170902_230256_rawdata.csv'); %不明显
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_zhousiming_17_20170902_222944.csv'); %无效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_ljj_24_20170902_012226.csv'); %有效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_liyugao_20170902_002346_rawdata.csv'); %有效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liyunting_102_20170902_000021.csv'); %无效
% data9=csvread('C:\Users\EEG\Desktop\eee_192.csv'); %有效
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liusong_149_20170808_091345.csv');
% data9=csvread('C:\Users\EEG\Desktop\脑电算法设计\脑电数据\android_trackrawdata_liaolm_163_20170914_152336.csv');
% data9=csvread('android_trackrawdata_songyu_9_20170826_235212.csv');

% data9=enframe(reshape(data9',1,[]),512,512);
% data9=data9(:,1:2:end);
% csvwrite('android_trackrawdata_liusong_149_20170808_091345.csv',data9);
% i1=find(max(data1,[],2)>=00);
% i2=find(max(data2,[],2)>=300);
% i3=find(max(data3,[],2)>=300);
% data1(i1,:)=0;
% data2(i2,:)=0;
% data3(i3,:)=0;

% filter_data1=enframe(data_movingfilter(reshape(data6',[],1),5,6),256,256);
% filter_data2=enframe(data_movingfilter(reshape(data2',[],1),5,1),256,256);
% filter_data3=enframe(data_movingfilter(reshape(data3',[],1),5,1),256,256);
% filter_data5=enframe(data_movingfilter(reshape(data5',[],1),5,3),256,256);
% filter_data6=enframe(data_movingfilter(reshape(data6',[],1),5,3),256,256);


% % data=[data1;data2;data3];
% data=data9(1:6000,:);
% %csvwrite('rawdata.csv',reshape(data',[],1));
% csvwrite('rawdata1.csv',data);
% data_max=max(abs(data),[],2);
% data_max_index=find(data_max>500);
% length(data_max_index)/length(data_max)
% data(data_max_index,:)=[];
% data_vector=reshape(data',[],1);
% i=find(abs(data_vector)>=mean(data_vector)*1.5);
% data_vector(i)=0;
% data=enframe(data_vector,256,256);

% filter_data=[filter_data1;filter_data2;filter_data3];
% filter_data=[filter_data5;filter_data6];

% 
% fft_data_energy=abs(fft(data,[],2)).^2;
% csvwrite('fftdata1.csv',fft_data_energy);
% %csvwrite('fftdata.csv',reshape(fft_data_energy',[],1));
% % fft_data_angle=angle(fft(data,[],2));
% sum_energy=sum(fft_data_energy,2);
% 
alpha_belta_mean=mean(fft_data_energy(:,10:15),2)./mean(fft_data_energy(:,18:23),2);
alpha_belta_percent=mean(enframe(alpha_belta_mean,30,30),2);
% alpha_belta_percent=sum(fft_data_energy(:,11:15),2)./sum(fft_data_energy(:,18:22),2);
% gamma_belta_percent=sum(fft_data_energy(:,1:6),2)./sum(fft_data_energy(:,18:22),2);
% gamma_alpha_percent=sum(fft_data_energy(:,1:6),2)./sum(fft_data_energy(:,11:15),2);
% alpha_sum_energy=sum(sum(fft_data_energy(:,11:15),2);
% belta_sum_energy=sum(fft_data_energy(:,18:22),2);
% movingfilter_data=data_movingfilter(alpha_belta_percent,100,6);
% alpha_belta_percent=data_movingfilter(alpha_belta_percent,5,2);
% gamma_belta_percent=data_movingfilter(gamma_belta_percent,250,10);
% gamma_alpha_percent=data_movingfilter(gamma_alpha_percent,250,10);

% figure('name','origin_data'),plot(reshape(data',[],1))
% figure,plot(reshape(filter_data',[],1))
% cup_noise_1=find(sum_energy<=2e+6);
% cup_noise=find(sum_energy>=mean(sum_energy(cup_noise_1))*1.5);
% fft_data_energy(cup_noise,:)=0;
% figure('name','FFT'),mesh(fft_data_energy(:,2:30))
% figure('name','sum_energy'),plot(sum_energy)
% figure('name','alpha_belta_percent'),plot(alpha_belta_percent)
% figure('name','alpha_belta_percent'),plot(sqrt(gamma_alpha_percent./alpha_belta_percent))
% figure('name','s1'),plot(1:size(alpha_belta_percent,1),alpha_belta_percent,'b',1:size(alpha_belta_percent,1),repmat(mean(alpha_belta_percent),size(alpha_belta_percent,1),1))
% figure('name','s2'),plot(gamma_belta_percent)
% figure('name','s3'),plot(gamma_alpha_percent)
% figure,plot(sum_energy)
% figure,plot(alpha_belta_percent)
% figure,plot(movingfilter_data)
% figure,plot(sum(fft_data_energy(:,18:22),2))
% figure,plot(alpha_sum_movingfilter_data)
% figure,plot(belta_sum_movingfilter_data)

