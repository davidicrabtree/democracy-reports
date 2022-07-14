# Required Packages
`library(scales)`  
`library(here)`  
`library(tidyverse)`  
`library(tidyr)`  
`library(readxl)`  
`library(magrittr)`  
`library(purrr)`  

# Required Data
My scripts and Rmd files require you to have my data folder, which contains: `continents.csv`, `FreedomHouse.xlsx`, and the `data_world_bank` folder, containing each country's respective World Bank profiles. My scripts assume your data folder is located in your project directory. If you cloned my repo and have my data folder, all code referencing data should run as-is. 

# Structure & Process
R script `01_cleaning_fh.R`, imports the FreedomHouse country ratings and the data is cleaned to a tidy format, where the unit of analysis is a given country in a given year, and the variables are ratings for political rights, civil liberties, and overall freedom status.  

R script `02_cleaning_world_bank.R` imports the class World Bank data for all countries, and I narrow down the variables to GDP, GDP per capita, gini coefficients, literacy rates, women in government, country name, and year. The unit of analysis for this data is a given country in a given year.

R script `03_merge_datasets.R` further cleans the FreedomHouse and World Bank data so that they cover the same year range (1972-2019), all country names are cleaned to match, and the sets are joined based on country name and year. A left join is used that keeps all data from FreedomHouse and all matched data from the World Bank, meaning that if data from World Bank does not have matches in FreedomHouse, it is dropped. This was chosen since my primary interest is in each country's democracy ratings, and the World Bank indicators are used as predictor variables. 

R script `04_render_country_profiles.R` iterates over every country in the merged dataset, `fh_wb`, and creates a democracy profile for it based on the `country_profiles.Rmd` file. 

`country_profiles.Rmd` contains paramaterized code for making a democracy profile for a given country. Individual country reports are stored in a folder called `reports` and are accessible in markdown or html formats. 

`global_report.Rmd` generates my global analysis on the political, economic, and social variables.

# Load Order
Follow the numbered order of the files in the repo. Specifically, begin with the first 3 R Scripts: cleaning_fh, cleaning_world_bank, and merge_datasets, respectively. After these sets are ran, you can proceed to run the other 3 files (render_country_profiles, country_profiles, and global_report) in any order that you wish. The .Rmd files will access the cleaned/merged data by importing it (note that `03_merge_datasets.R` stored a copy of the cleaned dataframe in the data folder).

All data is contained within the project, so it should be successfully referenced as-is with the here() functions I've specified. All files should run without errors if loaded in the order specified here. 


