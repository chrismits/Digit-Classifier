function [trainingImages, testingImages]=fixData(trainingImg, testingImg)
%This function readies the data for use
%This function is built as a subfunction of another function. Don't use on
%its own
%Input:
%   -trainingImg: Training images
%   -testingImg: Testing images
%Output
%   -trainingImages: Readied training data
%   -testingImages: Readied testing data

trainingImages = process(trainingImg);
testingImages = process(testingImg);
