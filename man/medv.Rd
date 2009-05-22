\name{medv}
\alias{medv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Clustering Method of Medvedovic}
\description{
  Based on a posterior similarity matrix of a sample of clusterings \code{medv} obtains a clustering by using \code{1-psm} as distance 
  matrix for hierarchical clustering with complete linkage. The dendrogram is cut at a value \code{h} close to 1. 
}
\usage{
medv(psm, h=0.99)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psm}{a posterior similarity matrix, usually obtained from a call to \code{comp.psm}.}
  \item{h}{The height at which the dendrogram is cut.}
}

\value{
  vector of cluster memberships. 
}
\references{Medvedovic, M. Yeung, K. and Bumgarner, R. (2004) Bayesian mixture model based clustering
of replicated microarray data, \emph{Bioinformatics}, \bold{20}, 1222-1232.}
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\seealso{ \code{\link{comp.psm}} for computing posterior similarity matrix, \code{\link{maxpear}}, \code{\link{minbinder}}, \code{\link{relabel}}
for other possibilities for processing a sample of clusterings.}
\examples{
data(cls.draw1.5) 
# sample of 500 clusterings from a Bayesian cluster model 
tru.class <- rep(1:8,each=50) 
# the true grouping of the observations
psm1.5 <- comp.psm(cls.draw1.5)
medv1.5 <- medv(psm1.5)
table(medv1.5, tru.class)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
