function  []=plot_data_image(data)

subplot(2,1,1),plot(1:size(data,1),data(:,1),'r',1:size(data,1),data(:,2),'b',1:size(data,1),data(:,3),'g');
xlabel('ʱ������');ylabel('���ٶȱ仯')
 legend('x��','y��','z��','Location','NorthEastOutside');%���ƽ��ٶȱ仯ͼ
 
 subplot(2,1,2),plot(1:size(data,1),data(:,4),'r',1:size(data,1),data(:,5),'b',1:size(data,1),data(:,6),'g');
xlabel('ʱ������');ylabel('������Ӧ�仯')
 legend('x��','y��','z��','Location','NorthEastOutside');%����������Ӧ�仯ͼ
 
%  subplot(3,1,3),plot(1:size(data,1),data(:,7),'r',1:size(data,1),data(:,8),'b',1:size(data,1),data(:,9),'g');
%  xlabel('ʱ������');ylabel('�Ƕȱ仯')
%  legend('x��','y��','z��','Location','NorthEastOutside');%���ƽǶȱ仯ͼ






