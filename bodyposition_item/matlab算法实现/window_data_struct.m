function   window_data=window_data_struct(window_data,window_size,gx,gy,gz)

window_data_size=size(window_data,1); %�ṹ�������ݵ�����
if window_data_size<window_size   %�����������
    window_data(window_data_size+1,1)=gx;
    window_data(window_data_size+1,2)=gy;
    window_data(window_data_size+1,3)=gz;
else  %�����ȳ����
    for  i=2:window_data_size
        window_data(i-1,1)=window_data(i,1);
        window_data(i-1,2)=window_data(i,2);
        window_data(i-1,3)=window_data(i,3);
    end
    window_data(window_data_size,1)=gx;
    window_data(window_data_size,2)=gy;
    window_data(window_data_size,3)=gz;
end
    
        
        
    



