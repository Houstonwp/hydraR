arg_to_yaml <- function(x, pattern = "\\.") {
  yaml.load(gsub("=", ": ",(gsub(pattern, ":\n  ", x))))
}

cli_to_list <- function(arg) {
  yaml_list <- lapply(arg, arg_to_yaml)
  merge_yaml(yaml_list)
}
