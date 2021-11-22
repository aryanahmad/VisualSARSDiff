#' Pairwise compare 2 spike protines
#'
#' @param spike1 A spike sequence from a FAFSA file.
#' @param spike2 A spike sequence from a FAFSA file.
#' @param scoreCheck Bool
#' @return the score and comparison of the 2 proteins.
pairwiseSpike <- function(spike1, spike2, scoreCheck) {
  if(is.null(spike1) || is.null(spike2) || is.null(scoreCheck)){
    stop()
  }
  if(spike1 == "COVID-19"){
    spike1 <- covid19spike
  }
  if(spike2 == "COVID-19"){
    spike2 <- covid19spike
  }
  if(spike1 == "MERS"){
    spike1 <- mersspike
  }
  if(spike2 == "MERS"){
    spike2 <- mersspike
  }
  spike1Sequence <- spike1[[1]]
  spike2Sequence <- spike2[[1]]
  spike1String <- c2s(spike1Sequence)
  spike2String <- c2s(spike2Sequence)

  pairwiseAlignment(spike1String, spike2String, scoreOnly = scoreCheck)
}
