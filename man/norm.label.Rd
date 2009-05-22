\name{norm.label}
\alias{norm.label}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Norm Labelling of a Clustering }
\description{
  Cluster labels of a clusterings are replaced by \code{1:length(table(cl))}.
}
\usage{
norm.label(cl)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cl}{ vector of cluster memberships }
}
\value{the clustering with normed labels.}
\author{ Arno Fritsch, \email{arno.fritsch@tu-dortmund.de}}

\seealso{ \code{\link{relabel}} for labelling a sample of clusterings the same way }
\examples{
(cl <- sample(c(13,12,34), 13, replace=TRUE))
norm.label(cl)

(cl <- sample(c("a","b","f31"), 13, replace=TRUE))
norm.label(cl)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
