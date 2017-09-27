window_data=[];%初始化存储数据窗口：50行2列
precise_feature_data=[];%初始化存储特征数据：（数据行数-识别体位窗口大小+1）行4列
precise_style_vector=[];
diff_amplitudeValue_vector=[];
location_amplitude_rank_vector=[];

window_size=50;%识别体位窗口大小
filter_len=5;%滑动滤波窗口大小
filter_num=5;%滑动滤波次数
precise_sample_fs=25;%精确体位采样频率
diff_location_amplitudeValue_ThresholdValue=20000;%体位差阈值

precise_style_judge=0; %精确体位初值

data_size=size(data,1); %数据总行数

feature_matrix=[ -10717.20 ,-11743.6, -11783, 11714.0 ,11788 , 11172.40, 650.40];%直立、平卧、右侧卧、左侧卧、俯卧、倒立、走路五种体位的临界值
                       
for i=1:data_size  %实时捕获体位
    
    window_data=window_data_struct(window_data,window_size,data(i,4),data(i,5),data(i,6));%要gx,gy,gz数据
    
    if size(window_data,1)==window_size&&mod(i-window_size,precise_sample_fs)==0%每隔0.5s采样一次
        
        
        movingfilter_data=data_movingfilter(window_data,filter_len,filter_num); %滑动滤波
        location_feature_achieve=achieve_location_feature(movingfilter_data);%时域特征提取
        
        precise_style_judge=identify_location_style( location_feature_achieve,feature_matrix);
        diff_location_amplitudeValue=sqrt(sum(location_feature_achieve(7:9).^2));
        location_amplitude_rank=amplitude_rank_test(diff_location_amplitudeValue,diff_location_amplitudeValue_ThresholdValue);
        
        precise_feature_data=[precise_feature_data;location_feature_achieve];%特征值存储
        diff_amplitudeValue_vector=[diff_amplitudeValue_vector;diff_location_amplitudeValue];
        precise_style_vector=[precise_style_vector;precise_style_judge];%体位存储,采样频率0.5s
        location_amplitude_rank_vector=[location_amplitude_rank_vector;location_amplitude_rank];
    end
end

figure(1),plot_data_image(data); %画原始数据图像

num_count=histc(precise_style_vector,unique(precise_style_vector));
count_matrix=[unique(precise_style_vector) num_count/sum(num_count)]';%画精细体位的时间占比
figure(2),bar(count_matrix(1,:),count_matrix(2,:))

figure(3),plot(precise_style_vector);ylim([0 7]) %画精细体位图

figure(4),plot(diff_amplitudeValue_vector)

figure(5),plot(location_amplitude_rank_vector)