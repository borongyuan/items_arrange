function   data=data_format_transform(file_name,sample_fs,element_cols)

init_data=csvread(file_name);%读取数据
if  size(init_data,2)>sample_fs*element_cols
    init_data(:,(sample_fs*element_cols+1):size(init_data,2))=[];
end
% init_data(:,end)=[];%将最后一列（全为0）去掉
init_data_transpose=init_data.';
init_data_AsVector=init_data_transpose(:);%将原始数据转置后变成一列
data=reshape(init_data_AsVector,element_cols,floor(length(init_data_AsVector)/element_cols));%将一列数据转化成矩阵
data=data'; %矩阵再转置，每行为一个数据点（9个维度）

void=[];
for i=1:size(data,1)
    if data(i,:)==0
        void=[void;i];
    end
end
if size(void,1)~=0
    data(void,:)=[];
end






