# plumb(dir = "plumber/pipe") %>% pr_run()
library(plumber)

pr() %>%
  pr_get("/hi", function() "Hello World") %>%
  pr_get("/hi1", function() "Hello World") %>%
  pr_get("/hi2", function() "Hello World") %>%
  pr_post("/echo", function(req, res) {
    if (req$postBody == "") return("No input")
    input <- jsonlite::fromJSON(req$postBody)
    list(
      input = input
    )
  })
