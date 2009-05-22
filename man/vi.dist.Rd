\name{vi.dist}
\alias{vi.dist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Variation of Information Distance for Clusterings }
\description{
  Computes the 'variation of information' distance of Meila (2007) between two clusterings/partitions of the same objects.
}
\usage{
vi.dist(cl1, cl2, parts = FALSE, base = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cl1,cl2}{ vectors of cluster memberships (need to have the same lengths).}
  \item{parts}{ logical; should the two conditional entropies also be returned?}
  \item{base}{ base of logarithm used for computation of entropy and mutual information.}
}
\details{
  The variation of information distance is the sum of the two conditional entropies of one clustering given the other.
  For details see Meila (2007).
}
\value{
  The VI distance. If \code{parts=TRUE} the two conditional entropies are appended. 
}
\references{Meila, M. (2007) Comparing Clusterings - an Information Based Distance.
\emph{Journal of Multivariate Analysis}, \bold{98}, 873 -- 895.}
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\seealso{ \code{\link{arandi}} }
\examples{
 cl1 <- sample(1:3,10,replace=TRUE)
 cl2 <- c(cl1[1:5], sample(1:3,5,replace=TRUE))
 vi.dist(cl1,cl2)
 vi.dist(cl1,cl2, parts=TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{cluster}
