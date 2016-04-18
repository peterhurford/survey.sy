context("analyze stage")

parameters_yield_data <- function(modelenv, parameters, data) {
  sr <- resource()(modelenv, parameters)
  expect_identical(capture.output(sr$run(data)), capture.output(data))
  expect_true(sr$run(data))
}

test_that("it can analyze data", {
  parameters_yield_data(new.env(), list(
    "Analyze one" = function(df) 1
  ), 1)
})
