yaml_path <- function(x, ext) {
  file_name <- paste(x, ext, sep = ".")
  if (is.null(names(x))) {
    file_name
  } else {
    file.path(names(x), file_name)
  }
}

defaults_to_files <- function(config) {
  lapply(config$defaults, yaml_path, ext = "yaml")
}

load_defaults <- function(config) {
  files <- defaults_to_files(config)
  yamls <- lapply(files, yaml.load_file)
  configs <- lapply(yamls, as_config)
  do.call(configs, merge)
}
