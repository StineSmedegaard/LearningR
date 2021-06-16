# load up the packages
source(here::here("R/package-loading.R"))

# briefly glimpse content of dataset
glimpse(NHANES)

# getting familiar with the dataset
usethis::use_r("exercises-wrangling")

# select one column by its name
select(NHANES, Age)

# select more columns
select(NHANES, Age, Weight, BMI)

# exclude a column
select(NHANES, -HeadCirc)

# select all columns starting with "BP"
select(NHANES, starts_with("BP"))

# select all columns ending with "Day"
select(NHANES, ends_with("Day"))

# all columns containing "Age"
select(NHANES, contains("Age"))

?select_helpers

# save the selected columns as a new data frame
nhanes_small <- select(NHANES, Age, Gender, Height, Weight, BMI, Diabetes, DiabetesAge, PhysActiveDays, PhysActive, TotChol, BPSysAve, BPDiaAve, SmokeNow, Poverty)
