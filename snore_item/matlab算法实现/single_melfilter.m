function  [single_melbank,n_mflh]=single_melfilter(p,nfft,fs,fl,fh,p_index)

single_melbank=zeros(1,floor(nfft/2+1)); %定义一个行向量

mflh=[fl ,fh]*fs; %开始与截止频率
mflh=frq2mel(mflh); %转换成mel频率
melinc=diff(mflh)/(p+1);%mel频率极差

n=1:floor(nfft/2+1);
n_mflh=frq2mel((n-1)/nfft*fs);
non_index=find(n_mflh>=mflh(1)+(p_index-1)*melinc&n_mflh<=mflh(1)+(p_index+1)*melinc);
non_mflh=(n_mflh(non_index)-mflh(1))/melinc;

for i=1:size(non_mflh,2)
    if non_mflh(i)>=p_index
        non_mflh(i)=p_index+1-non_mflh(i);
    else
        non_mflh(i)=non_mflh(i)-p_index+1;
    end
end
non_mflh=2*non_mflh;
single_melbank(non_index)=non_mflh;











