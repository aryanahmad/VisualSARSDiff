#Add ggVennDiagram library

compareProteinInteractions <- function(proteinOneID, proteinTwoID = NULL){
  #Get Needed Data
  #If the second protein isn't given, compare to COVID-19 Spike Protein

  proteinOneData <- getProteinInteractionData(proteinOneID)
  if(is.null(proteinTwoID)){
    proteinTwoData <- getProteinInteractionData("P0DTC2")
  }else{
    proteinTwoData <- getProteinInteractionData(proteinTwoID)
  }

  #Get unique values for each protein, and set up graph

  proteinOneInteractors <- getUniqueProteins(proteinData = proteinOneData)
  proteinTwoInteractors <- getUniqueProteins(proteinData = proteinTwoData)
  graphData <- list(proteinOneInteractors, proteinTwoInteractors)

  #graph this data frame

  ggVennDiagram(graphData, label_alpha = 0)


}

#Helper function
getUniqueProteins <- function(proteinData){

  proteinDataA <- c()
  proteinDataB <- c()
  uniqueA <- unique(proteinData$IDs_interactor_A)
  uniqueB <- unique(proteinData$IDs_interactor_B)

  for(i in seq(from=1,to=nrow(proteinData),by=1)){
    proteinDataA[i] <- uniqueA[i]
  }
  for(i in seq(from=1,to=nrow(proteinData),by=1)){
    proteinDataB[i] <- uniqueA[i]
  }
  totalProteins <- c(proteinDataA, proteinDataB)

  return(unique(totalProteins))
}

compareNumProteinInteractions <- function(){

  counter <- 0
  #this returns a pi chart showing similarity

}
