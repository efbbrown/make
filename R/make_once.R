#' Make a .rds file if it doesn't exist already
#'
#' Makes a .rds file according to a builder function
#'
#' @param cache.file The file to be made
#' @param builder The builder function
#' @param verbose Should I be verbose?
#' @param ... Additional parameters to be evaluated in the builder function
#'
#' @return An R data object
#'
#' @examples
#'
#' @export
make_once <- function(cache.file, builder = NULL, verbose = FALSE, ...) {
  cache.file <- paste0(cache.file,'.rds')
  if (!file.exists(cache.file)) return (try_make(cache.file, builder, verbose, fatal=TRUE, ...))
  if (verbose==TRUE) cat("Reading ",cache.file,"\n")
  return (readRDS(file=cache.file))
}