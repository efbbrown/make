#' Make a .rds file
#'
#' Makes a .rds file according to a builder function & a recency requirement.
#' If the file already exists & the build function throws an error load the file
#' instead. 
#'
#' @param cache.file The name of the file to be made or loaded, without
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
  # Create file name from cache.file argument
  cache.file <- paste0(cache.file,'.rds')
  # If the file doesn't exist, try building the data using internal try_make()
  if (!file.exists(cache.file)) return (try_make(cache.file, builder, verbose, fatal=TRUE, ...))
  # Else if the file is older than the max.age argument,
  if (difftime(Sys.time(),file.info(cache.file)$mtime, units=units(max.age)) > max.age) {
    # Try building the data using internal try_make
    obj <- try_make(cache.file, builder, verbose)
    # If that fails, load the out of date data instead 
    if (!'error' %in% class(obj)) return(obj)
  }
  # If verbose, let user know there's success & the data is loading
  if (verbose==TRUE) cat("Reading ",cache.file,"\n")
  return (readRDS(file=cache.file))
}