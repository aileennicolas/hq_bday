library(tidyverse)
library(reactable)
library(shiny)

library(usethis)
use_git_config(user.name = "Aileen Nicolas", user.email = "ahn25019@uga.edu")


hq_bdays<-read_csv("data/haikyuu_birthdays.csv")

reactable(
  hq_bdays,
  pagination = FALSE,
  striped = TRUE,
  highlight = TRUE,
  bordered = TRUE,
  theme = reactableTheme(
    borderColor = "#dfe2e5",
    stripedColor = "#f6f8fa",
    highlightColor = "#f0f5f9",
    cellPadding = "8px 12px",
    style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
    searchInputStyle = list(width = "100%")
  ),
  defaultColDef = colDef(
    header = function(value) gsub(".", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "left",
    minWidth = 70,
    headerStyle = list(background = "#f7f7f8")
  ),
  searchable = TRUE,
  columns = list(
  
    month = colDef(name = "Month"),
    day = colDef(name = "Day"),
    year = colDef(name = "Year"),
    name = colDef(name = "Name"),
    school = colDef(name = "School", align = "center"),
    school_year = colDef(name = "School Year"),
    position = colDef (name = "Position"),
    specialist = colDef (name = "Specialist")
  )
)
