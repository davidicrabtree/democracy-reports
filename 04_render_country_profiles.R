library(tidyverse)
library(here)

fh_wb <- read_csv(here("data", "fh_wb.csv"))

all_countries <- unique(fh_wb$country)


render_report <- function(country_name) {
  rmarkdown::render(
    'country_profiles.Rmd',
    output_format = "github_document",
    output_file =  country_name,
    output_dir = "reports",
    params = list(given_country = country_name),
  )
}



for (country in all_countries) {
  render_report(country)
}
