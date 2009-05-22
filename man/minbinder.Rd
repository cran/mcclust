\name{minbinder}
\alias{minbinder}
\alias{binder}
\alias{laugreen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Minimize/Compute Posterior Expectation of Binders Loss Function}
\description{
 Based on a posterior similarity matrix of a sample of clusterings \code{minbinder} finds the clustering that minimizes the 
 posterior expectation of Binders loss function, while \code{binder} computes the posterior expected loss for several provided clusterings. 
}
\usage{
minbinder(psm, cls.draw = NULL, method = c("avg", "comp", "draws", 
          "laugreen","all"), max.k = NULL, include.lg = FALSE, 
          start.cl = NULL, tol = 0.001)

binder(cls,psm)

laugreen(psm, start.cl, tol=0.001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{psm}{ a posterior similarity matrix, usually obtained from a call to \code{comp.psm}.}
 \item{cls, cls.draw}{a matrix in which every row corresponds to a clustering of the \code{ncol(cls)} objects.
  \code{cls.draw} refers to the clusterings that have been used to compute \code{psm}, \code{cls.draw} has to be provided if 
  \code{method="draw"} or \code{"all"}.}
  \item{method}{the maximization method used. Should be one of \code{"avg"}, \code{"comp"}, \code{"draws"}, \code{"laugreen"} or \code{"all"}.
  The default is \code{"avg"}.}
  \item{max.k}{ integer, if \code{method="avg"} or \code{"comp"} the maximum number of clusters up to which the hierarchical clustering is cut.
  Defaults to \code{ceiling(nrow(psm)/4)}. }
  \item{include.lg}{logical, should method \code{"laugreen"} be included when \code{method="all"}? Defaults to FALSE.}
  \item{start.cl}{clustering used as starting point for \code{method="laugreen"}. If \code{NULL} \code{start.cl= 1:nrow(psm)} is used.}
  \item{tol}{convergence tolerance for \code{method="laugreen"}.}
}

\details{
 The posterior expected loss is the sum of the absolute differences of the indicator function of observation 
 \eqn{i} and \eqn{j} clustering together and the posterior probability that they are in one cluster.
 
 For \code{method="avg"} and \code{"comp"} \code{1-psm} is used as a distance matrix for hierarchical clustering with average/complete linkage.
 The hierachical clustering is cut for the cluster sizes \code{1:max.k} and the posterior expected loss is computed for these clusterings.\cr
 Method \code{"draws"} simply computes the posterior expected loss for each row of \code{cls.draw} and takes the minimum.\cr
 Method \code{"laugreen"} implements the algorithm of Lau and Green (2007), which is based on binary integer programming. Since the method can 
 take some time to converge it is only used if explicitly demanded with \code{method="laugreen"} or \code{method="all"} \emph{and} \code{include.lg=TRUE}.
 If \code{method="all"} all minimization methods except \code{"laugreen"} are applied.  
 }

\value{
    \item{cl}{clustering with minimal value of expected loss. If \code{method="all"} a matrix containing the clustering with the smallest value
   of the expected loss over all methods in the first row and the clusterings of the individual methods in the next rows.}
  \item{value}{value of posterior expected loss. A vector corresponding to the rows of \code{cl} if \code{method="all"}.}
  \item{method}{the maximization method used.}
  \item{iter.lg}{if \code{method="laugreen"} the number of iterations the method needed to converge.}
}
\references{
Binder, D.A. (1978) Bayesian cluster analysis, \emph{Biometrika} \bold{65}, 31--38.

Fritsch, A. and Ickstadt, K. (2009) An improved criterion for clustering based on the
posterior similarity matrix, \emph{Bayesian Analysis}, accepted.

Lau, J.W. and Green, P.J. (2007) Bayesian model based clustering
procedures, \emph{Journal of Computational and Graphical Statistics} \bold{16}, 526--558.
}

\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\seealso{ \code{\link{comp.psm}} for computing posterior similarity matrix, \code{\link{maxpear}}, \code{\link{medv}}, \code{\link{relabel}}
for other possibilities for processing a sample of clusterings. \code{\link[lpSolve]{lp}} for the linear programming.}
\examples{
data(cls.draw2) 
# sample of 500 clusterings from a Bayesian cluster model 
tru.class <- rep(1:8,each=50) 
# the true grouping of the observations
psm2 <- comp.psm(cls.draw2)
mbind2 <- minbinder(psm2)
table(mbind2$cl, tru.class)

# Does hierachical clustering with Ward's method lead 
# to a lower value of Binders loss?
hclust.ward <- hclust(as.dist(1-psm2), method="ward")
cls.ward <- t(apply(matrix(1:20),1, function(k) cutree(hclust.ward,k=k)))
ward2 <- binder(cls.ward, psm2)
min(ward2) < mbind2$value

# Method laugreen is applied to 40 randomly selected observations
ind <- sample(1:400, 40)
mbind.lg <- minbinder(psm2[ind, ind],cls.draw2[,ind], method="all",
                        include.lg=TRUE)
mbind.lg$value

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
\keyword{ optimize}% __ONLY ONE__ keyword per line
