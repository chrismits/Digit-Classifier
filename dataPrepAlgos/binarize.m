function B = binarize(image, threshold)
%function B = binarize(image, threshold)
%This function binarizes an image through thresholding
%This function is built as a subfunction of another function. Don't use on
%its own.
%Inputs:
%   -image: An image
%   -threshold: The threshold for binarization
%Output:
%   -B = binarized image

rows = size(image,1);
cols = size(image,2);

%Going through all pixels
for r = 1:rows
    for c = 1:cols        
        if image(r,c) > threshold
            image(r,c) = 1;      
        else
            image(r,c) = 0;
        end
    end
end

B = image;
