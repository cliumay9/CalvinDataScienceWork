# NaiveBayes Alogirhtm with e1071data


# ==========================================================
# Install and load packages as needed
# Install and load e1071, mlbench (machine learning benchmark) - Bayesian Approach
# ==========================================================

install.packages("e1071")    
install.packages("mlbench")  
library(e1071)               
library(mlbench)             

# ==========================================================
# Prepare data: HouseVotes84
# Using "HouseVotes84" from mlbench package
# ==========================================================

data(HouseVotes84, package = "mlbench")
vote <- HouseVotes84

head(vote)

# Split data into training set (2/3) and testing set (1/3)
# set.seed()to have consistency
# Trying to categorize whether one person is democrat or republican
# Split data with 2 sets: a training set and a testing set (WITH vote.split)
set.seed(1984) 
vote.split <- sample(2, nrow(vote), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))
vote.train <- vote[vote.split == 1, ]
vote.test  <- vote[vote.split == 2, ]

# ==========================================================
# Build and test classifier
# nbc= naive Bayes Classifier
# ==========================================================

nbc <- naiveBayes(Class ~ ., data = vote.train) 
nbc  # Examine the classifier

# Check accuracy on our model with training data

table(predict(nbc, vote.train[, -1]), vote.train[, 1])
#Use round to round the % to 2 digits and prop.table to see the proportional
round(prop.table(table(predict(nbc, vote.train[, -1]), 
                 vote.train[, 1]), 
                 1),  
      2) * 100        

# Check accuracy on our model with test data
#Use round to round the % to 2 digits and prop.table to see the proportional
table(predict(nbc, vote.test[, -1]), vote.test[, 1])
round(prop.table(table(predict(nbc, vote.test[, -1]), 
                       vote.test[, 1]), 
                 1),  # Row percentages (2 = column)
      2) * 100        # Round to 2 digits, remove decimals

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
# rm(list = ls()) 

# Unload packages
# detach("package:e1071", unload = TRUE)
# detach("package:mlbench", unload = TRUE)

# Clear console
# cat("\014")  # ctrl+L
