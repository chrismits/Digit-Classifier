function knnStats(results, mislabeled, error, time)
%function knnStats(results, mislabeled, error, time)
%This function analyzes the results of algorithm and prints statistics to
%file
%This function is built as a subfunction and cannot be used on its own
%Inputs:
%   -results: Vector of classification results
%   -mislabeled: Vector of misclassified results
%   -error: Number of errors
%   -time: Run time of classifier
%Output:
%   -No output
cd ../
load('mnistdata.mat')

%Compute accuracy
total = length(results);
accuracy = ( (total - error) / total ) * 100;

fid = fopen('stats.txt', 'wt');
%Basic Accuracy Stats
er = sprintf('Classifier mislabeled %i out of %i images \n\n', error, total); 
fwrite(fid,er)
acc = sprintf('Total accuracy = %0.1f percent \n\n', accuracy);
fwrite(fid, acc);

%RunTime
if time > 60
    time = time/60;
    t = sprintf('Run time = %0.3f minutes \n\n', time);
else
    t = sprintf('Run time = %0.3f seconds \n\n', time);
end
fwrite(fid, t);

%Most misclassified digit
misClass = [];
for i = 1:length(mislabeled)
    misClass = [misClass testing.labels(mislabeled(i))];
end
mod = sprintf('Most misclassified digit: %i \n\n',mode(misClass));
fwrite(fid, mod)
cd ./knn





