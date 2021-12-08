
#libraries added: igraph and PItools
#TODO: Examples
createProteinInteractionGraph <- function(proteinId){
  #TODO: error handling
  #Get data from the database
  #TODO: Include information about database and citation
  #TODO: get custom queries

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

getProteinInteractionData <- function(proteinId){
  #TODO: error handling
  #Get data from the database
  #TODO: Include information about database and citation

  #Build Query
  queryProtein <- paste("id:", proteinId, sep="")
  queryFinal <- paste(queryProtein, "*", sep="")

  #Call data
  allData <- queryPSICQUICrlib(query = queryFinal, format = "tab25",
                               database = "imex", directory = "./")

  #Clean Data, Attach to dataframe, and get rid of rows we do not need
  allDataCleaned <- cleanMITAB(allData)
  dataOnly <- allDataCleaned$data
  proteinData <- as.data.frame(dataOnly)
  proteinDataCleaned <- proteinData[!(proteinData$interactor_IDs_databases_A !="uniprotkb"
                                      | proteinData$interactor_IDs_databases_B !="uniprotkb"),]

  return(proteinDataCleaned)

}
