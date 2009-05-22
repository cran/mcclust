\name{arandi}
\alias{arandi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ (Adjusted) Rand Index for Clusterings }
\description{
  Computes the adjusted or unadjusted Rand index between two clusterings/partitions of the same objects.   
}
\usage{
arandi(cl1, cl2, adjust = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cl1,cl2}{vectors of cluster memberships (need to have the same lengths).}
  \item{adjust}{logical. Should index be adjusted? Defaults to TRUE.}
}

\details{The Rand index is based on how often the two clusterings agree in the treatment of pairs of observations,
where agreement means that two observations are in/not in the same cluster in both clusterings.\cr

The adjusted Rand index adjusts for the expected number of chance agreements.\cr

Formulas of Hubert and Arabie (1985) are used for the computation.}

\references{ Hubert, L. and Arabie, P. (1985): Comparing
partitions. \emph{Journal of Classification}, \bold{2}, 193--218. }
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}
\seealso{\code{\link{vi.dist}}}
\examples{
 cl1 <- sample(1:3,10,replace=TRUE)
 cl2 <- c(cl1[1:5], sample(1:3,5,replace=TRUE))
 arandi(cl1,cl2)
 arandi(cl1,cl2,adjust=FALSE)}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.}
\keyword{cluster}
