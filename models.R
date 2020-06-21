require(nlme)
require(mgcv)

data("Orthodont")

mod_orthodont <- lme(fixed = distance ~ Sex * I(age - 11), 
                     random = ~ I(age - 11) | Subject,
                     data = Orthodont)
# V
V <- extract.lme.cov(mod_orthodont)

# G (Cholesky decomposition of V)
G <- t(chol(V))

# y sim
ysim <- G %*% rnorm(nrow(G))
