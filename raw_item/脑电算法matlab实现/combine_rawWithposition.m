bodymove=bodymove_amplitude_vector;
bodyposition=bodyposition_style_vector;
bodymove_index=enframe(bodymove,60,60);
bodyposition_index=enframe(bodyposition,60,60);

bodyposition_stand=zeros(size(bodyposition_index,1),1);
[row_index,~]=find(bodyposition_index==5);
index_count=histc(row_index,unique(row_index));
bodyposition_stand(unique(row_index))=index_count;

whether_wake=zeros(size(bodyposition_index,1),1);
index=find(bodyposition_stand>=1);
whether_wake(index)=1;

bodymove_stand=zeros(size(bodymove_index,1),1);
[row_index,~]=find(bodymove_index>0);
index_count=histc(row_index,unique(row_index));
bodymove_stand(unique(row_index))=index_count;

figure,plot(bodymove)
figure,plot(bodyposition)
figure,plot(whether_wake)
figure,plot(bodymove_stand)
