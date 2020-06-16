########################################################
#  My Implementation of Paper Code 
#  ~ Residual analysis of linear mixed models 
#    using a simulation approach
########################################################

## hyperparameters
N = 100 # 100 rows in dataset
n = 100 # 100 iterations of simulation

## matrix's used

# S is a [N x n] matrix which contains in the rows the 
# order statistics of studentized cond. residuals (CR)
S = matrix(runif(N*n), dim = c(N, n)) # pop. random

# D is a [N x n] matrix which contains the absolute 
# standardized values of matrix S
D = abs(scale(S))

# Matrix C contains rank-values computed within each 
# column of matrix S.
C = rank(S)

## vectors used

# c is a [N x 1] vector which contains the most extreme 
# rank value of the rows of C.
c = tapply(C, 1, max)

## main loop
while(nrow(S) - lenght(theta) >= (1-alpha)*N) {
  
}