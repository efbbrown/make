% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_once.R
\name{make_once}
\alias{make_once}
\title{Make a .rds file if it doesn't exist already}
\usage{
make_once(cache.file, builder = NULL, verbose = FALSE, ...)
}
\arguments{
\item{cache.file}{The file to be made}

\item{builder}{The builder function}

\item{verbose}{Should I be verbose?}

\item{...}{Additional parameters to be evaluated in the builder function}
}
\value{
An R data object
}
\description{
Makes a .rds file according to a builder function
}
\examples{

}

