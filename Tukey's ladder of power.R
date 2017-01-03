# Charts for DSFO_05_02 "Exploratory Statistics"

# Tukey's ladder of powers
x <- rnorm(1000, 50, 10)
x3 <- x^3
x2 <- x^2
x1 <- x
x.5 <- sqrt(x)
x0 <- log(x)
xneg.5 <- -1/sqrt(x)
xneg1 <- -1/x
xneg2 <- -1/x^2

par(mfrow = c(1, 9), bty = 'n', yaxt="n")
boxplot(xneg2)
boxplot(xneg1)
boxplot(xneg.5)
boxplot(x0)
boxplot(x.5)
boxplot(x1)
boxplot(x2)
boxplot(x3)
par(mar=c(1,1,1,1))

