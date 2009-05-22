\name{cltoSim}
\alias{cltoSim}
\alias{Simtocl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute Similarity Matrix for a Clustering and vice versa}
\description{
 A similarity matrix is a symmetric matrix whose entry \eqn{[i,j]} is 1 if observation \code{i}
 and \code{j} are in the same cluster and 0 otherwise.   
}
\usage{
cltoSim(cl)
Simtocl(Sim)
}
\arguments{
  \item{cl}{ vector of cluster memberships}
  \item{Sim}{ similarity matrix}
}
\section{Warning }{\code{Simtocl} does \bold{not} check whether \code{Sim} is a valid similarity matrix,
e.g. that \code{Sim[i,j]==1} if \code{Sim[i,k]==1} and \code{Sim[j,k]==1.}}

\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}

\seealso{\code{\link{comp.psm}} for an average similarity matrix.}
\examples{
cl <- c(3,3,1,2,2)
(Sim <- cltoSim(cl))
Simtocl(Sim) 

# not a valid similarity matrix
(Sim2 <- matrix(c(1,0,1,0,1,1,1,1,1), ncol=3))
Simtocl(Sim2) # no warning
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{cluster}
