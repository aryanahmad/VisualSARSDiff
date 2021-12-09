
# VisualSARSDiff

<!-- badges: start -->
<!-- badges: end -->

The goal of VisualSARSDiff is to sequentially compare different coronaviruses 
spike proteins, an essentialy part of the virus that is known for binding to hosts
and therefore is a main reason in causing infection. With this package, you 
are able to use pairwise sequencing between spike proteins different, already defined
coronaviruses (such as MERS and SARS-CoV-2), as well as compare them in a visual way,
via transmission statistics (worldwide) and other visual sequences (dotplots, etc)

## Installation

You can install the development version of VisualSARSDiff like so:


require("devtools")
devtools::install_github("aryanahmad/VisualSARSDiff", build_vignettes=TRUE)
library("VisualSARSDiff")


##NOTE: Shiny app under construction


## Overview

This is a basic example which shows you how to solve a common problem:


library(VisualSARSDiff)
## I want to compare MERS and SARS-CoV-2
x <- pairwiseSpike("MERS", "COVID-19")
x


## Contributions

All code was created by the author, Aryan Ahmad. 
Genome sequences were used from UNIPROT
pairwiseSpike uses other packages from seqinR and Biostrings

## References

Gao, C.-H. (2021, October 22). A 'ggplot2' implement of Venn diagram [R package ggvenndiagram version 1.2.0]. The Comprehensive R Archive Network. Retrieved from https://cran.r-project.org/web/packages/ggVennDiagram/. 

Huang Y;Yang C;Xu XF;Xu W;Liu SW; (n.d.). Structural and functional properties of SARS-COV-2 spike protein: Potential antivirus drug development for covid-19. Acta pharmacologica Sinica. Retrieved from https://pubmed.ncbi.nlm.nih.gov/32747721/. 

Ognyanova, K. (n.d.). Network analysis and visualization with R and igraph. Kateto. Retrieved December 9, 2021, from https://kateto.net/netscix2016.html. 

Protein interaction data tools: Retrieving data from intact and most other databases using PSICQUIC service. PItools. (n.d.). Retrieved from https://vitkl.github.io/PItools/index.html. 

Spike glycoprotein. (n.d.-b). Uniprot.Org. Retrieved November 22, 2021, from https://www.uniprot.org/uniprot/P0DTC2



## Acknowledgements

This package was developed as part of an assessment for 2021
BCB410H: Applied Bioinformatics, University of Toronto, Toronto,
CANADA.
