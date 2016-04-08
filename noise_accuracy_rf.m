splits=[100,200,300,400,500];
snr = 10.^(0.1.*5);
noise = 1/sqrt(2)*(randn(2000,2296)+1i*randn(2000,2296));

fv_noise = featureVector+ noise.*snr;

for janice=1:5
    tic
[labels,scores]=s.predict(featureVector(501:500+splits(janice),:));
%labels=str2num(cell2mat(labels));
accuracy_svm(janice)=size(find(labels==1),1)/size(labels,1);
end