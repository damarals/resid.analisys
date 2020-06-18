########################################################
#  My Implementation of Paper Code 
#  ~ Residual analysis of linear mixed models 
#    using a simulation approach
########################################################

## libraries
require(Rfast)

## hyperparameters
n <- 30 # 50 rows in dataset
N <- 1000 # 1000 iterations of simulation
alpha <- 0.05 # significance level

## matrix's used

# S is a [N x n] matrix which contains in the rows the 
# order statistics of studentized cond. residuals (CR)
S <- matrix(runif(N*n, 1, 10), nrow = N) # pop. random
S <- t(apply(S, 1, sort)) # order statitics

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
c <- N - c + 1

## main loop
k <- 1
repeat {
  # 1.
  theta_k <- which(c == min(c))
  # 2.
  S <- S[-theta_k,]
  c <- c[-theta_k]
  
  theta_k_new <- which(c == min(c))
  if(nrow(S) - length(theta_k_new) < (1-alpha)*N) {
    break
  }
  k <- k + 1
}
# 3.
D_theta <- D[theta_k,]
C_theta <- C[theta_k,]




