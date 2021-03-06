% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compareProteinInteractions.R
\name{getUniqueProteins}
\alias{getUniqueProteins}
\title{Helper function for compareProteinInteractions().
Condenses a large protein dataframe into unique protein interactions}
\usage{
getUniqueProteins(proteinData)
}
\arguments{
\item{proteinData}{a dataframe of protein data from getProteinInteractionData()}
}
\value{
a list of unique proteins that this protein interacts with
}
\description{
Helper function for compareProteinInteractions().
Condenses a large protein dataframe into unique protein interactions
}
\references{
Altfeld, J. (2021, October 24). Error handling in R with trycatchlog: Catching, logging, post-mortem analysis. CRAN. Retrieved December 9, 2021, from https://cran.r-project.org/web/packages/tryCatchLog/vignettes/tryCatchLog-intro.html.
}
