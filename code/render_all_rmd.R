## Render all Rmd documents in a project

## dummay variable
path = getwd()

render_all <- function(path){

  list_rmd_files <- list.files(path,
                               full.names = TRUE,
                               recursive = TRUE,
                               pattern = "\\.Rmd")

  safe_render <- purrr::safely(rmarkdown::render)

  x <- purrr::map(list_rmd_files, safe_render)

  transposed <- purrr::transpose(x)

  transposed$error

}
