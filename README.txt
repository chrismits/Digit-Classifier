Topic: Classifying handwritten digits
Author: Christos-Nikolaos Mitsopoulos
Date: 06/10/2017

*************** OVERVIEW ******************

The files in this directory, classify handwritten digits by implementing the k-nearest neighbours algorithm as well as some basic image processing.

********************************************


************* DISCLAIMER ***************

I strongly recommend using the GUI form of this project (details on how to run it below). If any problems with the GUI persist, please email me at mitsopouloschris@gmail.com as the GUI is a pivotal part of the project.

Also, different computers display the GUI window with different sizes. For best performance and easy image selection, make the window pretty large (about the size of that in the sample video).
**********************************************


************** USEFUL DEFINITIONS **********

1. Training Set: The images the classifier uses to compare the images it tries to classify with.

2. Testing Set: The images the classifier tries to classify.

3. k:  The number of closest training examples to the testing image at the moment. The algorithm then chooses the most seen digit in this selection of training images. 

**********************************************


************ WHERE TO START *****************

A good idea would be to watch the sample run video (link in powerpoint).
1. First of all make sure you are in the Final Project directory and not in any subdirectory.

2. Run the saveDataset.m function, either by clicking on it in the file-viewer on the left or by typing saveDataset() in the command line, and wait for the dataset to load.

3. Open startGUIProcess.m and run the script.

4. Follow the GUI.
5. Read more at GUI version section.

**********************************************


***************** GUI VERSION **************************************************

At the first window that pops up, choose which version to run.

VERSION 1 Single image classifier: 
Select a portion of an image with numbers and the algorithm classifies it for you

Step 1. Press SELECT and box the number you want on the image. Then right-click and press crop image
Step 2. Press VIEW CROPPED IMAGE. This button isolates your selection from the rest of the numbers
Step 3. Press CLASSIFY. Hopefully, the correct result has now been printed at the result section.
Step 4. To try again, press RESET and go back to step 1
Step 5. To close this version, press CLOSE

VERSION 2 Dataset Classifier
This version classifies images from the MNIST database. That is, tests against the training data using the images found in testing struct

Follow the onscreen information:

For Basic Testing
Step 1. Input number of images to test. These are the images that the algorithm tries to classify
Step 2. Input number of images to train with. These are the images that the algorithm uses to compare testing images. Usually, the more images to train with, the better the accuracy of the classifier but for run-time???s sake, values in the ballpark of the default ones are good enough.
Step 3. Select the value of k
Step 4. Press RUN BASIC TESTING and observe the results. You can also open the ???stats.txt??? file from the main project directory to observe results.

For Effect of k
Step 1. Input number of images to test (first field)
Step 2. Input number of images to train with (Second field)
Step 3. Press EFFECT OF K and observe graph
Step 4. When done, press CLOSE

**********************************************************************************


***************** NON-GUI VERSION (NOT RECOMENDED) ******************************

Step 1. Open the directory called knn.
Step 2. There you can run the functions knnAll.m, knnGraph.m and knnSingle.m

(Still do the Where to start steps to import data)

*********************************************************************************


***************** OUTPUT FILES **************

1. ???stats.txt???: Results from the BASIC TESTING in GUI or from function knnAll.m in NON-GUI

*********************************************


***************** MAIN FUNCTION/SCRIPTS *************************************

1. saveDataset.m: Found in main directory, this function basically pulls all the data reading functions and saves the two structures on the workspace as ???mnistdata.mat???.

2. startGUIProcess.m: This function launches the GUI. From then on, the user does not have to directly interact with functions and scripts if he wants.

*****************************************************************************


**************** DATA READING FUNCTIONS *****************************************

These functions are found in the folder dataPrep. They are not explicitly called by user so can be labeled as ???helper functions???.

1. loadImg.m: Imports the images from the raw MNIST files ???test-images??? and ???train-images???

2. loadlbl.m: Imports the labels from the raw MNIST files ???test-labels??? and ???train-labels???

3. readData.m: Calls the previous two functions and stores them in a structure containing he number of images, the width, the height of each images, the array of all images and the vector of labels.

4. fixData.m: Calls the processing function for training and testing images

5. process.m: Processes the data and extracts features in order to reduce runtime.

6. binarize.m: Binarizes an image through thresholding

7. outline.m: Extracts the outline of the number in the image

********************************************************************************


******************** K NEAREST NEIGHBORS FUNCTIONS ******************************

1. knnAll.m: This function classifies test data against training data taken from the two structures, training and testing. The user chooses how many of each to use. If he does not choose, default values are used. The results are saved in the output file called ???stats.txt???. This is one of the functions the user can directly call in the non GUI version.

A sample function call would be: accuracy = knnAll(training, testing, 3)
or accuracy = knnAll(training, testing, 3, 300, 5000)

2. knnGraph.m: This function classifies testing images, after being trained by training images, for various values of k. The accuracy with respect to value of k is then plotted in a graph. Use small values or else run time will be really long.

A sample function call would be knnGraph(training, testing, 50, 3000)

3. knnSingle.m: This function classifies a single image using data from the training set. In a non-GUI format, the last function parameter will always be true the input image of the function is selected using the following command:
-testing.images(:,:,x) where x is which image from the dataset to use (1-length(dataset))

In order to check if the result of the classifier is correct, write the following in the command line:
-testing.labels(x) where x is the same x you used before.
So, a sample function call would be: 
-result = knnSingle(training, testing.images(:,:,4), 3, true)

4. processSingle.m: Processes the single image for knnSingle.

5. knnStats.m: Prints stats to file (implicitly called by knnAll.m)

*********************************************************************************


******************** Some sample function calls to do in NON GUI ****************
In knn directory

-knnAll(training, testing, 3)
-knnAll(training, testing, 5, 200, 5000)
See above results on stats.txt file

-knnGraph(training, testing, 20, 500)
-knnGraph(training, testing, 30, 650)

-knnSingle(training, testing.images(:,:,6), 5, true)
Check result using testing.labels(6)
-knnSingle(training, testing.images(:,:,128), 7, true)
Check result using testing.labels(128)

********************************************************************************


Have fun and if you are unsure about how to run something, email me at mitsopouloschris@gmail.com



