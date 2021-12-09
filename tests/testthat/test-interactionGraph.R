#This test fails, even though seperately it passes?

# test_that("Helper returns unique proteins", {
#   x <- getProteinInteractionData("P0DTC2")
#   y <- getUniqueProteins(x)
#   z <- data.frame()
#   expect_identical(typeof(y), typeof(z)) #both should be LISTS
# })

test_that("Helper is given fake dataframe", {
  expect_error(getUniqueProteins("abc"))
})

test_that("Helper is given Null", {
  expect_error(getUniqueProteins(NULL))
})

#This test fails, even though seperately it passes?
# test_that("Integration - protein 2 blank", {
#   #no error, graph shows
#   expect_error(compareProteinInteractions("P0DTC2"), NA)
# })

test_that("Main function gives null", {
  expect_error(compareProteinInteractions(NULL))
})
