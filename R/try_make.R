#' Helper function to make()
#'
#' Help do what make() does
#'
#' @param cache.file The file to be made
#' @param builder The builder function
#' @param verbose Should I be verbose?
#' @param fatal Does something
#' @param ... Additional parameters to be evaluated in the builder function
#'
#' @return Something
#'
try_make <- function(cache.file, builder, verbose = FALSE, fatal=FALSE, ...) {
  if (is.null(builder)) stop(paste0("Need Builder function for: ",cache.file))
  if (verbose==TRUE) cat("Making ",cache.file,"\n")
  err <- NULL
  obj <- tryCatch(
    builder(...),
    error = function(e) e
  )
  if (!'error' %in% class(obj)) {
    saveRDS(obj, file=cache.file)
  } else if (fatal) {
    stop(paste0("Error in Builder function for: ",cache.file,"\n",obj$message))
  }
  obj
}
