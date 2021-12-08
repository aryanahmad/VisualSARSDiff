
#libraries added: igraph and PItools

#' Creates and outputs a Protein-Protein Interaction Graph
#'
#' @param proteinId the protein ID
#' @examples
#' createProteinInteractionGraph("G1PXH7")
createProteinInteractionGraph <- function(proteinId){
  #TODO: Include information about database and citation

  if(is.null(proteinId)){
    stop("Please enter a proteinId")
  }


  #Get the required data
  proteinDataCleaned <- getProteinInteractionData(proteinId)


  #Prepare the graph
  from <- c()
  to <- c()
  for(i in seq(from=1,to=nrow(proteinDataCleaned),by=1)){
    from[i] <- proteinDataCleaned$IDs_interactor_A[i]
    to[i] <- proteinDataCleaned$IDs_interactor_B[i]
  }
  graphFrame <- data.frame(from, to)


  #Plot the SINGULAR Protein-Protein Interaction Graph
  proteinInteractionGraph <- graph_from_data_frame(d=graphFrame,directed=F)
  degreePerNode <- degree(proteinInteractionGraph, mode="all")
  plot(proteinInteractionGraph, layout=layout.random, vertex.label.cex=c(0.25,0.25,0.25))

}


#' Returns a dataframe of all possible protein-protein interactions
#' using a call to the IMEX database. No graphical output.
#'
#' @param proteinId the protein ID
#' @examples
#' getProteinInteractionData("G1PXH7")
getProteinInteractionData <- function(proteinId){
  #TODO: Include information about database and citation
  if(is.null(proteinId)){
    stop("Please enter a proteinId")
  }


  #Build Query
  queryProtein <- paste("id:", proteinId, sep="")
  queryFinal <- paste(queryProtein, "*", sep="")


  #Call data
  tryCatch( { allData <- queryPSICQUICrlib(query = queryFinal, format = "tab25",
                               database = "imex", directory = "./") },
            error= function(e) {stop("Please enter a valid ID")})


  #Clean Data, Attach to dataframe, and get rid of rows we do not need
  allDataCleaned <- cleanMITAB(allData)
  dataOnly <- allDataCleaned$data
  proteinData <- as.data.frame(dataOnly)
  proteinDataCleaned <- proteinData[!(proteinData$interactor_IDs_databases_A !="uniprotkb"
                                      | proteinData$interactor_IDs_databases_B !="uniprotkb"),]

  return(proteinDataCleaned)

}
