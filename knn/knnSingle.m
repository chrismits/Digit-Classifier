function result = knnSingle(trainStruct, inputImg, k, isDataset)
%function result = knnalgo(testStruct, inputImg, inputLbl, k)
%This function classifies a single image, by comparing it to the dataset
%Inputs:
%   -trainStruct: The struct containing the training images and labels. Run
%   saveDataset.m to obtain it
%   -inputImg: The 28x28 image matrix that is going to be classified.
%   -k: The number of examples closer to inputImg that will be compared
%   -isDataset: Whether or not the image is chosen from the dataset.
%   Optional input. Default is false. If running from MNIST, choose TRUE
%Note:
%   -It is easier to use this function through the GUI with the provided
%   image.

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project

Ntrain = 7500;
distances = [];

%Check where the image comes from. If not from MNIST, has to be processed
if nargin == 3
    isDataset = false;
end
if isDataset == false
    inputImg = processSingle(inputImg);
end

%Loop through training images
for i = 1:Ntrain
    trainImg = trainStruct.images(:,:,i);
    sum = 0;
    %Loop through all pixels, compute sum and distance
    for k = 1:28
        for z = 1:28
            sum = sum + (trainImg(k,z) - inputImg(k,z))^2;
        end
    end
    dist = sqrt(double(sum));
    distances = [distances dist];
end

%Sort and get indices
[distances, minIndexes] = sort(distances);

%Shorten with respect to k
distances = distances(1:k);
%Get these minimum indexes
minIndexes = minIndexes(1:k);

possibleChoices = trainStruct.labels(minIndexes);
result = mode(possibleChoices);


