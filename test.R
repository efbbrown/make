library(makeR)

test <- make("test", function() {

  require(data.table)

  dt <- data.table(c1 = 1:20,
                   c2 = c("foo", "bar"),
                   c3 = runif(n = 20, 100, 200)
                   )

}, max.age = as.difftime(30, units = "secs"))
