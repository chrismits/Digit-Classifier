function [images, numImg, width, height] = loadImg(fileId1)
%function images = loadImg(fileId)
%This function loads and scales the image matrix
%This function is built as a subfunction of another function. Don't use on
%its own.
%Inputs:
%   -fileId1: The file identifier
%Output:
%   -images: A heigth*width*imagesnum array (All images)
%   -numImg: The number of images
%   -width: The width of each image
%   -height: The height of each image

%For more information, about how data is read see slides

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project

%Magic number for images is 2051
%Size 1, type 32bit integer, big-endian storing
magic = fread(fileId1, 1, 'int32', 0, 'ieee-be');
if magic ~= 2051
    error('Invalid image file, magic number')
end

%Second header is number of images
%Third header is number of rows
%Fourth header is number of columns
imageNum = fread(fileId1, 1, 'int32', 0, 'ieee-be');
rows = fread(fileId1, 1, 'int32', 0, 'ieee-be');
columns = fread(fileId1, 1, 'int32', 0, 'ieee-be');

%The rest of image file is images so size = rest of file
%and type = unsigned character
%Images = rows*columns*imageNum
images = fread(fileId1, inf, 'unsigned char');

if numel(images) ~= rows*columns*imageNum
    error('Invalid file. Wrong number of elements of image')
end

%To make compatible, reshape to matrix of rows, cols, images dimensions
images = reshape(images, columns, rows, imageNum);

%Switch rows and columns
images = permute(images, [2 1 3]);

%Scale to 0-1 from 0-255;
images = double(images)/255;

%Outputs
numImg = size(images, 3); %Number of images
width = size(images, 2); %Columns
height = size(images, 1); %Rows

