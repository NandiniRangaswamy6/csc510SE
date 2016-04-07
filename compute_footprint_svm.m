load svm_data;
splits=[100,200,300,400,500];
footprint=zeros(3,5);
k=10;
for janice=1:5
    tic
     [label,score] = predict(s,featureVector(501:501+splits(janice),:) );
    


footprint(3,janice)=size(find(label==1),1)/size(label,1);


    
score(:,2)=linspace(1,size(score,1),size(score,1));

accum_sort=sortrows(score,1);
 %accum_sort1=accum_sort(2000-k:2000,:);
 
 t=toc;
mem=memory;
mem=mem.MemUsedMATLAB;

footprint(1,janice)=t;
footprint(2,janice)=mem;
end