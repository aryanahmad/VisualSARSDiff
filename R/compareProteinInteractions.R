#Add ggVennDiagram library

compareProteinInteractions <- function(){
  #Call and get 2 different dataframes
  #Create new dataframe that hosts common and use ggplot to display that
  #Y: count, X: the interactions that were the same and concatenated by a asdsdasdasd

  #Get Needed Data
  proteinOneData <- getProteinInteractionData()
  proteinTwoData <- getProteinInteractionData()

  #Put needed


  #Get unique values for each protein, and set up graph
  proteinOneInteractors <- getUniqueProteins(proteinData = proteinOneData)
  proteinTwoInteractors <- getUniqueProteins(proteinData = proteinTwoData)
  graphData <- list(proteinOneInteractors, proteinTwoInteractors)

  #graph this data frame
  ggVennDiagram(graphData, label_alpha = 0)


}

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
