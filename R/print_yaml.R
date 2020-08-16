to_yaml <- function(config) {
  yaml <- as.yaml(config)
  class(yaml) <- "yaml"
}

print.yaml <- function(x) {
  writeLines(x)
}
