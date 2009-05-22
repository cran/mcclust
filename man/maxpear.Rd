\name{maxpear}
\alias{maxpear}
\alias{pear}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Maximize/Compute Posterior Expected Adjusted Rand Index}
\description{
  Based on a posterior similarity matrix of a sample of clusterings \code{maxpear} finds the clustering that maximizes the 
  posterior expected Rand adjusted index (PEAR) with the true clustering, while \code{pear} computes PEAR for several provided clusterings. 
}
\usage{
maxpear(psm, cls.draw = NULL, method = c("avg", "comp", "draws",
         "all"), max.k = NULL)

pear(cls,psm)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psm}{ a posterior similarity matrix, usually obtained from a call to \code{comp.psm}.}
  \item{cls, cls.draw}{a matrix in which every row corresponds to a clustering of the \code{ncol(cls)} objects.
  \code{cls.draw} refers to the clusterings that have been used to compute \code{psm}, \code{cls.draw} has to be provided if 
  \code{method="draw"} or \code{"all"}.}
  \item{method}{the maximization method used. Should be one of \code{"avg"}, \code{"comp"}, \code{"draws"} or \code{"all"}. The default is \code{"avg"}.}
  \item{max.k}{ integer, if \code{method="avg"} or \code{"comp"} the maximum number of clusters up to which the hierarchical clustering is cut.
  Defaults to \code{ceiling(nrow(psm)/8)}.}
}
\details{
For \code{method="avg"} and \code{"comp"} \code{1-psm} is used as a distance matrix for hierarchical clustering with average/complete linkage.
The hierachical clustering is cut for the cluster sizes \code{1:max.k} and PEAR computed for these clusterings.\cr
Method \code{"draws"} simply computes PEAR for each row of \code{cls.draw} and takes the maximum.\cr
If \code{method="all"} all maximization methods are applied. 
}
\value{
  \item{cl}{clustering with maximal value of PEAR. If \code{method="all"} a matrix containing the clustering with the higest value
  of PEAR over all methods in the first row and the clusterings of the individual methods in the next rows.}
  \item{value}{value of PEAR. A vector corresponding to the rows of \code{cl} if \code{method="all"}.}
  \item{method}{the maximization method used.}
}
\references{Fritsch, A. and Ickstadt, K. (2009) An improved criterion for clustering based on the
posterior similarity matrix, \emph{Bayesian Analysis}, accepted.}
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\seealso{ \code{\link{comp.psm}} for computing posterior similarity matrix, \code{\link{minbinder}}, \code{\link{medv}}, \code{\link{relabel}}
for other possibilities for processing a sample of clusterings.}
\examples{
data(cls.draw1.5) 
# sample of 500 clusterings from a Bayesian cluster model 
tru.class <- rep(1:8,each=50) 
# the true grouping of the observations
psm1.5 <- comp.psm(cls.draw1.5)
mpear1.5 <- maxpear(psm1.5)
table(mpear1.5$cl, tru.class)

# Does hierachical clustering with Ward's method lead 
# to a better value of PEAR?
hclust.ward <- hclust(as.dist(1-psm1.5), method="ward")
cls.ward <- t(apply(matrix(1:20),1, function(k) cutree(hclust.ward,k=k)))
ward1.5 <- pear(cls.ward, psm1.5)
max(ward1.5) > mpear1.5$value

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
\keyword{ optimize }
