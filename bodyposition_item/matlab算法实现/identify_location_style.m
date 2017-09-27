function  location_style_judge=identify_location_style( location_feature_achieve,feature_matrix)

location_style_judge=0;

if  location_feature_achieve(3)<=feature_matrix(2)
        location_style_judge=3;  %识别仰卧
end

if  location_feature_achieve(2)<=feature_matrix(3)
        location_style_judge=4; %识别右侧卧
end

if  location_feature_achieve(2)>=feature_matrix(4)
        location_style_judge=2;%识别左侧卧
end

if  location_feature_achieve(3)>=feature_matrix(5)
         location_style_judge=1;%识别俯卧
end

if  location_feature_achieve(1)<=feature_matrix(1)&& location_feature_achieve(4)<feature_matrix(7)
         location_style_judge=5;%识别直立
end

if  location_feature_achieve(1)>=feature_matrix(6)
         location_style_judge=6;%识别倒立
end

if   location_feature_achieve(4)>=feature_matrix(7)|| location_feature_achieve(5)>=feature_matrix(7)|| location_feature_achieve(6)>=feature_matrix(7)
         location_style_judge=7;%识别走路
end





