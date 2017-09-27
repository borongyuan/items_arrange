function  []=plot_data_image(data)

subplot(2,1,1),plot(1:size(data,1),data(:,1),'r',1:size(data,1),data(:,2),'b',1:size(data,1),data(:,3),'g');
xlabel('时间序列');ylabel('角速度变化')
 legend('x轴','y轴','z轴','Location','NorthEastOutside');%绘制角速度变化图
 
 subplot(2,1,2),plot(1:size(data,1),data(:,4),'r',1:size(data,1),data(:,5),'b',1:size(data,1),data(:,6),'g');
xlabel('时间序列');ylabel('重力感应变化')
 legend('x轴','y轴','z轴','Location','NorthEastOutside');%绘制重力感应变化图
 
%  subplot(3,1,3),plot(1:size(data,1),data(:,7),'r',1:size(data,1),data(:,8),'b',1:size(data,1),data(:,9),'g');
%  xlabel('时间序列');ylabel('角度变化')
%  legend('x轴','y轴','z轴','Location','NorthEastOutside');%绘制角度变化图






