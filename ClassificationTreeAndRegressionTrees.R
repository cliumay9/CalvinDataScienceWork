# DecisionTrees.R
# USE ctree from party

# ==========================================================
# Install
# 1) Predict species with classifying data=iris
# 2) Predict qsec by considering other features of the car data= mtcars
# ==========================================================

install.packages("party")  # Install party
library(datasets)          # Load built-in datasets 
library(party)             # Load party

# ==========================================================
# Decision Tree - Classification tree
# Use "iris" from built-in datasets
# Create a tree to predict species, iris%Species by measurements with ctree) and predict()
# ==========================================================

head(iris)  # Show first six cases
iris.ct <- ctree(Species ~ ., data = iris)  # Create tree
iris.ct                                     # Tree info
plot(iris.ct)                               # Tree plot
table(predict(iris.ct), iris$Species)       # Pred vs true

# ==========================================================
# Regression tree
# Use "mtcars" from built-in datasets
# Create a tree to predict qsec, quarter-mile time
# ==========================================================

head(mtcars)

# Create a tree to predict qsec, quarter-mile time

# First regression tree
car.rt1 <- ctree(qsec ~ ., data = mtcars)  # All variables
car.rt1                                    # Tree info
plot(car.rt1)                              # Plot tree
# Not a very helpful way to classify, because of the first level branches <=0 and >0

# Second regression tree (with selected variables i.e. hp - horse power)
car.rt2 <- ctree(qsec ~ cyl +  disp +  hp + wt + am + gear
                 , data = mtcars)
#Predict qsec with inputs - cyl, disp, hp, wt, am, gear
car.rt2        # Tree info
plot(car.rt2)  # Plot tree

table(predict(car.rt2), mtcars$qsec)  


