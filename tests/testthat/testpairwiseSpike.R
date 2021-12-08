#This is a legacy method. Comparing 2 spike proteins by pairwise sequencing
#is too restrictive, and does not provide any analyzing compared
#to protein-protein interactions that this package has evolved to.


# library("seqinr")
# test_that("pairwise Spike has a low score", {
#   testCall <- pairwiseSpike("COVID-19", "MERS", TRUE)
#   expect_lt(testCall,-3000)
# })
#
# test_that("pairwise Spike has a high score with the same, COVID", {
#   testCall <- pairwiseSpike("COVID-19", "COVID-19", TRUE)
#   expect_gt(testCall, 4000)
# })
#
# test_that("pairwise Spike has a high score with the same, MERS", {
#   testCall <- pairwiseSpike("MERS", "MERS", TRUE)
#   expect_gt(testCall, 4000)
# })
