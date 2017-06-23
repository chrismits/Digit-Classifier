function accuracy = knnAll(trainStruct,testStruct,k,Ntest,Ntrain)
%function accuracy = knnAll(trainStruct,testStruct,k,Ntest,Ntrain)
%This function classifies test data against training data
%Inputs:
%   -trainStruct: Struct containing training labels and images
%   -testStruct: Struct containing testing labels and images
%   -k: The number of closest distances to choose from
%   -Ntrain: Number of images to train with (Optional: 1-20000)
%   -Ntest: Number of images to test (Optional: tr1-10000)
%Output:
%   -Accuracy: Accuracy of the classifier

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project
tic
%Setting up number of training and testing images
if nargin <= 5
    if nargin == 4
        Ntrain = 5000;
    end
    if nargin == 3
        Ntrain = 5000;
        Ntest = 200;
    end
end

if ( (Ntest <= 0) || (Ntest > 10000) )
    error('Invalid number of testing images')
end
if ( (Ntrain <= 0) || (Ntrain > length(trainStruct.labels)) )
    error('Invalid number of training images')
end

err = 0;
results = [];
mislabeled = [];

%Loop through all cases being tested
for i = 1:Ntest
    testImg = testStruct.images(:,:,i);
    distances = [];
    
    %Loop through every training image to classify
    for j = 1:Ntrain
        trainImg = trainStruct.images(:,:,j);
        sum = 0;
        
        %Find sum and distance of images(28 pixel width and height)
        for l = 1:28
            for m = 1:28
                sum = sum + (testImg(l,m) - trainImg(l,m))^2;
            end
        end    
        dist = sqrt(sum);
        %Concatenate them in vector
        distances = [distances dist];  
    end
    
    %Sort ascending order
    [distances, minIndexes] = sort(distances);
    
    %Pull out k values and indexes
    distances = distances(1:k);
    minIndexes = minIndexes(1:k);
    %Get corresponding training labels
    possible = trainStruct.labels(minIndexes);
    
    %Find results and concatenate them to results vector
    results = [results mode(possible)];
    
    %Error calculations
    if results(i) ~= testStruct.labels(i)
        err = err + 1;
        mislabeled = [mislabeled i];
    end
    
end

time = toc;
accuracy = (Ntest - err)/Ntest;

%Present statistics
knnStats(results, mislabeled, err, time)
disp('Stats file ready in main directory')

