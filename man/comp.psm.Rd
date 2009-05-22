\name{comp.psm}
\alias{comp.psm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Estimate Posterior Similarity Matrix}
\description{
  For a sample of clusterings of the same objects the proportion of clusterings in which observation 
  \eqn{i} and \eqn{j} are together in a cluster is computed and a matrix containing all proportions is given out. 
  }
\usage{
comp.psm(cls)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cls}{ a matrix in which every row corresponds to a clustering of the \code{ncol(cls)} objects}
}
\details{
  In Bayesian cluster analysis the posterior similarity matrix is a matrix whose entry 
  \eqn{[i,j]} contains the posterior probability that observation \eqn{i} and \eqn{j} are together in a cluster.
  It is estimated by the proportion of a posteriori clusterings in which \eqn{i} and \eqn{j} cluster together.
}
\value{
  a symmetric \code{ncol(cls)*ncol(cls)} matrix 
}
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}

\seealso{ \code{\link{cltoSim}}}
\examples{
(cls <- rbind(c(1,1,2,2),c(1,1,2,2),c(1,2,2,2),c(2,2,1,1)))
comp.psm(cls)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
