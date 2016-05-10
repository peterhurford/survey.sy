# Survey.sy: A Syberia engine for doing survey research in R <a href="https://travis-ci.org/peterhurford/survey.sy"><img src="https://img.shields.io/travis/peterhurford/survey.sy.svg"></a>

Right now this just contains the analyze stage, which displays whatever analysis you run.

This also loads [the surveytools2 package](https://github.com/peterhurford/surveytools2) and [dplyr](https://github.com/hadley/dplyr) for survey analysis.

```R
,analyze = list(
    "Mean difference in Obama favorability" =
        function(df) mean(df$obama_tmp_diff, na.rm = TRUE),
    "Pre-election post-election t-test" =
        function(df) t.test(df$obama_tmp_pre, df$obama_tmp_post)
  )
```

See [a live example analyzing Obama's post-election favorability ratings.](https://github.com/syberia/examples/blob/master/models/dev/survey/survey.R)

More coming soon.
