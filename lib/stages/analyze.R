# Analyze stage.
#'
#' @param analyze_steps list. List of analyze steps.
analyze_stage <- function(modelenv, analyze_steps) {
  stages <- lapply(seq_along(analyze_steps), function(index) {
    action <- analyze_steps[[index]]
    function(modelenv) { print(action(modelenv$data)) }
  })
  names(stages) <- names(analyze_steps)
  stageRunner$new(modelenv, stages)
}
