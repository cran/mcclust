\name{cls.draw1.5}
\docType{data}
\alias{cls.draw1.5}
\title{Sample of Clusterings from Posterior Distribution of Bayesian Cluster Model}
\description{
Output of a Dirichlet process mixture model with normal components fitted to the data set \code{Ysim1.5}.
True clusters are given by \code{rep(1:8,each =50).}
}
\usage{
data(cls.draw1.5)
}
\source{Fritsch, A. and Ickstadt, K. (2009) An improved criterion for clustering based on the
posterior similarity matrix, \emph{Bayesian Analysis}, accepted.}
\format{
  matrix with 500 rows and 400 columns. Each row contains a clustering of the 400 observations.
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ datasets }
