from cvxpy import *
import numpy as np

n = 2
m = 1
A = np.loadtxt('a.txt')
b = np.loadtxt('b.txt')

x = Variable(m)
objective = Minimize(sum((A * x - b)**2))
prob = Problem(objective)
prob.solve(verbose = True)
