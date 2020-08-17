arg_to_yaml <- function(x, pattern = "\\.") {
  yaml.load(gsub("=", ": ", (gsub(pattern, ":\n  ", x))))
}

cli_to_config <- function(arg) {
  yaml_list <- lapply(arg, arg_to_yaml)
  config_list <- lapply(yaml_list, as_config)
  do.call(merge, config_list)
}
