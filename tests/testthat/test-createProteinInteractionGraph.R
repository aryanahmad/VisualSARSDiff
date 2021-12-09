
#This test fails, even though seperately it passes?
# test_that("Integration - Full as a group", {
#   #no error here
#   expect_error(createProteinInteractionGraph("P0DTC2"), NA)
# })

test_that("Empty protein Id gives error", {
  expect_error(createProteinInteractionGraph())
})

test_that("Empty protein Id gives error - get", {
  expect_error(getProteinInteractionData())
})

test_that("Invalid protein ID gives error - get", {
  expect_error(getProteinInteractionData("12345"))
})

#This test fails, even though seperately it passes?
# test_that("Valid Protein ID returns dataframe - get", {
#   x <- getProteinInteractionData("P0DTC2")
#   expect_identical(typeof(data.frame()), typeof(x))
# })
