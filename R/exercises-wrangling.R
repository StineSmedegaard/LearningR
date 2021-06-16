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

# renamin specific columns
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
