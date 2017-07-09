# Analyze stage.
#'
#' @param analyze_steps list. List of analyze steps.
analyze_stage <- function(modelenv, analyze_steps) {
  if (is.list(analyze_steps[[1]])) {
    write <- analyze_steps[[1]][["write"]]
    analyze_steps <- analyze_steps[[2]]
  } else {
    write <- "stdout"
  }

  outfile <- NULL
  for (write_to in write) {
    if (!identical(write_to, "stdout")) {
      outfile <- file(write_to, "w")
    }
  }

  stages <- lapply(seq_along(analyze_steps), function(index) {
    action <- analyze_steps[[index]]
    function(modelenv) {
      out <- action(modelenv$data)
      if ("stdout" %in% write) { print(out) }
      if (!is.null(outfile)) { 
        cat(paste0(names(analyze_steps)[[index]], "\n"), file = outfile)
        cat(paste0(capture.output(out), "\n"), file = outfile)
      }
    }
  })

  names(stages) <- names(analyze_steps)
  stageRunner$new(modelenv, stages)
}
