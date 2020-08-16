merge_yaml <- function(yamls){
  if (length(yamls) == 1){
    yamls
  } else {
    Reduce(modifyList, x = yamls[-1], init = yamls[[1]])
  }
}
