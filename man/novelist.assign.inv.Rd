\name{novelist.assign.inv}
\alias{novelist.assign.inv}

\title{
Parameter-assigned NOVELIST estimators of inverse of a corvariance/correlation matrix
}
\description{
A series of NOVELIST estimators of inverse of a covariance/correlation matrix by a series of assigned parameters \eqn{\lambda} and \eqn{\delta}.}
\usage{
novelist.assign.inv(m, th, delta, thf = softt)
}


\arguments{
  \item{m}{a \eqn{p} by \eqn{p} sample covariance matrix.
}
  \item{th}{a sequence of thresholding levels, for example \code{th=seq(0,1,by=0.05)}.
}
  \item{delta}{a sequence of shrinkage intensities, for example \code{delta=seq(-0.5,1.5,by=0.05)}.}
  \item{thf}{thresholding method. Soft thresholding is used if \code{thf=softt}, hard thresholding is used if \code{thf=hardt} or any other generalized thresholding method chosen by users.
}
}
\value{
\item{inv.cov.novel}{an array of NOVELIST estimators of the inverse of the covariance matrix. }
\item{inv.cor.novel}{an array of NOVELIST estimators of the inverse of the correlation matrix. }

}

\seealso{
\code{\link{novelist.assign}}
}
