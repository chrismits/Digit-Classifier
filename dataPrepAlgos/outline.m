function A = outline(inputImg)
%function A = outline(inputImg)
%This function extracts the outline of the number
%This function is built as a subfunction of another function. Don't use on
%its own.
%Inputs:
%   -inputImg: An input image
%Output:
%   -A:Outline of the image 

%Get dimension
rows = size(inputImg, 1);
cols = size(inputImg, 2);

newrow = [];
newcol = [];

%Loop through pixels, get only ones
for r = 1:rows
    for c = 1:cols      
        if inputImg(r,c) == 1
            newrow = [newrow r];
            newcol = [newcol c];            
        end      
    end    
end

%Find max and mins
xmin = min(newrow);
xmax = max(newrow);
ymin = min(newcol);
ymax = max(newcol);

%Get outline
A = inputImg(xmin:xmax, ymin:ymax);
