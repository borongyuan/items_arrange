function  movingfilter_data=data_movingfilter(window_data,filter_len,filter_num)
%filter_len �������ڴ�С��filter_num ��������
for i=1:filter_num
   movingfilter_data=zeros(size(window_data));
  for j=1:size(window_data,2)
      movingfilter_data(:,j)=movingfilter(window_data(:,j),filter_len);
  end
  window_data=movingfilter_data;
end
    


