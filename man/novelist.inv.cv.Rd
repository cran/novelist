\name{novelist.inv.cv}
\alias{novelist.inv.cv}


\title{
Optimal NOVELIST estimator of the inverse of a covariance/correlation matrix
}
\description{
Optimal NOVELIST estimator of the inverse of a covariance/correlation matrix.
}
\usage{
novelist.inv.cv(x, data = TRUE, is.cov =TRUE, lambda = seq(0, 1, by = 0.05), delta = 
NULL, CV = TRUE, CV.inv.cov = TRUE, Th.method = softt, rep.cv = 50)
}



\arguments{
   \item{x}{a \eqn{n} by \eqn{p} data matrix or \eqn{p} by \eqn{p} sample correlation/covariance matrix, where \eqn{p} is dimension and \eqn{n} is sample size.}
  \item{data}{\code{x} is the data matrix if \code{data=TRUE}; \code{x} is the sample covariance/correlation matrix if \code{data=FALSE}.
  }
  \item{is.cov}{only valid when \code{data=FALSE}. \code{x} is the sample covariance matrix if \code{is.cov=TRUE}; \code{x} is the sample correlation matrix if \code{is.cov=FALSE}.
}
  \item{lambda}{a series of thresholding levels, for example \code{lambda=seq(0,1,by=0.05)}.
}
  \item{delta}{a series of shrinkage intensities, for example \code{delta=seq(-0.5,1.5,by=0.05)}.
}
  \item{CV}{empirical optimal parameters (\eqn{\lambda*},\eqn{\delta*}) are chosen from an semi-analytical method if \code{CV=TRUE}, where only \code{lambda} should be given; assigned parameters are used if \code{CV=FALSE}, where both \code{lambda} and \code{delta} should be given.} 
  \item{CV.inv.cov}{only valid when \code{CV=TRUE}. Minimizing the spectral norm error of the inverse of the covariance matrix estimator if \code{CV.inv.cov=TRUE}; minimizing the spectral norm error of the inverse of the correlation matrix estimator if \code{CV.inv.cov=FALSE}.}
  \item{Th.method}{thresholding method. Soft thresholding is used if \code{Th.method=softt}, hard thresholding is used if \code{Th.method=hardt} or any other generalized thresholding method chosen by users.}
  \item{rep.cv}{repetition times for cross validation.}
}
\details{
First, NOVELIST performs shrinkage of the sample correlation matrix towards a thresholding target, yielding the NOVELIST correlation matrix estimator, which has 2 parameters. The NOVELIST correlation estimator can be obtained by either assigned parameters or empirical optimal parameters which are automatically chosen from a semi-analytical method. The method combines Ledoit-Wolf's lemma (Ledoit and Wolf, 2003) and cross validation. First, for each thresholding level \eqn{\lambda}, it applies Ledoit-Wolf's method to choose the optimal empirical shrinkage intensity \eqn{\delta*(\lambda)}, and then pick out the best pair of \eqn{(\lambda, \delta*(\lambda))} which reaches the minimal spectral norm error by cross validation, and denote it as \eqn{(\lambda*, \delta*)}, then the final NOVELIST correlation estimator is calculated using \eqn{(\lambda*, \delta*)}. This process significantly accelerates the computing speed. Second, the method obtains the corresponding NOVELIST covariance matrix estimator by applying the sample variances to the NOVELIST correlation matrix estimator. The details are explained in Huang and Fryzlewicz (2015).}

\value{
\item{inv.cov.novel}{NOVELIST estimator of the inverse of the covariance matrix.}
\item{inv.cor.novel}{NOVELIST estimator of the inverse of the correlation matrix.}
\item{lambda.star}{empirical choice of thresholding.}
\item{delta.star}{empirical choice of shrinkage intensity.}

If \code{data=TRUE}, both \code{inv.cov.novel} and \code{inv.cor.novel} are computed.

If \code{data=FALSE} and \code{is.cov=TRUE}, both \code{inv.cov.novel} and \code{inv.cor.novel} are computed. 

If \code{data=FALSE} and \code{is.cov=FALSE}, only \code{inv.cor.novel} is computed. 

\code{lambda.star} and \code{delta.star} are only computed when \code{CV=TRUE}.


}

\references{Huang, N. & Fryzlewicz, P. (2015), "NOVELIST estimator of large correlation and covariance matrices and their inverses". Preprint.. 

Ledoit, O., &  Wolf, M.(2003), "Improved estimation of the covariance matrix of stock returns with an application to portfolio selection." \code{Journal of Empirical Finance} 10, 603-621.
}

\seealso{
\code{\link{novelist.cov.cv}}
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

# simulate  n x p data matrix by a given covariance matrix

sim.data <- function(sc, n, rgen = rnorm)  

{
 
  l <- t(chol(sc))
  
  p <- dim(sc)[1]
  
  z <- matrix(rgen(p * n), p, n)

  t(l \%*\% z)
  
}

p=30

n=30 

cov<-cov.nonsparse(p)

x<-sim.data(cov,n)

# input n x p data matrix and assign parameters

novelist.inv.cv(x,lambda=c(0,0.5),delta=c(0,0.5,1),CV=FALSE) 

# input n x p data matrix and find optimal parameters for covariance estimator 
# achieves the least error to the true covariance matirx via cross validation

novelist.inv.cv(x, lambda=seq(0,1,by=0.1)) 

# input n x p data matrix and find optimal parameters for correlation estimator 
# achieves the least error to the true correlation matirx via cross validation

novelist.inv.cv(x, lambda=seq(0,1,by=0.1), CV.inv.cov=FALSE)  

# input covariance matrix and assign parameters

novelist.inv.cv(cov(x),data=FALSE,lambda=c(0,0.5),delta=c(0,0.5,1),CV=FALSE) 

# input correlation matrix and assign parameters

novelist.inv.cv(cor(x),data=FALSE,is.cov=FALSE,lambda=c(0,0.5),delta=c(0,0.5,1),CV=FALSE) 
}
