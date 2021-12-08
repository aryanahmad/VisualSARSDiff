
createProteinInteractionGraph <- function(){
  #TODO: error handling
  #Get data from the database
  #TODO: Include information about database and citation
  allData <- queryPSICQUICrlib(query = "id:P0DTC2*", format = "tab25",
                              database = "imex", directory = "./")

  #Clean Data, Attach to dataframe, and get rid of rows we do not need
  allDataCleaned <- cleanMITAB(allData)
  dataOnly <- allDataCleaned$data
  proteinData <- as.data.frame(dataOnly)
  proteinDataCleaned <- proteinData[!(proteinData$interactor_IDs_databases_A !="uniprotkb"
                                      | proteinData$interactor_IDs_databases_B !="uniprotkb"),]

  #Create a Protein-Protein Interaction Graph

  #TODO: this is kindof important

  return(proteinDataCleaned)
}

