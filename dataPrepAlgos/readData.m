function data = readData(imgfile, lblfile)
%function data = readData(images, labels)
%This function reads in data and stores them in a structure
%This function is built as a subfunction of another function. Don't use on
%its own.
%Inputs: 
%   -imgfile: A MNIST file containing images
%   -lblfile: A MNIST file containing labels
%Output:
%   -data: A structure containing the number of images, the width, the
%   height of each images, the array of all images and the vector of labels

% Christos-Nikolaos Mitsopoulos
% ES-2 Final Project

%open imagefile in big endian ordering as specified by dataset
fid1 = fopen(imgfile, 'rb');
if fid1 == -1
    error('Unable to open imagefile')
end

%open labelfile
fid2 = fopen(lblfile, 'rb');
if fid2 == -1
    error('Unable to open labelfile')
end

%Get images
[images, numImg, width, height] = loadImg(fid1);

%Get labels
labels = loadlbl(fid2, numImg);

%Create struct with all information
data = struct('imageNum', numImg, 'width', width, 'height', height,...
    'images', images, 'labels', labels);

fclose(fid1);
fclose(fid2);





