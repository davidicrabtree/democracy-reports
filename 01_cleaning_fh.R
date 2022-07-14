library(tidyverse)
library(tidyr)
library(readxl)
library(here)


fh <- read_excel(here("data", "FreedomHouse.xlsx"), 
                 sheet = 2, # read in data from the second sheet
                 na = "-", # recode "-" to missing
                 skip = 1) 



names(fh)[1] <- "country"


fh_clean <- fh %>%
  filter(!is.na(country)) %>%
  pivot_longer(cols = 2:148,
               names_to = "RateType",
               values_to = "Score")


#Note the pattern: The variables repeat every fourth column as follows
# PR, CL, Status, PR, CL, Status, PR, CL, Status
# Also note that the year is currently where PR should be, and year also advances every fourth column
fh_clean

#We can use seq() to mimic this sequence.
seq(from = 2, to = 30135, by = 3) #Note that this is the sequence for the CL variable.

#Thus, we can access each variable's proper location in the dataframe with [] and seq().
fh_clean$RateType[seq(from = 1, to = 30135, by = 3)] = "pr"

fh_clean$RateType[seq(from = 2, to = 30135, by = 3)] = "cl"

fh_clean$RateType[seq(from = 3, to = 30135, by = 3)] = "status"


#Repeat the years from 1973-2021 205 times, with each country having the same year three times
#This will set it up to pivot back to wide format. 
fh_clean <- fh_clean %>%
  mutate(year = rep(seq(from = 1973, to = 2021, by = 1), times = 205, each = 3))

#Clean up dataframe
fh_clean <- fh_clean %>%
  pivot_wider(names_from = "RateType",
              values_from = "Score")

unique(fh_clean$country)


#Final result: A dataframe where each cell is an observation for a given country in a given year on a given metric. 
#Each variable in its own column, each observation in its own row, each measurement in its own cell.



#Reverse coding so low score = low dem rating
#Must do for both political rights and civil liberties

fh_clean$pr <- as.numeric(fh_clean$pr)
fh_clean$cl <- as.numeric(fh_clean$cl)

for (i in seq_along(fh_clean$pr)) {
  switch(fh_clean$pr[i],
         fh_clean$pr[i] <- 7,
         fh_clean$pr[i] <- 6,
         fh_clean$pr[i] <- 5,
         fh_clean$pr[i] <- 4,
         fh_clean$pr[i] <- 3,
         fh_clean$pr[i] <- 2,
         fh_clean$pr[i] <- 1)
}

for (i in seq_along(fh_clean$cl)) {
  switch(fh_clean$cl[i],
         fh_clean$cl[i] <- 7,
         fh_clean$cl[i] <- 6,
         fh_clean$cl[i] <- 5,
         fh_clean$cl[i] <- 4,
         fh_clean$cl[i] <- 3,
         fh_clean$cl[i] <- 2,
         fh_clean$cl[i] <- 1)
}

