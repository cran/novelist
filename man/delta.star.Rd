\name{delta.star}
\alias{delta.star}

\title{ Compute optimal shrinkage intensities for given thresholding levels}

\description{Compute optimal shrinkage intensities for given thresholding levels by minimizing the mean square error.}

\usage{delta.star(data, thres.range)}

\arguments{
  \item{data}{dataset. A \eqn{n} by \eqn{p} matrix. }
  \item{thres.range}{range of thresholding levels. The default value is \code{thres.range=seq(0,1,by=0.05)}.}
}

\details{Compute the optimal shrinkage internsity \eqn{\delta*(\lambda)} for any given thresholding level \eqn{\lambda} by minimizing the mean squared error of the NOVELIST covariance estimators to its true covariance matrices.The details of the method are explained by Huang and Fryzlewicz (2015) and Ledoit and Wolf (2003).
}

\value{
  \item{delta.star}{ the pairs of (\eqn{\lambda,\delta*(\lambda))}.}
  \item{cov}{ the array of NOVELIST estimators of covariance matrices with the pairs of (\eqn{\lambda,\delta*(\lambda))}.}
  \item{cor}{ the array of NOVELIST estimators of correlation matrices with the pairs of (\eqn{\lambda,\delta*(\lambda))}.}      

}


\references{
Huang, N. & Fryzlewicz, P. (2015), "NOVELIST estimator of large correlation and covariance matrices and their inverses". Preprint.

Ledoit, O. &  Wolf, M. (2003), "Improved estimation of the covariance matrix of stock returns with an application to portfolio selection." \code{Journal of Empirical Finance} 10, 603-621.}

