function knnGraph(training, testing, Ntest, Ntrain)
%function knnGraph(Ntest, Ntrain)
%Effect of k on accuracy
%Inputs:
%   -training: Training struct
%   -testing: Testing struct
%   -Ntest: Number of testing images
%   -Ntrain: Number of training images

kVec = 1:2:Ntest;
accuracy = [];
for k = kVec
    acc = knnAll(training, testing, k, Ntest, Ntrain);
    accuracy = [accuracy acc];
end

plot(kVec, accuracy)
xlabel('Value of k')
ylabel('Accuracy')
ylim([0 1])
title('Effect of k on classifier accuracy');

