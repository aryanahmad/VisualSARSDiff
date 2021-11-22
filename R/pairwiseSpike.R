#need seqinR
#need biostrings
#need devtools
pairwiseSpike <- function(spike1, spike2) {

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

  pairwiseAlignment(spike1String, spike2String)
}
