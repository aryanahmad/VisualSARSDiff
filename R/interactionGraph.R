
#libraries added: igraph and PItools
#TODO: Examples
createProteinInteractionGraph <- function(){
  #TODO: error handling
  #Get data from the database
  #TODO: Include information about database and citation
  #TODO: get custom queries

  proteinDataCleaned <- getProteinInteractionData()

  #Prepare the graph
  graphEdges <- c()
  for(i in seq(from=1,to=nrow(proteinDataCleaned),by=2)){
    graphEdges[i] <- proteinDataCleaned$IDs_interactor_A[i]
    graphEdges[i+1] <- proteinDataCleaned$IDs_interactor_B[i]
  }
  proteinInteractionGraph <- graph(edges=graphEdges,directed=F)
  plot(proteinInteractionGraph, mode="circle")

}

getProteinInteractionData <- function(){
  #TODO: error handling
  #Get data from the database
  #TODO: Include information about database and citation
  #TODO: get custom queries

  #Get data
  allData <- queryPSICQUICrlib(query = "id:P0DTC2*", format = "tab25",
                               database = "imex", directory = "./")

  #Clean Data, Attach to dataframe, and get rid of rows we do not need
  allDataCleaned <- cleanMITAB(allData)
  dataOnly <- allDataCleaned$data
  proteinData <- as.data.frame(dataOnly)
  proteinDataCleaned <- proteinData[!(proteinData$interactor_IDs_databases_A !="uniprotkb"
                                      | proteinData$interactor_IDs_databases_B !="uniprotkb"),]

  return(proteinDataCleaned)

}
