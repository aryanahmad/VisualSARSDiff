
#' Creates and outputs a Protein-Protein Interaction Graph
#'
#' @param proteinId the protein ID
#' @references
#' Ognyanova, K. (n.d.). Network analysis and visualization with R and igraph. Kateto. Retrieved December 9, 2021, from https://kateto.net/netscix2016.html.
#' Protein interaction data tools: Retrieving data from intact and most other databases using PSICQUIC service. PItools. (n.d.). Retrieved from https://vitkl.github.io/PItools/index.html.
createProteinInteractionGraph <- function(proteinId){

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
#' @references
#' Altfeld, J. (2021, October 24). Error handling in R with trycatchlog: Catching, logging, post-mortem analysis. CRAN. Retrieved December 9, 2021, from https://cran.r-project.org/web/packages/tryCatchLog/vignettes/tryCatchLog-intro.html.
#' Protein interaction data tools: Retrieving data from intact and most other databases using PSICQUIC service. PItools. (n.d.). Retrieved from https://vitkl.github.io/PItools/index.html.
getProteinInteractionData <- function(proteinId){
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
