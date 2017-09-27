%% ԭʼ�źŶ�ȡ
[audio_data,sample_frequent]=audioread('4460.wav','native');
audio_data=audio_data(:,1);

%% �źŷ�֡����
 window_size=256;
 precise_sample_fs=128;
 index_matrix=enframe(audio_data,window_size,precise_sample_fs);
 
 %% ʱ����������
 short_time_energy=sum(index_matrix.^2,2); %��ʱ����
 short_time_amplify=sum(abs(index_matrix),2);%��ʱƽ������
 short_time_passZero=ceil(sum(abs(diff(sign(index_matrix),[],2)),2)/2);%��ʱ������
 short_time_xcorr=zeros(size(index_matrix,1),2*size(index_matrix,2)-1);
 for i=1:size(index_matrix,1)                                         %��ʱ����غ���
     short_time_xcorr(i,:)=xcorr(index_matrix(i,:));
 end
 short_time_amplifydiff=zeros(size(index_matrix));
 for i=1:size(index_matrix,1)                                        %��ʱƽ�����Ȳ�
     short_time_amplifydiff(i,:)=amplifydiff_comput(index_matrix(i,:));
 end

 %% Ƶ����������
 index_matrix_fft=fft(index_matrix,window_size,2); %fft�任
 short_time_energy_spectrum=abs(index_matrix_fft).^2; %������
 short_time_amplify_spectrum=abs(index_matrix_fft); %������
 short_time_angle_spectrum=angle(index_matrix_fft); %��λ��
 short_time_power_spectrum_density=abs(index_matrix_fft).^2/window_size;%������
 short_time_sum_energy_spectrum=sum(short_time_energy_spectrum,2);%�������ף�������
 short_time_energy_spectrum_db=20*log10(short_time_sum_energy_spectrum);%�������ף������ֱ���
 short_time_mfcc_feature=zeros(size(index_matrix,1),12);
 for i=1:size(index_matrix,1)                                                                             %mfcc����
   short_time_mfcc_feature(i,:)=mfcc_feature_achieve(index_matrix(i,:).',24,256,16000,0,0.5,12);
 end
 
 %% ��ͼ��
 figure('name','ԭʼ�ź�ͼ'),plot(audio_data); %��ԭʼ�ź�ʱ����ͼ
 figure('name','��ʱ����'),plot(short_time_energy); %����ʱ����ͼ
 figure('name','��ʱƽ������'),plot(short_time_amplify); %����ʱƽ������ͼ
 figure('name','��ʱ������'),plot(short_time_passZero); %����ʱ������ͼ
%  figure('name','��ʱ����غ���'),plot(short_time_xcorr); %����ʱ����غ���ͼ
%  figure('name','��ʱƽ�����Ȳ��'),plot(short_time_amplifydiff); %����ʱƽ�����Ȳ��ͼ
%  figure('name','������'),plot(short_time_energy_spectrum); %��������ͼ
%  figure('name','������'),plot(short_time_amplify_spectrum); %��������ͼ
%  figure('name','��λ��'),plot(short_time_angle_spectrum);   %����λ��ͼ
%  figure('name','������'),plot(short_time_power_spectrum_density); %��������ͼ
 figure('name','��������'),plot(short_time_sum_energy_spectrum); %����������ͼ
 figure('name','�������ף��ֱ�ֵ��'),plot(short_time_energy_spectrum_db); %���������ף��ֱ�ֵ��ͼ
 figure('name','mfcc��Ƶ��'),imagesc(short_time_mfcc_feature); colorbar%��mfcc��Ƶ��ͼ
 n=0:(window_size-1);
 fs=n*sample_frequent/window_size;
 figure('name','Ƶ��ͼ'),plot(fs,short_time_amplify_spectrum(927,:))%��Ƶ��ͼ
 

