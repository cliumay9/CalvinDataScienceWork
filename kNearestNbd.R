# IDS_09_03_kNN.R

# ==========================================================
# Install and load packages as needed
# Load class - classificaiton data with Knn function
# ==========================================================

install.packages("class")  # Install class (if needed)
library(class)             # Load class (has knn function)
library(datasets)          # Load built-in datasets 

# ==========================================================
# Prepare data
# ==========================================================

# Use "iris" from built-in datasets

head(iris)  # Show first six cases

# Variables' ranges are high then it's a
# so better to normalize the variables
# such that they will be put in similar ranges. 
# This step isn't necessary for this data set.

# Split data into training set (2/3) and testing set (1/3)
set.seed(16203)  # Random seed
iris.split <- sample(2, nrow(iris), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))

# Create training and testing datasets without species
# labels. Use just the first four variables.
iris.train <- iris[iris.split == 1, 1:4]
iris.test  <- iris[iris.split == 2, 1:4]

# Create species labels
iris.train.labels <- iris[iris.split == 1, 5]
iris.test.labels  <- iris[iris.split == 2, 5]

# ==========================================================
# Build and test classifier
# ==========================================================

# Build classifier for test data.
# k = number of neighbors to compare; odd n avoids ties.
# Try with several values of k and check accuracy on
# following table.
#cl = iris.train.labels 'true' class for our model
# k neighbors - with odd number of neighbors to avoid tie
iris.pred <- knn(train = iris.train,
                 test = iris.test, 
                 cl = iris.train.labels,  
                 k = 5)                  

# Compare predicted species to observed species
table(iris.pred, iris.test.labels)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
# rm(list = ls()) 

# Unload packages
# detach("package:class", unload = TRUE)
# detach("package:datasets", unload = TRUE)

# Clear console
# cat("\014")  # ctrl+L
