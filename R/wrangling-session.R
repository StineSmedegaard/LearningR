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
# getting familiar with the dataset

# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#view the new data frame
nhanes_small

## renaming
# rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

nhanes_small

# renamin specific columns (new = old)
rename(nhanes_small, sex = gender)

nhanes_small

# to save the change from gender to sex in the data frame it should be renamed with <-
nhanes_small <- rename(nhanes_small, sex = gender)

## the pipe operator

# without the pipe operator
colnames(nhanes_small)

# Ctr + shift + m --> pipefunction. Should ber read "then"
nhanes_small %>% colnames()

# using the pipe operator with more functions
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

# exercise 9.9
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)
nhanes_small %>%
    select(diabetes_age) %>%
    rename(diabetes_diagnosis_age = diabetes_age)
nhanes_small %>%
    select(bmi, contains("age"))
nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)
#old code:
physical_activity <- select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)

## filtering
# select filter for all females
nhanes_small %>%
    filter(sex == "female")
nhanes_small %>%
    filter(sex != "female")
# participants with bmi > or = 25
nhanes_small %>%
    filter(bmi >= 25)
# BMI is greater than 25 and sex = female
nhanes_small %>%
    filter(bmi > 25 & sex == "female")
nhanes_small %>%
    filter(bmi > 25 & bmi < 30)
# bmi is greater than 25 or sex = female
nhanes_small %>%
    filter(bmi > 25 | sex == "female")
## arranging data
# arrange by age in ascending order
nhanes_small %>%
    arrange(age)
# arrange by sex in ascending order (alfabetically)
nhanes_small %>%
    arrange(sex)
# arrange by sex in descending order
nhanes_small %>%
    arrange(desc(age))
# arranging by sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)
nhanes_small %>%
    arrange(desc(sex), age)
## transform or add columns
# tranform from cm to m
nhanes_small %>%
    mutate(height = height / 100)
# log transform and add an extra column. Write the new name of the column first and then what it should be ex log(height)
nhanes_small %>%
    mutate(logged_height = log(height))
# do both at the same time
nhanes_small %>%
    mutate(height = height / 100, logged_height = log(height))
# add a column called "highly active"
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))
#create new data frame with new edition
nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))
str(nhanes_update)

# save the selected columns as a new data frame
nhanes_small <- select(NHANES, Age, Gender, Height, Weight, BMI, Diabetes, DiabetesAge, PhysActiveDays, PhysActive, TotChol, BPSysAve, BPDiaAve, SmokeNow, Poverty)

# summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi))
# Use .rm = TRUE to remove something
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))
# how to see if anything is missing
nhanes_small %>%
    summarise(sum_na = sum(is.na(bmi)))
# calculating 2 summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))
