function A = processSingle(image)
%function A = processSingle(img)
%This function processes a single image, using the same methods as those in
%the dataset processing
%This function is built as a subfunction, not prudent to use on its own
%Inputs:
%   -image: A single input image
%Output:
%   -A: The processed image
cd ../dataPrep

%Convert to gray scale, scale to 0-1, get row and col size
image = rgb2gray(image);
image = double(image)/255;
rows = size(image,1);
cols = size(image,2);

% "Reverse" image(Turn black to white and white to black)
%This is done because mnist images are formatted like this, so for correct
%classification input images must also be like this
for r = 1:rows
    for c = 1:cols        
        if image(r,c) == 0
            image(r,c) = 1;      
        elseif image(r,c) == 1
            image(r,c) = 0;
        end
    end
end

%Resize
image = imresize(image, [28 28]);
%Binarize image with 0.1 threshold
image = binarize(image, 0.1);
%Get outline of number
image = outline(image);
%Resize and rebinarize
image = imresize(image, [28 28]);
image = binarize(image, 0.1);

A = image;