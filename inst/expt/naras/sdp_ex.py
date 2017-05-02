import numpy as np
from functools import reduce
import operator, sys

def solve_sdp(Sigma):
    """
    Solves the SDP used to create Gaussian Knockoffs
    :param Sigma : A correlation matrix (p x p) (positive-definite matrix with 1's on the diagonal)
    :return: A vector of length p

        maximize     sum(s)
          s.t.       2 Sigma - diag(s) >> 0
                     0 <= s <= 1
    """
    import cvxpy as cvx
    p,_ = Sigma.shape
    s = cvx.Variable(p)
    objective = cvx.Maximize(sum(s))
    constraints = [ 2*Sigma >> cvx.diag(s), 0<=s, s<=1]
    prob = cvx.Problem(objective, constraints)
    prob.solve(solver='CVXOPT')
    assert prob.status == cvx.OPTIMAL

    return np.asarray(s.value).flatten()


# Create the covariance matrix of an inhomogeneous AR(1) process of length p
#print("Creating the random problem...", end=" ")
sys.stdout.flush()
np.random.seed(1223)
p = 3
rho = np.random.uniform(low=0.0, high=1.0, size=p)
SigmaT = np.zeros(shape=(p,p))
for i in range(p):
    for j in range(i,p):
        SigmaT[i][j] = reduce(operator.mul, [rho[l] for l in range(i,j)], 1)
Sigma = np.triu(SigmaT)+np.triu(SigmaT).T-np.diag(np.diag(SigmaT))
print("done.")

# Solve the SDP problem
#print("Solving the SDP...", end=" ")
sys.stdout.flush()
s = solve_sdp(Sigma)
print("done.")

# Print the solution
print("Printing the solution:")
print(s)
