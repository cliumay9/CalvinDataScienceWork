# Ensembling with Random Forest

# ==========================================================
# Install and load packages as needed
# ==========================================================

install.packages("randomForest")  # Install randomForest
library(datasets)                 # Load built-in datasets 
library(randomForest)             # Load randomForest


# ==========================================================
# Classification tree - Bagging with randomForest
# ==========================================================

# Use "iris" from built-in datasets

head(iris)  # Show first six cases

# Split data into training set (2/3) and testing set (1/3)
set.seed(16103)  # Random seed ; consistency of randomness
iris.split <- sample(2, nrow(iris), 
                     replace = TRUE,
                     prob = c(2/3, 1/3))
iris.train <- iris[iris.split == 1, ]
iris.test  <- iris[iris.split == 2, ]

# Constructing a random forest of decision trees
#Random seed to increase consistency
# Use all var, and use the training data defined above
# making a random forest with 500 trees, proximity = TRUE
set.seed(5972)                              
iris.rf <- randomForest(Species ~ .,        
                        data = iris.train,  
                        ntree = 500,        
                        proximity = TRUE) 

# Check model on training set
# Printing the random forest(classification table) and plotting it 
# Table the variable importance
# Plot variable with importance to see which one is an important indicator
print(iris.rf)       
plot(iris.rf)       
importance(iris.rf) 
varImpPlot(iris.rf)  

# Check whether our model constructed based on training data works by using our testing data
iris.pred <- predict(iris.rf, newdata = iris.test)
table(iris.pred, iris.test$Species)

# ==========================================================
# Clean up
# ==========================================================

# Clear workspace
#rm(list = ls()) 

# Unload packages
#detach("package:datasets", unload = TRUE)
#detach("package:randomForest", unload = TRUE)

# Clear plots
#dev.off()

# Clear console
#cat("\014")  # ctrl+L
