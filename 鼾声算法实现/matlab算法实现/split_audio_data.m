clc;clear;
filename='1435.wav';
window_len=1024;
step=512;
critical_value=1e+6;

[audio_data,frequent_sample]=audioread(filename, 'native');
if max(audio_data)<=2
    audio_data=audio_data*32767;
end
[is_voice_vector,short_time_energy,segments,segment_audio_data]=split_voice(filename,frequent_sample,audio_data,window_len,step,critical_value);