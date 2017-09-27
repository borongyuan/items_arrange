function  [mfcc_feature,c1] = mfcc_feature_achieve(window_data,p,nfft,fs,fl,fh,K)

mfcc_feature=zeros(1,K);
if size(find(window_data==0),1)~=nfft
    w=1+0.5*K*sin(pi*[1:K]./K);%��һ��������������  
    w=w/max(w);%Ԥ�����˲���
    y=window_data*(1-0.9375);  %������֡
    s=y.*hamming(nfft);  
    t=abs(fft(s));%FFT���ٸ���Ҷ�任  
    t=t.^2; 
 
    c1=zeros(1,K);
    for k=1:K  
      for n=0:(p-1)
         c1(k)=c1(k)+cos((2*n+1)*k*pi/(2*p))*log(single_melfilter(p,nfft,fs,fl,fh,n+1)/1.9853*t(1:floor(nfft/2+1)));
      end
    end
    mfcc_feature=c1.*w;  %��ȡmfcc
end
 
  
