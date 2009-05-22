\name{mcclust-package}
\alias{mcclust-package}
\alias{mcclust}
\docType{package}
\title{
Process MCMC Sample of Clusterings.
}
\description{
Implements methods for processing a sample of (hard) clusterings, e.g. the MCMC output of a Bayesian clustering model.
Among them are methods that find a single best clustering to represent the sample, which are based on the posterior 
similarity matrix or a relabelling algorithm.
}
\details{
\tabular{ll}{
Package: \tab mcclust\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2009-03-12\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
}
Most important functions:\cr

\code{comp.psm} for computing posterior similarity matrix (PSM). Based on the PSM \code{maxpear} and \code{minbinder} provide
several optimization methods to find a clustering with maximal posterior expected adjusted Rand index with the true clustering or 
one that minimizes the posterior expectation of a loss function by Binder (1978). \code{minbinder} provides the optimization algorithm of 
Lau and Green.\cr

\code{relabel} contains the relabelling algorithm of Stephens (2000).\cr 

\code{arandi} and \code{vi.dist} compute distance functions for clusterings, the (adjusted) Rand index and the entropy-based variation of 
information distance.
}
\author{
Arno Fritsch

Maintainer: Arno Fritsch <arno.fritsch@tu-dortmund.de>
}
\references{Binder, D.A. (1978) Bayesian cluster analysis, \emph{Biometrika} \bold{65}, 31--38.

Fritsch, A. and Ickstadt, K. (2009) An improved criterion for clustering based on the
posterior similarity matrix, \emph{Bayesian Analysis}, accepted.

Lau, J.W. and Green, P.J. (2007) Bayesian model based clustering
procedures, \emph{Journal of Computational and Graphical Statistics} \bold{16}, 526--558.

Stephens, M. (2000) Dealing with label switching in mixture models. 
\emph{Journal of the Royal Statistical Society Series B}, \bold{62}, 795--809.
}
\keyword{ package }
\examples{
data(cls.draw2) 
# sample of 500 clusterings from a Bayesian cluster model 
tru.class <- rep(1:8,each=50) 
# the true grouping of the observations
psm2 <- comp.psm(cls.draw2)
# posterior similarity matrix

# optimize criteria based on PSM
mbind2 <- minbinder(psm2)
mpear2 <- maxpear(psm2)

# Relabelling  
k <- apply(cls.draw2,1, function(cl) length(table(cl)))
max.k <- as.numeric(names(table(k))[which.max(table(k))])
relab2 <- relabel(cls.draw2[k==max.k,])

# compare clusterings found by different methods with true grouping
arandi(mpear2$cl, tru.class)
arandi(mbind2$cl, tru.class)
arandi(relab2$cl, tru.class)

}
