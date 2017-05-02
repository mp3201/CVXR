from cvxpy import *
import numpy as np
import pdb

x = Variable(2,2)
objective = sum(pnorm(x, 2, axis = 0))
problem = Problem(Minimize(objective))
problem.solve(verbose = True)


