### simulate data

library(MASS)
set.seed(6886)
data = mvrnorm(
    n=100, mu=c(-2, 3), 
    Sigma=matrix(c(8,3,3,2),nrow=2,ncol=2) 
)
colnames(data) = c('y','x')


### create function

my_lm <- function(q, p){


# load data

x = as.matrix(cbind(1,p))
y = as.matrix(q)


# calculate b

beta = solve( t(x) %*% x) %*%t (x) %*% y

# calculate vcv and de

yhat <- x %*% beta

ssr <- sum((yhat - y)^2)  # sum of squared residuals

N <- nrow(y)
k <- ncol(x)

sigma <- (ssr/(N-k))

vcv <- (sigma)*(solve( t(x) %*% x ))

se <- sqrt(diag(vcv))

se

# output results

model_summary <- matrix(c(beta, se), nrow=2, ncol=2, 
                        dimnames=list( c("b0", "b1"),
                            c("Coef", "S.E."))
                        )

return(model_summary)

}

my_lm(data[,"y"], data[,"x"])
