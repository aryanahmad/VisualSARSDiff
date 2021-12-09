
# VisualSARSDiff

<!-- badges: start -->
<!-- badges: end -->

VisualSARSDiff is a package that allows you to model and compare Protein-Protein Interactions. What started off as an idea with only comparing different corona virus sequences, such as MERS and SARS-CoV-2 expanded to something so much more. While still retaining default functionality to compare your proteinID  to the SARS-CoV-2 Spike protein, lots of custom functionality has been added so that you are able to easily and accurately get protein-protein interaction plots, and compare different protein interactions. 

```
R version 4.1.1 (2021-08-10)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 11.6
```

## Installation

You can install the development version of VisualSARSDiff like so:

```
require("devtools")
devtools::install_github("aryanahmad/VisualSARSDiff", build_vignettes=TRUE)
library("VisualSARSDiff")
```

You can run the Shiny app with the following:

```
runVSD()
```

## Overview

In order to see all the functions that is there for use, please run. 
Before getting started, please ensure all required libraries are installed. 

```
ls("package:VisualSARSDiff")
```

(image)

## Contributions

All code was created by the author, Aryan Ahmad.
Several resources were used, which are outline below.
*igraph* was used to plot the protein-protein interaction graph
*PITools* was used as an API call to get data from the Protein-Protein interaction database
*ggVennDiagram* was used to plot a venn diagram

## References

Altfeld, J. (2021, October 24). Error handling in R with trycatchlog: Catching, logging, post-mortem analysis. CRAN. Retrieved December 9, 2021, from https://cran.r-project.org/web/packages/tryCatchLog/vignettes/tryCatchLog-intro.html. 

Dean Attali. (2015, December 7). Building shiny apps - an interactive tutorial. Dean Attali. Retrieved December 9, 2021, from https://deanattali.com/blog/building-shiny-apps-tutorial/#:~:text=You%20can%20also%20create%20a,R%20%2B%20server. 

Gao, C.-H. (2021, October 22). A 'ggplot2' implement of Venn diagram [R package ggvenndiagram version 1.2.0]. The Comprehensive R Archive Network. Retrieved from https://cran.r-project.org/web/packages/ggVennDiagram/. 

Huang Y;Yang C;Xu XF;Xu W;Liu SW; (n.d.). Structural and functional properties of SARS-COV-2 spike protein: Potential antivirus drug development for covid-19. Acta pharmacologica Sinica. Retrieved from https://pubmed.ncbi.nlm.nih.gov/32747721/. 

Ognyanova, K. (n.d.). Network analysis and visualization with R and igraph. Kateto. Retrieved December 9, 2021, from https://kateto.net/netscix2016.html. 

Protein interaction data tools: Retrieving data from intact and most other databases using PSICQUIC service. PItools. (n.d.). Retrieved from https://vitkl.github.io/PItools/index.html. 

Spike glycoprotein. (n.d.-b). Uniprot.Org. Retrieved November 22, 2021, from https://www.uniprot.org/uniprot/P0DTC2


## Acknowledgements

This package was developed as part of an assessment for 2021
BCB410H: Applied Bioinformatics, University of Toronto, Toronto,
CANADA.
