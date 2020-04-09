#' ---
#' title: "Working with swissdata in R"
#' author: "Swissdata team"
#' output: github_document
#' ---
#' ```{r, include = FALSE}
#' knitr::opts_chunk$set(
#'   collapse = TRUE,
#'   fig.width  = 7.1,
#'   fig.height = 3.5,
#'   comment = "#>"
#' )
#' ```

library(tidyverse)
library(jsonlite)
library(tsbox)


#' #### Get latest data and meta information from the internet

#' read data in a flat structure, meta information in a hierarchical structure
url_csv <- "https://raw.githubusercontent.com/swissdata/demo/master/data/ch_adecco_sjmi.csv"
data <- read_csv(url_csv, col_types = cols())

url_json <- "https://raw.githubusercontent.com/swissdata/demo/master/data/ch_adecco_sjmi.json"
meta <- read_json(url_json)


#' #### Example 1: Plot a single time series: Adecco Swiss Job Market Index

data_sch <- filter(data, idx_type == "sch")

#' Use the [tsbox](https://www.tsbox.help) package to transform a data frame
#' into a 'ts' time series:
ts_ts(data_sch)

#' Or to plot it:
ts_plot(data_sch)


#' #### Example 2: Use English (or German or French or Italian) labels

#' Add english labels to the dataset:

mylang <- "en"  # "de", "fr", "it"
translation_tbl <-
  enframe(
    sapply(meta$labels$idx_type, function(e) e[[mylang]]),
    name = "idx_type",
    value = "label"
  )
left_join(data, translation_tbl, by = "idx_type")


#' #### Example 3: Work with structural hierarchy
#'
#' Extract the id based structural hierarchy as an R List:

hierarchy <- meta$hierarchy$idx_type


#' And show as human friendly YAML representation:

cat(yaml::as.yaml(hierarchy))

#' Same as above, but use English (or German or French or Italian) labels.
#' This reveals that newspaper (`pzua`), online job posting sites (`ins`) and company websites (`unw`) are sub-series of all (`sch`).

map_idx_type_atomic <- sapply(meta$labels$idx_type, function(e) e[[mylang]])
id_to_mylang <- function(x) {
  if (!is.list(x)) return(x)
  lapply(setNames(x, map_idx_type_atomic[names(x)]), id_to_mylang)
}
cat(yaml::as.yaml(id_to_mylang(meta$hierarchy$idx_type)))


#' #### Example 4: Use time stamp of latest update
#'
#' To check if new data is available, it is sufficient to download the JSON
#' file. The following returns a time stamp of the last update in UTC time:

read_json("https://raw.githubusercontent.com/swissdata/demo/master/data/ch_adecco_sjmi.json")$updated_utc

