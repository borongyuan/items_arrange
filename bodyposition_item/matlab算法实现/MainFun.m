window_data=[];%��ʼ���洢���ݴ��ڣ�50��2��
precise_feature_data=[];%��ʼ���洢�������ݣ�����������-ʶ����λ���ڴ�С+1����4��
precise_style_vector=[];
diff_amplitudeValue_vector=[];
location_amplitude_rank_vector=[];

window_size=50;%ʶ����λ���ڴ�С
filter_len=5;%�����˲����ڴ�С
filter_num=5;%�����˲�����
precise_sample_fs=25;%��ȷ��λ����Ƶ��
diff_location_amplitudeValue_ThresholdValue=20000;%��λ����ֵ

precise_style_judge=0; %��ȷ��λ��ֵ

data_size=size(data,1); %����������

feature_matrix=[ -10717.20 ,-11743.6, -11783, 11714.0 ,11788 , 11172.40, 650.40];%ֱ����ƽ�ԡ��Ҳ��ԡ�����ԡ����ԡ���������·������λ���ٽ�ֵ
                       
for i=1:data_size  %ʵʱ������λ
    
    window_data=window_data_struct(window_data,window_size,data(i,4),data(i,5),data(i,6));%Ҫgx,gy,gz����
    
    if size(window_data,1)==window_size&&mod(i-window_size,precise_sample_fs)==0%ÿ��0.5s����һ��
        
        
        movingfilter_data=data_movingfilter(window_data,filter_len,filter_num); %�����˲�
        location_feature_achieve=achieve_location_feature(movingfilter_data);%ʱ��������ȡ
        
        precise_style_judge=identify_location_style( location_feature_achieve,feature_matrix);
        diff_location_amplitudeValue=sqrt(sum(location_feature_achieve(7:9).^2));
        location_amplitude_rank=amplitude_rank_test(diff_location_amplitudeValue,diff_location_amplitudeValue_ThresholdValue);
        
        precise_feature_data=[precise_feature_data;location_feature_achieve];%����ֵ�洢
        diff_amplitudeValue_vector=[diff_amplitudeValue_vector;diff_location_amplitudeValue];
        precise_style_vector=[precise_style_vector;precise_style_judge];%��λ�洢,����Ƶ��0.5s
        location_amplitude_rank_vector=[location_amplitude_rank_vector;location_amplitude_rank];
    end
end

figure(1),plot_data_image(data); %��ԭʼ����ͼ��

num_count=histc(precise_style_vector,unique(precise_style_vector));
count_matrix=[unique(precise_style_vector) num_count/sum(num_count)]';%����ϸ��λ��ʱ��ռ��
figure(2),bar(count_matrix(1,:),count_matrix(2,:))

figure(3),plot(precise_style_vector);ylim([0 7]) %����ϸ��λͼ

figure(4),plot(diff_amplitudeValue_vector)

figure(5),plot(location_amplitude_rank_vector)