# DecisionTreeClassficationTree.R

# ==========================================================
# Using ctree (conditional inference trees) from party
# Construct ctree with iris, the built in data set
# Classification tree
# ==========================================================

install.packages("party")  # Install party
library(datasets)          # Load built-in datasets 
library(party)             # Load party
head(iris)  # Show first six cases

# Create a tree to predict species by measurements

iris.ct <- ctree(Species ~ ., data = iris)  # Create tree
iris.ct                                     # Tree info
plot(iris.ct)                               # Tree plot
table(predict(iris.ct), iris$Species)       # Pred vs true
