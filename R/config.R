
as_config <- function(x) {
  UseMethod("as_config", x)
}

as_config.default <- function(x) {
  stop("Must be of type character or list.")
}

as_config.character <- function(x) {
  x <- yaml.load(x)
  as_config(x)
}

as_config.list <- function(x) {
  stopifnot(depth(x) <= 2)
  class(x) <- "config"
  x
}

c.config <- function(...) {
  list(...)
}

is_config <- function(x) {
  inherits(x, "config")
}

# https://stackoverflow.com/questions/13432863/determine-level-of-nesting-in-r#comment18364266_13433689
depth <- function(this) ifelse(is.list(this), 1L + max(sapply(this, depth)), 0L)
