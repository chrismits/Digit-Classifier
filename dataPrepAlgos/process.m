function A = process(images)
%function A = process(images)
%This function processes the data and extracts features in order to
%reduce runtime. This function is built as a subfunction of another
%function. Don't use on its own.
%Inputs:
%   -images: Image data
%Outputs:
%   -A: Processed image data

%Christos-Nikolaos Mitsopoulos
%ES-2 Final Project

sz = size(images,3);

for i = 1:sz
    %Pull image
    img = images(:,:,i);
    %Binarize image with 0.1 threshold
    img = binarize(img, 0.1);
    %Get outline of number
    img = outline(img);
    %Resize and rebinarize
    img = imresize(img, [28 28]);
    img = binarize(img, 0.1);
    
    images(:,:,i) = img;    
end

A = images;

