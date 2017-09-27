function  [is_voice_vector,short_time_energy,segments,sum_audio_data]=split_voice(filename,frequent_sample,audio_data,window_len,step,critical_value)

audio_data1=double(audio_data(:,1));
filter_audio_data=filter([1-0.9375],1,audio_data1);
frame_data=enframe(filter_audio_data,window_len,step);

short_time_energy=sum(abs(frame_data).^2,2);

is_voice_vector=zeros(size(frame_data,1),1);
has_voice_index=find(short_time_energy>=critical_value);

diff_index=diff(has_voice_index);
critical_diff_index=find(diff_index>=10);

segments=zeros(length(critical_diff_index)+1,2);

if size(critical_diff_index,1)~=0
   for i=1:size(segments,1)
       if i==1
          segments(i,1)=has_voice_index(1);
          segments(i,2)=has_voice_index(critical_diff_index(i));
      elseif i<=length(critical_diff_index)
          segments(i,:)=[has_voice_index(critical_diff_index(i-1)+1),has_voice_index(critical_diff_index(i))];
       else
          segments(i,:)=[has_voice_index(critical_diff_index(i-1)+1),has_voice_index(end)];
       end
   end
else
    segments(1,:)=[has_voice_index(1)  has_voice_index(end)];
end

filter_segments_index=find(diff(segments,[],2)<9);
segments(filter_segments_index,:)=[];
segments(:,3)=diff(segments,[],2)+1;

mkdir(strcat(filename(1:(end-4)),'_ÒôÆµ·Ö¸î'));
sum_audio_data=[];
for i=1:size(segments,1)
     is_voice_vector(segments(i,1):segments(i,2))=1;
     segments_audio_data=audio_data((step*(segments(i,1)-1)+1):(step*(segments(i,2)-1)+window_len),1);
     frame_audio_data=enframe(segments_audio_data,window_len,step);
     frame_audio_data(:,end+1)=[1:size(frame_audio_data,1)]';
     sum_audio_data=[sum_audio_data;frame_audio_data];
     audiowrite([strcat(filename(1:(end-4)),'_ÒôÆµ·Ö¸î'),'\',strcat(filename(1:(end-4)),'_',num2str(i),'.wav')],segments_audio_data,frequent_sample);
end

figure,plot(audio_data(:,1))
figure,plot(short_time_energy)
figure,plot(is_voice_vector)




    
             
        
        
        
        
        
        
        
    








