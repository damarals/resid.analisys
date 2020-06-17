########################################################
#  My Implementation of Paper Code 
#  ~ Residual analysis of linear mixed models 
#    using a simulation approach
########################################################

## libraries
require(Rfast)

## hyperparameters
N <- 100 # 100 rows in dataset
n <- 100 # 100 iterations of simulation
alpha <- 0.05

## matrix's used

# S is a [N x n] matrix which contains in the rows the 
# order statistics of studentized cond. residuals (CR)
S <- matrix(runif(N*n, 1, 10), nrow = N) # pop. random

# D is a [N x n] matrix which contains the absolute 
# standardized values of matrix S
D <- abs(scale(S))

# Matrix C contains rank-values computed within each 
# column of matrix S.
C <- colRanks(S)

## vectors used

# c is a [N x 1] vector which contains the most extreme 
# rank  value of the rows of C.
c <- apply(C, 1, max)

## main loop
k <- 1
repeat {
  theta_k <- which(c == min(c))
  S <- S[-theta_k,]
  c <- c[-theta_k]
  
  theta_k_new <- which(c == min(c))
  if(nrow(S) - length(theta_k_new) < (1-alpha)*N) {
    break
  }
  k <- k + 1
}
D_theta <- D[-theta_k,]
C_theta <- C[-theta_k,]




