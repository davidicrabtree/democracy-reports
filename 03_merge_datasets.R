library(magrittr)

#Filter data to be the years covered by BOTH datasets: 1973-2019
fh_clean <- fh_clean %>%
  filter(year < 2020)

wb_clean$year <- as.numeric(wb_clean$year)

wb_clean <- wb_clean %>%
  filter(year > 1972)




#Account for name mismatches in World Bank and FreedomHouse
for (i in seq_along(wb_clean$country)) {
  if(wb_clean$country[i] == "Bahamas, The") {
    wb_clean$country[i] <- "Bahamas"
  }
  else if(wb_clean$country[i] == "Brunei Darussalam") {
    wb_clean$country[i] <- "Brunei"
  }
  else if(wb_clean$country[i] == "Congo, Dem. Rep.") {
    wb_clean$country[i] <- "Congo (Kinshasa)"
  }
  else if(wb_clean$country[i] == "Congo, Rep.") {
    wb_clean$country[i] <- "Congo (Brazzaville)"
  }
  else if(wb_clean$country[i] == "Egypt, Arab Rep.") {
    wb_clean$country[i] <- "Egypt"
  }
  else if(wb_clean$country[i] == "Iran, Islamic Rep.") {
    wb_clean$country[i] <- "Iran"
  }
  else if(wb_clean$country[i] == "Kyrgyz Republic") {
    wb_clean$country[i] <- "Kyrgyzstan"
  }
  else if(wb_clean$country[i] == "Lao PDR") {
    wb_clean$country[i] <- "Laos"
  }
  else if(wb_clean$country[i] == "Micronesia, Fed. Sts.") {
    wb_clean$country[i] <- "Micronesia"
  }
  else if(wb_clean$country[i] == "Korea, Dem. People’s Rep.") {
    wb_clean$country[i] <- "North Korea"
  }
  else if(wb_clean$country[i] == "Russian Federation") {
    wb_clean$country[i] <- "Russia"
  }
  else if(wb_clean$country[i] == "Slovak Republic") {
    wb_clean$country[i] <- "Slovakia"
  }
  else if(wb_clean$country[i] == "Korea, Rep.") {
    wb_clean$country[i] <- "South Korea"
  }
  else if(wb_clean$country[i] == "Syrian Arab Republic") {
    wb_clean$country[i] <- "Syria"
  }
  else if(wb_clean$country[i] == "Gambia, The") {
    wb_clean$country[i] <- "The Gambia"
  }
  else if(wb_clean$country[i] == "Venezuela, RB") {
    wb_clean$country[i] <- "Venezuela"
  }
  else if(wb_clean$country[i] == "Yemen, Rep.") {
    wb_clean$country[i] <- "Yemen"
  }
}


fh_wb <- fh_clean %>%
  left_join(wb_clean, by = c("country", "year")) 




continents <- read_csv(here("data", "continents.csv"))

#Merge continents dataset
fh_wb <- continents %>%
  rename("country" = "name",
         continent = region,
         region = `sub-region`) %>%
  select(country, continent, region) %>%
  right_join(fh_wb, by = "country") 

#Create democracy score from political rights & civil liberties
fh_wb <- fh_wb %>%
  mutate(demscore = pr + cl)

#Create decades by flooring years
fh_wb <- fh_wb %>%
  mutate(decade = fh_wb$year - fh_wb$year %% 10)
fh_wb$decade <- factor(fh_wb$decade, 
                       levels = c(1970, 1980, 1990, 2000, 2010),
                       labels = c("1970-1980", "1980-1990",
                                  "1990-2000", "2000-2010", "2010-2020"))
#Factor freedom status
fh_wb$status <- factor(fh_wb$status, 
                       levels = c("F", "F (NF)", "NF", "PF"),
                       labels = c("Free", "Free (Not Free)", "Not Free", "Partly Free"))


#Remove a weird row that's labeled "Free (Not Free)", since it's not clear what this means
#FYI: This row is South Africa in 1973
fh_wb <- fh_wb %>%
  filter(is.na(status) | status != "Free (Not Free)")



#EXPORT DATA: IMPORTANT
write_csv(fh_wb, "data/fh_wb.csv")


