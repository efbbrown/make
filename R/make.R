#' Make a .rds file
#'
#' Makes a .rds file according to a builder function & a recency requirement
#'
#' @param cache.file The file to be made
#' @param builder The builder function
#' @param verbose Should I be verbose?
#' @param max.age If the .rds file exists and is younger than the max.age, skip the builder function
#' @param ... Additional parameters to be evaluated in the builder function
#'
#' @return An R data object
#'
#' @examples
#'
#' @export
make <- function(cache.file, builder = NULL, verbose = FALSE, max.age=as.difftime(7,units='days'), ...) {
  cache.file <- paste0(cache.file,'.rds')
  if (!file.exists(cache.file)) return (try_make(cache.file, builder, verbose, fatal=TRUE, ...))
  if (difftime(Sys.time(),file.info(cache.file)$mtime, units=units(max.age)) > max.age) {
    obj <- try_make(cache.file, builder, verbose)
    if (!'error' %in% class(obj)) return(obj)
  }
  if (verbose==TRUE) cat("Reading ",cache.file,"\n")
  return (readRDS(file=cache.file))
}