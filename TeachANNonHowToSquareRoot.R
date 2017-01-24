# Construct Artificial Neural Network with neuralnet
# Build an ANN with neuralnet
# Objective: Teaching our ANN to learn square rooting!
# i.e. give ANN a set of training data and see whether
# ANN can find a pattern

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages('neuralnet')  
library(neuralnet)            

# ==========================================================
# Prepare data
# Obtain 30 random integers between 1 and 50
# Set seed so that we can be consistent
# for random case I cn always comment it out
# train.x and train.y are training data where they are the #random integers we chose and their square root
# respectively
# Then form a data frame, which is easier to see and process, with train.x and train.y 
# ==========================================================


set.seed(1202)                            
train.x <- sample(1:100, 50, replace = T)  
head(train.x)                              
train.y <- sqrt(train.x)                   
head(train.y)                             

# Join the columns and coerce to dataframe
train.xy <- as.data.frame(cbind(train.x, train.y))
head(train.xy)

# ==========================================================
# Training our neural network
# Using 10 hidden layers
# Threshold is the partial derivative of the error function,
# which serves as stopping criteria e.g. 0.01 in this case to tell NN to stop
# Then, plot our neural network
# ==========================================================

net.sqrt <- neuralnet(train.y ~ train.x, 
                      train.xy,
                      hidden = 10, 
                      threshold = 0.01)

plot(net.sqrt)

# ==========================================================
# Test our neural network with new data(testing data)
# aka Squared numbers
# Create table with input integer, expected results(squared number), and results obtained from ANN with net.table
# ==========================================================

test.x <- as.data.frame((1:10)^2)    
test.y <- compute(net.sqrt, test.x) 
test.trainx <- compute(net.sqrt, train.x)
test.y                              
net.table1<- cbind(train.x, 
                   train.y, 
                   round(test.trainx$net.result,3))
# To see how accurate the model is with classifying its trained data
net.table <- cbind(test.x,
                   sqrt(test.x),
                   round(test.y$net.result, 3))
colnames(net.table) <- c("X","Y-Exp","Y-ANN") 
#Rename the column name
net.table  # Display table

# ==========================================================
# Clean up
# Clear workspace, unload packages, clear plots, clear console
# ==========================================================

# rm(list = ls()) 
# detach("package:neuralnet", unload = TRUE)
# dev.off()
# cat("\014")  
