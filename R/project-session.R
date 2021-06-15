source(here::here("R/package-loading.R")) #source kan bruges til fx cleaning scripts

#source øverst til højre kører hele scriptet

#here:here går tilbage i filen. Fx øverste linje leder i "learning R" der er basis folder

# Basics of R -------------------------------------------------------------


weight_kilos <- 100 <- betyder at weight_kilos er 100
weight_kilos

c("a", "b", "c") c betyder put these together
c(TRUE, FALSE)
c(1, 2, 4)
factor(c("high", "medium", "low")) R lister dem alfabetisk

head(CO2, 10)
colnames(CO2) betyder column names
str(CO2) betyder str=structure
summary(CO2)

# Object names
day_one
T <- FALSE #T betyder true
c <- 9 #c betyder combine

# Spacing
x[, 1]
x[, 1]
mean(x, na.rm = TRUE)
mean(x, na.rm = TRUE )
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("y is negative")
}

# Object names
DayOne
T <- FALSE
c <- 9

# Spacing
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
}

#Ctr + shift + a "rydder op" så der kommer de rigtige mellemrum osv
styler::style_file() "rydder op" så der kommer de rigtige mellemrum osv

