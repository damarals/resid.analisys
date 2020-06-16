########################################################
#  My Implementation of Paper Code 
#  ~ Residual analysis of linear mixed models 
#    using a simulation approach
########################################################

## hyperparameters
N = 4 # 100 rows in dataset
n = 4 # 100 iterations of simulation

## matrix's used

# S is a [N x n] matrix which contains in the rows the 
# order statistics of studentized cond. residuals (CR)
S = matrix(runif(N*n, 1, 10), nrow = N) # pop. random

# D is a [N x n] matrix which contains the absolute 
# standardized values of matrix S
D = abs(scale(S))

# Matrix C contains rank-values computed within each 
# column of matrix S.
C = colRanks(S)

## vectors used

# c is a [N x 1] vector which contains the most extreme 
# rank value of the rows of C.
c = apply(C, 1, max)

## main loop
while(nrow(S) - lenght(theta) >= (1-alpha)*N) {
  
}