[x,fs]=audioread('∫ÿ≥¨∫Ù‡‡.m4a');
 x=x(1:3:end);
 
 window_size=256;
 precise_sample_fs=128;
 
 index_matrix=enframe(x,window_size,precise_sample_fs);
 range_matrix=max(index_matrix,[],2)-min(index_matrix,[],2);
 max_matrix=max(index_matrix,[],2);
 min_matrix=min(index_matrix,[],2);
 mean_matrix=mean(index_matrix,2);
 var_matrix=var(index_matrix,0,2);
 scope_matrix=sum(abs(diff(index_matrix,[],2)),2)/2;
 power_spectrum_matrix=sum(abs(fft(index_matrix,[],2)).^2,2);

feature_data1=zeros(size(index_matrix,1),2);
feature_data1(:,1)=max_matrix;
feature_data1(:,2)=min_matrix;
feature_data1(:,3)=range_matrix;
feature_data1(:,4)=mean_matrix;
feature_data1(:,5)=var_matrix;
feature_data1(:,6)=scope_matrix;
feature_data1(:,7)=power_spectrum_matrix;






 
 
 

