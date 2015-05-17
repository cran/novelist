\name{hardt}
\alias{hardt}
\title{
Hard thresholding estimator of covariance/correlation matrix
}
\description{
Obtain a series of hard thresholding estimators of a covariance/correlation matrix by applying a series of thresholdings.
}
\usage{
hardt(m, th, Cor = TRUE)
}
\arguments{
  \item{m}{a \eqn{p} by\eqn{ p} sample covaraince matrix. }
  \item{th}{a series of thresholding levels, for example \code{th=seq(0,1,by=0.05)}. }
  \item{Cor}{apply hard thresholding on sample covariance matrix if \code{Cor=FALSE}; apply hard thresholding on sample correlation matrix if \code{Cor=TRUE}.}
}

\value{
  An array of covariance/correlation matrix estimators after regularized by a series of thresholding levels.
}

\seealso{
\code{\link{softt}}
}
