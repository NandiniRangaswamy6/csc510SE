splits=[100,200,300,400,500];
k=10;
footprint=zeros(3,5);

for janice=1:5
    tic
[labels,scores]=B.predict(featureVector(501:500+splits(janice),:));
labels=str2num(cell2mat(labels));
footprint(3,janice)=size(find(labels==1),1)/size(labels,1);
scores(:,2)=linspace(1,size(scores,1),size(scores,1));

accum_sort=sortrows(scores,1);
 %accum_sort1=accum_sort(2000-k:2000,:);
 
 t=toc;
mem=memory;
mem=mem.MemUsedMATLAB;

footprint(1,janice)=t;
footprint(2,janice)=mem;
end