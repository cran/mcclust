\name{relabel}
\alias{relabel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Stephens' Relabelling Algorithm for Clusterings}
\description{
  For a sample of clusterings in which corresponding clusters have different labels the algorithm attempts to bring 
  the clusterings to a unique labelling.  
}
\usage{
relabel(cls, print.loss = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cls}{a matrix in which every row corresponds to a clustering of the \code{ncol(cls)} objects.}
  \item{print.loss}{logical, should current value of loss function be printed after each iteration? Defaults to TRUE.}
}
\details{
  The algorithm minimizes the loss function \deqn{\sum_{m=1}^M\sum_{i=1}^n\sum_{j=1}^K-\log\hat{p}_{ij} \cdot I_{\{z_i^{(m)}=j\}}}{
  sum_{m=1}^M sum_{i=1}^n sum_{j=1}^K -log(hat{p}_{ij}) * I_{z_i^(m)=j}}
  over the \eqn{M} clusterings, \eqn{n} observations and \eqn{K} clusters, where \eqn{\hat{p}_{ij}}{hat{p}_{ij}} is the
  estimated probability that observation \eqn{i} belongs to cluster \eqn{j} and \eqn{z_i^{(m)}}{z_i^(m)} indicates to which cluster
  observation \eqn{i} belongs in clustering \eqn{m}. \eqn{I_{\{.\}}}{I_{.}} is an indicator function.
  
  Minimization is achieved by iterating the estimation of \eqn{\hat{p}_{ij}}{hat{p}_{ij}} over all clusterings and the
  minimization of the loss function in each clustering by permuting the cluster labels. The latter is
  done by linear programming.   
}
\value{
  \item{cls}{the input \code{cls} with unified labelling.}
  \item{P}{an \eqn{n \times K}{n*K} matrix, where entry \eqn{[i,j]} contains the estimated probability that observation
  \eqn{i} belongs to cluster \eqn{j}.}
  \item{loss.val}{value of the loss function.}
  \item{cl}{vector of cluster memberships that have the highest probabilities \eqn{\hat{p}_{ij}}.} 
}
\references{Stephens, M. (2000) Dealing with label switching in mixture models. 
\emph{Journal of the Royal Statistical Society Series B}, \bold{62}, 795--809. }

\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\note{ 
The implementation is a variant of the algorithm of Stephens which is originally applied to draws of parameters 
for each observation, not to cluster labels.   
}
\section{Warning}{The algorithm assumes that the number of clusters \eqn{K} is fixed. If this is not the case
\eqn{K} is taken to be the most common number of clusters. Clusterings with other numbers of clusters are discarded
and a warning is issued.   
}
\seealso{ \code{\link[lpSolve]{lp.transport}} for the linear programming, \code{\link{maxpear}}, \code{\link{minbinder}}, \code{\link{medv}}
for other possibilities of processing a sample of clusterings.}
\examples{
(cls <- rbind(c(1,1,2,2),c(1,1,2,2),c(1,2,2,2),c(2,2,1,1)))
# group 2 in clustering 4 corresponds to group 1 in clustering 1-3.
cls.relab <- relabel(cls)
cls.relab$cls
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
