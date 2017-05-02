library(cvxr)

library(MASS)
set.seed(1234)
n <- 2
m <- 1
A <- matrix(rnorm(n*m), nrow = n, ncol = m)
b <- matrix(rnorm(n), nrow = n)

x <- Variable(rows = m)
obj1 <- Minimize(SumSquares(A %*% x - b))
res <- solve(Problem(obj1))

obj2 <- Minimize(sum((A %*% x - b)^2))

cat("A matrix")
print(A)

cat("b matrix")
print(b)


## debug(solve)
## debug(build_lin_op_tree)
##base::trace("solve.Problem", tracer=browser, exit = browser)

##
## Write out output file to file so that you can
## compare against cvxpy
## speed_test.py reads these two output files for A and b.
##
##write.matrix(format(A, digits = 14, scientific = TRUE), file = "a.txt")
##write.matrix(format(b, digits = 14, scientific = TRUE), file = "b.txt")

##gctorture(TRUE)
solve(Problem(obj2))

