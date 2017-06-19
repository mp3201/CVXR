library(cvxr)

# Problem data
n <- 10
m <- 5
A <- matrix(rnorm(n*m), nrow = n, ncol = m)
b <- matrix(rnorm(n), nrow = n, ncol = 1)

# Norm1 objective (working)
x <- Variable(rows = m)
obj1 <- Minimize(norm1(A %*% x - b))
sol1 <- solve(Problem(obj1))

# SumSquares objective (working with SOC)
obj2 <- Minimize(SumSquares(A %*% x - b))
sol2 <- solve(Problem(obj2))

# Sum and Square objective (requires SOCElemwise)
obj3 <- Minimize(sum((A %*% x - b)^2))
# debug(get_constraint_node)
sol3 <- solve(Problem(obj3))