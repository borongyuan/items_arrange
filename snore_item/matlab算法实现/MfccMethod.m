 [audio_data,frequent_sample]=audioread('4460.wav','native');
 audio_data=audio_data(:,1);
% frequent_sample=16000;
% audio_data=x';
 
window_data=[];
mfcc_feature_vector=[];
window_size=256;
precise_sample=128;
p=24;
nfft=256;
fl=0;
fh=0.5;
K=12;

for i=1:size(audio_data,1)
    window_data=window_data_struct(window_data,window_size,audio_data(i));
    if  size(window_data,1)==window_size&&mod(i-window_size,precise_sample)==0&&size(find(window_data==0),1)~=window_size
         mfcc_feature = mfcc_feature_achieve(window_data,p,nfft,frequent_sample,fl,fh,K);
         mfcc_feature_vector=[mfcc_feature_vector;mfcc_feature];
    end
end

% figure,plot(audio_data)
% figure,plot(mfcc_feature_vector);ylim([0,5])