function saveDataset()
%This function saves the dataset to the workspace
%To load variables to workspace use load('mnistdata.mat'). You only have to
%do this if you don't want to use GUI

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project
cd ./dataPrep

%Get the data
training = readData('train-images','train-labels');
testing = readData('test-images', 'test-labels');

%Training data are too many(60000), keep 20000
training.images(:,:,20001:end) = [];
training.labels(20001:end) = [];

%Process data
[training.images,testing.images]=fixData(training.images,testing.images);

save('../mnistdata.mat','training', 'testing')
cd ../



