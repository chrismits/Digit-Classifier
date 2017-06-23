function labels = loadlbl(fileId2, numImages)
%function labels = loadlbl(fileId2, numImages)
%This function loads and converts the image labels (digits from 0-9)
%This function is built as a subfunction of another function. Don't use on
%its own
%Input:
%   -fileId2: The file identifier
%   -numImages: The number of images
%Output:
%   -labels: A vector of doubles

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project

%For more information, about how data is read see slides

%Magic number for labels is 2049
magic = fread(fileId2, 1, 'int32', 0, 'ieee-be');
if magic ~= 2049
    error('Invalid label file, magic number')
end

%Labels must have an exact correspondence to images else wrong file
numLabels = fread(fileId2, 1, 'int32', 0, 'ieee-be');
if numLabels ~= numImages
    error('Invalid label-image correspondence')
end

%read rest of file
labels = fread(fileId2, inf, 'unsigned char');
if length(labels) ~= numLabels
    error('Invalid file, wrong file header')
end

%convert from unsigned char to double
labels = double(labels);




