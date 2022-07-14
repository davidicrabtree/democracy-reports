library(here)
library(purrr)




read_country <- function(path) {
  
  if (is.numeric(path)) stop("You entered a numeric value. Please enter a valid file path.")
  if (grepl(pattern = "data", x = path)) stop("Your path directly refers to the data folder of the project. This function will access the data folder for you - please provide only the name of the CSV file within the World Bank data.")
  
  # Load CSV
  country_data <- read_csv(here("data", "data_world_bank", path), skip = 3)
  
  
  # TIDYING DATA
  country_data_longer <- country_data %>%
    select(-65) %>%
    pivot_longer(
      cols = c(5:64),
      names_to = "Year",
      values_to = "Values")
  
  country_data <- pivot_wider(
    data = country_data_longer,
    names_from = c("Indicator Name", "Indicator Code"),
    values_from = "Values"
  )
  
  #Select vars of interest, give shorter names
  country_data <- country_data %>%
    select(`Country Name`,
           Year,
           `GDP per capita (current US$)_NY.GDP.PCAP.CD`,
           `GDP (current US$)_NY.GDP.MKTP.CD`,
           `GINI index (World Bank estimate)_SI.POV.GINI`,
           `Literacy rate, adult total (% of people ages 15 and above)_SE.ADT.LITR.ZS`,
           `Proportion of seats held by women in national parliaments (%)_SG.GEN.PARL.ZS`) %>%
    rename(country = `Country Name`,
           year = Year,
           gdp = `GDP (current US$)_NY.GDP.MKTP.CD`,
           gdppc = `GDP per capita (current US$)_NY.GDP.PCAP.CD`,
           gini = `GINI index (World Bank estimate)_SI.POV.GINI`,
           litrate = `Literacy rate, adult total (% of people ages 15 and above)_SE.ADT.LITR.ZS`,
           womenleg = `Proportion of seats held by women in national parliaments (%)_SG.GEN.PARL.ZS`)
  

  

}


file_path <- list.files("data/data_world_bank", pattern = ".csv")
file_path

wb_clean <- map_df(file_path, read_country)


