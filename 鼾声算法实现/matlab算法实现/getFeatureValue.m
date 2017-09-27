fileAddress='1435_“Ù∆µ∑÷∏Ó\';
filename=dir([fileAddress,'*.wav']);
frame_window_size=1024;
frame_step=512;
choose_segment_index=[1,9,10,11,14,16,2:8];

sum_data=[];
for i=choose_segment_index
    audio_data=audioread([fileAddress,filename(i).name],'native');
    audio_data=audio_data(:,1);
    audio_data_frame=enframe(audio_data,frame_window_size,frame_step);
    audio_data_frame(:,end+1)=[1:size(audio_data_frame,1)]';
    sum_data=[sum_data;audio_data_frame];
%     figure(i),plot(audio_data)
end
figure,plot(reshape(sum_data',[],1));

    
    

