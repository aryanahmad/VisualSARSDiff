#Add ggVennDiagram library

#' Compare the Interactions of 2 Proteins, Using a Venn Diagram
#'
#' @param proteinOneID the ID of a protein
#' @param proteinTwoID the optional ID of a second protein, will default to SARS-CoV-2 spike protein
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' compareProteinInteractions("P0DTC2","G1PXH7")
#' compareProteinInteractions("G1PXH7")
compareProteinInteractions <- function(proteinOneID, proteinTwoID = NULL){

  if(proteinOneID == proteinTwoID){
    stop("You are comparing the same protein!")
  }
  if(is.null(proteinOneID)){
    stop("You must enter at least one protein ID")
  }

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
  graphData <- list(A = proteinOneInteractors,
                    B = proteinTwoInteractors)

  #graph this data frame

  ggVennDiagram(graphData, label_alpha = 0)


}


#' Helper function for compareProteinInteractions().
#' Condenses a large protein dataframe into unique protein interactions
#'
#' @param proteinData a dataframe of protein data from getProteinInteractionData()
#' @return a list of unique proteins that this protein interacts with
#' @examples
#' x <- getProteinInteractionData("G1PXH7")
#' getUniqueProteins(x)
getUniqueProteins <- function(proteinData){

  if(is.null(proteinData)){
    stop("Please enter a dataframe directly from the getProteinInteraction
         Data() function")
  }

  proteinDataA <- c()
  proteinDataB <- c()

  #Get unique Proteins
  tryCatch( {uniqueA <- unique(proteinData$IDs_interactor_A)
  uniqueB <- unique(proteinData$IDs_interactor_B)}, error=function(e){
    stop("Please enter a dataframe directly from the getProteinInteraction
         Data() function")
  } )

  #Combine unique Proteins
  for(i in seq(from=1,to=nrow(proteinData),by=1)){
    proteinDataA[i] <- uniqueA[i]
  }
  for(i in seq(from=1,to=nrow(proteinData),by=1)){
    proteinDataB[i] <- uniqueA[i]
  }
  totalProteins <- c(proteinDataA, proteinDataB)

  return(unique(totalProteins))
}
