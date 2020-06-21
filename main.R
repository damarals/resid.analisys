########################################################
#  My Implementation of Paper Code 
#  ~ Residual analysis of linear mixed models 
#    using a simulation approach
########################################################

## y simulate
G <- chol(V)


## main function
simulateResid <- function(S) {
  k <- 1 # first iteration
  alpha <- 0.05 # Significance level
  
  n <- ncol(S) # Size of sample
  N <- nrow(S) # Number of simulations
  
  # Row order statitics of matrix S 
  S <- t(apply(S, 1, sort))
  
  # D is a [N x n] matrix which contains the absolute 
  # standardized values of matrix S
  D <- abs(scale(S))
  
  # Matrix C contains rank-values computed within each 
  # column of matrix S.
  C <- apply(S, 2, rank)
  
  # c is a [N x 1] vector which contains the most extreme 
  # rank  value of the rows of C. 
  c <- apply(C, 1, max)
  c <- N - c + 1 # Transformation

  while(nrow(S) - length(which(c == min(c))) >= (1-alpha)*N) {
    theta_k <- which(c == min(c))

    N_old <- nrow(S)
    
    S <- S[-theta_k,]
    c <- c[-theta_k]

    if(N_old - length(theta_k) == (1-alpha)*N) {
      return(S)
    } else {
      k <- k + 1 
    }
  }

  theta_k <- which(c == min(c))
  
  D_theta <- D[theta_k,]
  C_theta <- C[theta_k,]

  c_theta <- apply(C_theta, 1, min)
  c_theta_rank <- rank(c_theta)
  
  d_theta <- apply(D_theta, 1, max)
  d_theta_rank <- rank(d_theta)
  
  theta_k_order <- theta_k[order(c_theta_rank, d_theta_rank, decreasing=F)]
  S <- S[-theta_k_order[1:(nrow(S) - (1-alpha)*N)], ]
  
  return(S)
}
S <- matrix(runif(N*n, 1, 10), nrow = N) # pop. random
simulateResid(S)

