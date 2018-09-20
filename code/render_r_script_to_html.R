require("rprojroot") || utils::install.packages("rprojroot")
library(rprojroot)
root <- find_root_file(criterion = is_rstudio_project)

?rmarkdown::render

rmarkdown::render(file.path(root, "presentations", "1_02_first_encounteR.R"),
                                   "html_document", clean = FALSE)
