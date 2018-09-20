#' Demo function: This function takes the mean of every numeric variable in a
#' dataset
#'
#'  @param df An object of class data.frame or coercible to one
#'
#'  @return An object of class tibble tbl_df data.frame continaing the
#'  mean of every numeric variable in the input data.frame
#'
#'  @example
#'  library(datasets)
#'  means <- column_mean(cars)
#'
#'  @import purrr
#'  @import magrittr
#'
#'  @export

column_mean <- function(df){

  is_numeric <- purrr::map(df, is.numeric) %>%
  as.logical()
  df <- df[, is_numeric]
  means <- purrr::map(df, mean, na.rm =TRUE)
  result <- means %>% as_tibble()
  return(result)


  }
