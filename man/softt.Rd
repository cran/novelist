\name{softt}
\alias{softt}
\title{
Soft thresholding estimators of a covariance/correlation matrix
}
\description{
Obtain a series of soft thresholding estimators of a covariance/correlation matrix by applying a series of thresholdings.
}
\usage{
softt(m, th, Cor = TRUE)
}
\arguments{
    \item{m}{a \eqn{p} by\eqn{ p} sample covaraince matrix. }
  \item{th}{a series of thresholding levels, for example \code{th=seq(0,1,by=0.05)}.}
  \item{Cor}{apply soft thresholding on sample covariance matrix if \code{Cor=FALSE}; apply soft thresholding on sample correlation matrix if \code{Cor=TRUE}.}
}

\value{
  An array of covariance matrix estimators after regularized by a series of thresholding levels.
}


\examples{
# arbitrary positive definite covariance matrix

cov.nonsparse<- function(p, rgen = rnorm, rgen.diag = rchisq, df = 5)  
  
{
  
  m <- matrix(rgen(p*p), p, p)
  
  m[upper.tri(m)] <- 0
  
  tmp <- m \%*\% t(m)
  
  tmp.svd <- svd(tmp)
  
  tmp.svd$d <- rgen.diag(p, df)
  
  tmp.svd$u \%*\% diag(tmp.svd$d) \%*\% t(tmp.svd$u)
  
}

# simulate  n by p data matrix by a given covariance matrix

sim.data <- function(sc, n, rgen = rnorm)  

{
 
  l <- t(chol(sc))
  
  p <- dim(sc)[1]
  
  z <- matrix(rgen(p * n), p, n)
  
  t(l \%*\% z)
  
}

p=100

n=100

cov<-cov.nonsparse(p)

data<-sim.data(cov,n)

# an array of soft thresholding estimators for the covariance matrix
# apply thresholdings from 0 to 1 to the sample correlation matrix

s.cov<-softt(cov(t(data)),seq(0,1,by=0.05))   

s.cov[,,5]    # the soft thresholding estimator when the thresholding level is 0.2

}

\seealso{
\code{\link{hardt}}
}


