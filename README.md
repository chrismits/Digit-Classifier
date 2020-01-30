## Overview
This project contains scripts that classify handwritten digits by implementing the k-nearest neighbours algorithm as well as some basic image processing.

### Demo

Demo:
<a href="http://www.youtube.com/watch?feature=player_embedded&v=0cHgmif84_Y
" target="_blank"><img src="http://img.youtube.com/vi/0cHgmif84_Y/0.jpg" 
alt="Video Sample run" width="240" height="180" border="10" /></a>

### Disclaimer
I strongly recommend using the GUI form of this project (details on how to run it below). Also, different computers display the GUI window with different sizes. For best performance and easy image selection, make the window pretty large (about the size of that in the sample video).

### Useful Definitions

- Training Set: The images used to train the classifier model.
- Testing Set: The images used to verify and evaluate the classifier model.
- k:  The number of closest training examples to the testing image at the moment. The algorithm then chooses the most seen digit in this selection of training images. Choosing an appropriate value for k is important, one that minimizes the Mean Squared Error. Once you get to the graphical sections of this program you will be able to visualize and understand the effect of k on classifier accuracy.

## How to run
1. First of all, clone the contents of this repository to your local machine and go to the Final Project directory.
2. Run the saveDataset.m function, either by clicking on it in the file-viewer on the left or by typing saveDataset() in the command line, and wait for the dataset to load.
3. Open startGUIProcess.m and run the script.

## Understanding the different features

At the first window that pops up, choose which feture to run. Here is a description of the two features available to you:

### Feature 1: Single image classifier: 
Select a portion of an image with numbers and the algorithm classifies it for you

1. Press SELECT and box the number you want on the image. Then right-click and press crop image
2. Press VIEW CROPPED IMAGE. This button isolates your selection from the rest of the numbers
3. Press CLASSIFY. Hopefully, the correct result has now been printed at the result section.
4. To try again, press RESET and go back to step 1
5. To close this version, press CLOSE

### Feature 2: Dataset Classifier
This version classifies images from the MNIST database and evaluates the classifier results. 

#### For Basic testing of classifier
1. Input number of images to test. These are the images that the algorithm tries to classify
2. Input number of images to train with. These are the images that the algorithm uses to compare testing images. Usually, the more images to train with, the better the accuracy of the classifier but for run-time???s sake, values in the ballpark of the default ones are good enough.
3. Select the value of k
4. Press RUN BASIC TESTING and observe the results. You can also open the ???stats.txt??? file from the main project directory to observe results.

#### For understanding the effect of k on the error.
Step 1. Input number of images to test (first field)
Step 2. Input number of images to train with (Second field)
Step 3. Press EFFECT OF K and observe graph
Step 4. When done, press CLOSE

## How it works: main Scripts

- saveDataset.m: Found in main directory, this function basically pulls all the data reading functions and saves the two structures on the workspace as mnistdata.mat.
- startGUIProcess.m: This function launches the GUI. From then on, the user does not have to directly interact with functions and scripts if he wants.

### I/O
- loadImg.m: Imports the images from the raw MNIST files ???test-images??? and ???train-images???
- loadlbl.m: Imports the labels from the raw MNIST files ???test-labels??? and ???train-labels???
- readData.m: Calls the previous two functions and stores them in a structure containing he number of images, the width, the height of each images, the array of all images and the vector of labels.
- fixData.m: Calls the processing function for training and testing images
- process.m: Processes the data and extracts features in order to reduce runtime.
- binarize.m: Binarizes an image through thresholding
- outline.m: Extracts the outline of the number in the image

### Classification

- knnAll.m: This function classifies test data against training data taken from the two structures, training and testing. The user chooses how many of each to use. If he does not choose, default values are used. The results are saved in the output file called stats.txt.
- knnGraph.m: This function classifies testing images, after being trained by training images, for various values of k. The accuracy with respect to value of k is then plotted in a graph. Use small values or else run time will be really long.
- knnSingle.m: This function classifies a single image using data from the training set.
- processSingle.m: Processes the single image for knnSingle.
- knnStats.m: Prints stats to file (implicitly called by knnAll.m)

Have fun and if you are unsure about how to run something, email me at mitsopouloschris@gmail.com



