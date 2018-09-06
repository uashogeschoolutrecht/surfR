## ----preamble, echo=FALSE, results='hide', message=FALSE-------------------

library(tidyverse)
library(devtools)

knitr::opts_chunk$set(warning = FALSE,
                      error = FALSE)


## --------------------------------------------------------------------------
ggplot2::diamonds %>% head()

## --------------------------------------------------------------------------
library(ggplot2)
diamonds %>% head()

## --------------------------------------------------------------------------
ls()

## --------------------------------------------------------------------------
data("diamonds", package="ggplot2")
ls()

## ---- eval=FALSE-----------------------------------------------------------
#  
#  #' Short description of what this does
#  #'
#  #' Longer description of what this does. Approximately a paragraph.
#  #'
#  #' @param x The first thing
#  #' @param y The second thing.
#  #' @return The thing that comes out of this function
#  #'
#  #' @export (do export this in NAMESPACE)
#  a_function <- function(x,y) {
#    return x+y
#  }
#  

## ----eval=FALSE------------------------------------------------------------
#  devtools::use_data_raw()

## ---- eval=FALSE-----------------------------------------------------------
#  experiment1 <-
#    read.csv('expt1.csv') %>%
#    mutate(experiment = 1)
#  devtools::use_data(experiment1)

## ---- eval=FALSE-----------------------------------------------------------
#  devtools::load_all()
#  experiment1 %>% head()
#  ## or use data() to put it in the global environment
#  data("experiment1")

## ---- eval=FALSE-----------------------------------------------------------
#  experiment1_summary <-
#    experiment1 %>%
#    group_by(subject, condition, block) %>%
#    summarise(mean_rt = mean(rt))
#  
#  devtools::use_data(experiment1_summary)

## ---- eval=FALSE-----------------------------------------------------------
#  #' Data from Experiment 1
#  #'
#  #' This is data from the first experiment ever to try XYZ using Mechanical
#  #' Turk workers.
#  #'
#  #' @format A data frame with NNNN rows and NN variables:
#  #' \describe{
#  #'   \item{subject}{Anonymized Mechanical Turk Worker ID}
#  #'   \item{trial}{Trial number, from 1..NNN}
#  #'   ...
#  #' }
#  "experiment1"

