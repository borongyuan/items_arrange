function location_feature_achieve=achieve_location_feature(window_data)

% 获取结构体数据的特征值
gx_mean=mean(window_data(:,1)); 
gy_mean=mean(window_data(:,2)); %均值
gz_mean=mean(window_data(:,3)); 

gx_sd=sqrt(var(window_data(:,1)));
gy_sd=sqrt(var(window_data(:,2)));  % gx标准差
gz_sd=sqrt(var(window_data(:,3)));

gx_scope=sum(abs(diff(window_data(:,1))))/2;
gy_scope=sum(abs(diff(window_data(:,2))))/2;
gz_scope=sum(abs(diff(window_data(:,3))))/2;

location_feature_achieve=[gx_mean,gy_mean,gz_mean,gx_sd,gy_sd,gz_sd,gx_scope,gy_scope,gz_scope];