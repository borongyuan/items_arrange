function   data=data_format_transform(file_name,sample_fs,element_cols)

init_data=csvread(file_name);%��ȡ����
if  size(init_data,2)>sample_fs*element_cols
    init_data(:,(sample_fs*element_cols+1):size(init_data,2))=[];
end
% init_data(:,end)=[];%�����һ�У�ȫΪ0��ȥ��
init_data_transpose=init_data.';
init_data_AsVector=init_data_transpose(:);%��ԭʼ����ת�ú���һ��
data=reshape(init_data_AsVector,element_cols,floor(length(init_data_AsVector)/element_cols));%��һ������ת���ɾ���
data=data'; %������ת�ã�ÿ��Ϊһ�����ݵ㣨9��ά�ȣ�

void=[];
for i=1:size(data,1)
    if data(i,:)==0
        void=[void;i];
    end
end
if size(void,1)~=0
    data(void,:)=[];
end






