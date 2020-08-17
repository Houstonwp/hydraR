merge.config <- function(...) {
  configs <- list(...)
  if (length(configs) == 1) {
    configs
  } else {
    configs <- lapply(configs, unclass)
    modifiedConfig <- Reduce(modifyList, x = configs[-1], init = configs[[1]])
    as_config(modifiedConfig)
  }
}
