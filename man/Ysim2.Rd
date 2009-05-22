\name{Ysim2}
\docType{data}
\alias{Ysim2}
\title{Simulated 3-dimensional Normal Data Containing 8 Clusters}
\description{
Cluster means are given by the 8 possible values of \eqn{(\pm 2,\pm 2, \pm 2)}{(+/-2, +/-2, +/-2)} to which standard normal
noise was added. True clusters are given by \code{rep(1:8,each =50).}
}
\usage{
data(Ysim2)
}
\source{Simulated by\cr 
\code{
     2 * matrix(c(rep(c(1,1,1),50), rep(c(1,1,-1),50), rep(c(1,-1,1),50), rep(c(-1,1,1),50),
     rep(c(1,-1,-1),50), rep(c(-1,1,-1),50), rep(c(-1,-1,1),50), rep(c(-1,-1,-1),50)),
     byrow=TRUE, ncol=3) + matrix(rnorm( 400*3),ncol=3)
    }}

\format{
  matrix with 400 rows and 3 columns.
}
\references{Fritsch, A. and Ickstadt, K. (2009) An improved criterion for clustering based on the
posterior similarity matrix, \emph{Bayesian Analysis}, accepted.}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ datasets }
