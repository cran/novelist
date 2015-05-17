\name{novelist-package}
\alias{novelist-package}
\alias{novelist}
\docType{package}
\title{
NOVEL Integration of the Sample and Thresholded (NOVELIST) Correlation and Covariance Estimators}
\description{
Implements NOVELIST estimator,which is a nonlinear shrinkage estimator of the correlation and covariance matrices and their inverses. It performs shrinkage of the sample correlation matrix towards a thresholding target, yielding the NOVELIST correlation matrix estimator, and then obtain the corresponding NOVELIST covariance matrix estimator by applying the sample variances to the NOVELIST correlation matrix estimator. It also provide NOVELIST estimators of the correlation matrices and the inverse of the covariance/correlation matrices. 
}
\details{
\tabular{ll}{
Package: \tab novelist\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-05-12\cr
License: \tab GPL (>= 3)\cr
}
The main routines of the package are \code{\link{novelist.cov.cv}} and \code{\link{novelist.inv.cv}}.
}
\author{
Na Huang and Piotr Fryzlewicz

Maintainer: Na Huang <n.huang1@lse.ac.uk>
}
\references{Huang, N. & Fryzlewicz, P. (2015), "NOVELIST estimator of large correlation and covariance matrices and their inverses". Preprint.
}


\keyword{ covariance }
\keyword{ precision }

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

# simulate  n x p data matrix by a given covariance matrix

sim.data <- function(sc, n, rgen = rnorm)  

{
 
     l <- t(chol(sc))
  
     p <- dim(sc)[1]
  
     z <- matrix(rgen(p * n), p, n)

     t(l \%*\% z)
  
 }

p=50

n=50 

cov<-cov.nonsparse(p)

x<-sim.data(cov,n)

novelist.cov.cv(x, lambda=seq(0,1,by=0.1)) # NOVELIST estimator of the covariance matrix

novelist.inv.cv(x, lambda=seq(0,1,by=0.1)) # NOVELIST estimator of the precision matrix
}