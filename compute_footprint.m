%clc
%clear all
%close all
load posts
posts=[pos;neg];
splits=[200,400,1200,1600,2000];
k=10;
footprint=zeros(3,5);
%assume meaningless user preferences
userinput = input('Enter three or more keywords to search for relevant posts within single quotes');
up=userinput;

for janice=1:5
tic
ngrams_preprocessed=[];
preproc_inputcellarray=posts(1:splits(janice));

for i=1:size(preproc_inputcellarray,2)
    var=n_grams(preproc_inputcellarray{i},3);
ngrams_preprocessed=[ngrams_preprocessed;[var num2cell(repmat(i,size(var)))]];
end
%up='motorola junk junk';
upn=n_grams(up,3);

accum=[];
for i=1:size(upn,1)
for j=1:size(ngrams_preprocessed,1)
[v,~]=EditDistance(char(upn{i}),char(ngrams_preprocessed{j,1}));accum(end+1,:)=[v,j];
end
end

accum_sort=sortrows(accum,1);
accum_sort1=accum_sort(1:k,:);
footprint(3,janice)=size(find(accum_sort1(:,1)<=1000),1)/k;
t=toc;
mem=memory;
mem=mem.MemUsedMATLAB;

footprint(1,janice)=t;
footprint(2,janice)=mem;
end
    