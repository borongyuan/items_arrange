function  [mfcc_feature,c1] = mfcc_feature_achieve(window_data,p,nfft,fs,fl,fh,K)

mfcc_feature=zeros(1,K);
if size(find(window_data==0),1)~=nfft
    w=1+0.5*K*sin(pi*[1:K]./K);%归一化倒谱提升窗口  
    w=w/max(w);%预加重滤波器
    y=window_data*(1-0.9375);  %语音分帧
    s=y.*hamming(nfft);  
    t=abs(fft(s));%FFT快速傅里叶变换  
    t=t.^2; 
 
    c1=zeros(1,K);
    for k=1:K  
      for n=0:(p-1)
         c1(k)=c1(k)+cos((2*n+1)*k*pi/(2*p))*log(single_melfilter(p,nfft,fs,fl,fh,n+1)/1.9853*t(1:floor(nfft/2+1)));
      end
    end
    mfcc_feature=c1.*w;  %获取mfcc
end
 
  
