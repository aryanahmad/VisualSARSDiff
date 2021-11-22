library("seqinr")
test_that("pairwise Spike has a low score", {
  testCall <- pairwiseSpike("COVID-19", "MERS", TRUE)
  expect_lt(testCall,-3000)
})

test_that("pairwise Spike has a high score with the same, COVID", {
  testCall <- pairwiseSpike("COVID-19", "COVID-19", TRUE)
  expect_gt(testCall, 4000)
})

test_that("pairwise Spike has a high score with the same, MERS", {
  testCall <- pairwiseSpike("MERS", "MERS", TRUE)
  expect_gt(testCall, 4000)
})
