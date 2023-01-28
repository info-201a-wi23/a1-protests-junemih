# Overview ----------------------------------------------------------------

# Assignment 1

# You will answer the following questions and more by completing the code below:

# - What were the most attended and least attended protests in the US in the last 5 years?
# - How many protests occurred in Washington state?
# - How did protests in 2019 compare to 2020, and why?
# - What are the biggest reasons people are protesting in the US?

# For each question/prompt, write the necessary code to get the answer.
# You will store most of your answers in the variable names listed with the questions in `backtics`.
# There are 4 prompts marked `Reflection`. Be sure to write your responses to these questions in the `README.md` file.

# NOTE: We recommend that you turn on "Soft Wrap Long Lines" to work with this file so you can read the instructions more easily.

# Part 1:Set up -----------------------------------------------------------

# In this section, you will load the CountLove data and necessary packages.

# (1.a) Load the `stringr` package, which you will use later. (1 point)
install.packages("stringr")
library("stringr")

# (1.b) Load the data from CountLove by using the following URL: https://countlove.org/data/data.csv
# Save this dataframe into a variable called `protest_data` (1 point)
protest_data <- read.csv("https://countlove.org/data/data.csv")

#  Whenever we load data, the first thing we want to do is manually examine it, see how it looks, and make sure we understand what each column (or feature) and each row (or record) in the dataset means.
# Open the dataframe by clicking the spreadsheet icon in the Environment or by using View(). Manually examine the data by scrolling through it.
View(protest_data)

# (1.c) Without using code, look at all the the column names in the dataset, and then type each column name in the comment below, with each column name separated by a comma. (1 point)
# Date, Location, Attendees, Event, Tags, Curated, Source, Total Articles

# (1.d) Without using code, pick one row in the dataset (any row!), and then type in all the values from that row, with each value separated by a comma. (1 point)
# For ex: 2018-01-01, University of Washington, Seattle, WA...
# 2017-03-23, Los Angeles, CA, N/A, Civil Rights (Breast feeding), Civil Rights; For breastfeeding, No, http://abc7.com/education/mothers-protest-lausds-breast-feeding-policy/1814116/, 1

# (1.e) How many protests are recorded in the dataset in total? Use an R function to determine this number and then save it in a variable called `num_protests`  (1 point)
# Hint: This is the same number as the number of rows in the dataset!
num_protests <-nrow(protest_data)
`num_protests <- 38097`

# (1.f) How many features (or columns) are recorded for each protest? It's important to know how to find this number programmatically as well as manually
# Save the number of features for each protest in a variable called `num_features` (1 point)
num_features <- ncol(protest_data)
`num_features <- 8`

## Part 2: Attendees ------------------------------------------------------
# In this part, you will explore the number of people who participated in the protests

# (2.a) Extract the `Attendees` column into a variable called `num_attendees`  (1 point)
num_attendees <- protest_data$Attendees

# (2.b) What is the fewest number of attendees at a protest?
# Save the number of protests in a variable called `min_attendees` (2 points)
# Hint: Remember to exclude NA values when using the functions below!
min_attendees <- min(num_attendees, na.rm=TRUE)
`min_attendees <- 0`

# (2.c) What is the greatest number of attendees at a protest?
# Save the number of protests in a variable called `max_attendees` (2 points)
max_attendees <- max(num_attendees, na.rm=TRUE)
`max_attendees <- 725000`

# (2.d) What is the average (mean) number of attendees at a protest?
# Save the number of protests in a variable called `mean_attendees` (2 points)
mean_attendees <- mean(num_attendees, na.rm=TRUE)
`mean_attendees <- 643.8831`

# (2.e) What is the median number of attendees?
# Save the number of protests in a variable called `median_attendees` (2 points)
median_attendees <- median(num_attendees, na.rm=TRUE)
`median_attendees <- 100`

# (2.f) What is the difference between the mean and median number of attendees? Subtract median_attendees from mean_attendees
# Save the difference in a variable called `difference_attendees` (1 point)
difference_attendees <- mean_attendees-median_attendees
`difference_attendees <- 543.8831`

# Reflection 1 (answer in the README.md file)
# Why do you think the mean is higher than the median? Which metric would you use in a report about this data, and why?
#completed

## Part 3: Locations ------------------------------------------------------
# In this part, you will explore where protests happened.

# (3.a) Extract the `Location` column into a variable called `locations` (1 point)
locations <- protest_data$Location

# (3.b) How many *unique* locations are in the dataset?
# Save the number of unique locations in a variable called `num_locations` (1 point)
length(unique(str_sub(locations)))
`num_locations <- 10037`

# (3.c) How many protests occurred in the state of Washington?
# Use a function from the stringr package to detect the letters "WA" in the Location column and filter to only keep WA locations
# Then, calculate the number of protests recorded in Washington
# Save the number of WA locations in a variable called `num_in_wa` (3 points)
length(locations[str_detect(locations, "WA")])
`num_in_wa <- 1375`

# (3.d) What proportion of protests occurred in Washington?
# Divide the number of protests in Washington by the total number of protests
# Save this proportion in a variable called `prop_in_wa` (1 point)
prop_in_wa <- (num_protests)/(num_in_wa)
`prop_in_wa <- 27.70691`

# (3.e) Now, using the same stringr function and building on the code that you've written above, write a function `count_protests_in_location()` that accepts a location and then returns (not prints) the following sentence: "There were [N] protests in [LOCATION]."
# For example: "There were 20 protests in Seattle." "There were 50 protests in NY." 
# If the location is not found in the dataset, the function should return the sentence: "Sorry, that location is not found." (6 points)
count_protests_in_location <- function(location) {
  num_locations <-sum(str_detect(locations, location))
  
  if (num_locations > 0) {
    paste0("There were ", num_locations, " protests in ", location, ".")
  }
  else {
    paste0("Sorry, that location is not found.")
  }
}
count_protests_in_location("Los Angeles")
count_protests_in_location("junemi")

# (3.f) Use your `count_protests_in_location()` function above to compute the number of protests in "Washington, DC" and return the resulting message
# Save the resulting message in a variable called `dc_summary` (1 point)
dc_summary <- count_protests_in_location("Washington, DC")
`dc_summary <- "There were 535 protests in Washington, DC."`

# (3.g) Use your function above to compute the number of protests in "Minneapolis" and return the resulting message (1 point)
# # Save the resulting message in a variable called `minneapolis_summary`
minneapolis_summary <- count_protests_in_location("Minneapolis")
`minneapolis_summary <- "There were 205 protests in Minneapolis."`

# (3.h) Let's try to find out how many protests occurred in each state. To do so, first use a stringr function to extract the last 2 characters from every location and use these 2 characters to create a new vector called `states` (3 points)
states <- str_sub(locations, start = -2)

# (3.i) How many unique states are in the dataset? Create a vector of just the unique states in the dataset
# Save the unique states in a variable called `uniq_states` (1 point)
uniq_states <- unique(str_sub(states))

# (3.j) Now apply your `count_protests_in_location` function to every state in`uniq_states` by using the `sapply()` function.
# Store all your messages in a variable called `state_summary`  (4 points)
state_summary <- sapply(uniq_states, count_protests_in_location)

## Part 4: Dates ----------------------------------------------------------
# In this part, you will explore *when* protests happened.

# (4a) Extract the `Date` column and convert it into a data by using the `as.Date()` function.
# Save this value in a variable called `dates` (2 points)
dates <- as.Date(protest_data$Date)

# (4.b) What is the most recent date in the dataset? (2 point)
# Store this value in a variable called `most_recent_protest`
most_recent_protest <- max(dates)
`most_recent_protest <- 2021-01-31`

# (4.c) What is the earliest date in the dataset? (2 point)
# Store this value in a variable called `earliest_protest`
earliest_protest <- min(dates)
`earliest_protest <- 2017-01-15`

# (4.d) What is the timespan of the dataset — in other words, the distance between the earliest protest and most recent protest? (1 point)
# Hint: R can do math with dates pretty well by default!
# Store this value in a variable called `time_span`
time_span <- difftime(most_recent_protest, earliest_protest)
`time_span <- "Time difference of 1477 days"`

# (4.e) Now, create a vector of only the dates that are in 2020.
# Note: If you want only dates after a certain start date, you can use "2020-01-01" with comparison operators (==, >=, <=)
# Store this value in a variable called `protests_in_2020` (2 points)
protests_in_2020 <- seq(as.Date("2020-01-01"), as.Date("2020-12-30"), by="days")
protests_in_2020

# (4.f) Create a vector of only the dates that are in 2019. (2 points)
# Note: If you want only dates after a certain start date, you can use "2020-01-01" with comparison operators (==, >=, <=)
# Store this value in a variable called `protests_in_2019`
protests_in_2019 <- seq(as.Date("2019-01-01"), as.Date("2019-12-30"), by="days")
protests_in_2019

# (4.f) Create a vector of only the dates that are in 2018. (2 points)
# Note: If you want only dates after a certain start date, you can use "2020-01-01" with comparison operators (==, >=, <=)
# Store this value in a variable called `protests_in_2018`
start_date <- as.Date("2020-01-01")
end_date <- as.Date("2020-12-30")
protests_in_2018 <- seq(from = start_date, to = end_date, by = "day")
protests_in_2018

# Reflection 2 (answer in the README.md file)
# When we're doing data analysis work, we always want to test our assumptions and see whether or not patterns align with our expectations or depart from them.
# Before actually calculating the number of protests that occurred in 2018, 2019, 2020, record your guesses for the following questions.
# Guess: Do you think there were more protests in 2019 than in 2018? Why or why not?
# Guess: Do you think there were more protests in 2020 than in 2019? Why or why not?
#complete

# (4.g) Now use the length() function to find out how many protests happened in 2018 vs. 2019 vs. 2020. 
# Save them in the variables `num_protests_in_2018`, `num_protests_in_2019`, `num_protests_in_20120`(3 points)
num_protests_in_2018 <- length(protests_in_2018)
num_protests_in_2019 <- length(protests_in_2019)
num_protests_in_2020 <- length(protests_in_2020)
`num_protests_in_2018 <- 8951`
`num_protests_in_2019 <- 6548`
`num_protests_in_2020 <- 15281`

# Reflection 3 (answer in the README.md file)
# Does the change in the number of protests from 2018 to 2019 to 2020 surprise you? Why or why not? What do you think explains the fluctuation?
#complete

## Part 5: Protest Purpose ------------------------------------------------
# In this section, you will explore *why* the protests happened.

# (5.a) Extract the `Event..legacy..see.tags.` column into a variable called `purposes` (1 point)
purposes <- protest_data$Event..legacy..see.tags.

# (5.b) How many different unique purposes are listed in the dataset? (1 point)
# Save this number in a variable called `num_purposes`
num_purposes <- length(unique(purposes))
'num_purposes <- 895'

# That's quite a few! Use View() to examine the `purposes` vector. You will notice a common pattern for each purpose, formatted something like this: Civil Rights (Transgender Rights)
View(num_purposes)

# (5.c) To get a summary of just the higher level categories (e.g., just "Civil Rights" and not "(Transgender Rights)"), we're going to use some R functions to extract only the text before the parenthesis and then save them in a variable `high_level_purposes` (5 points)
high_level_purposes <- gsub("\\s*\\(.*", "", purposes)
high_level_purposes

# There are some built-in R functions where you can replace text using regular expressions.
# Regular expressions are a special syntax that lets you match patterns.
# For example, see what happens when you run the code below, and use the help() function to learn more about this function
gsub("@.*", "", "melwalsh@uw.edu")
# Note: Some regular expression characters, like parenthesis, have a special meaning, so if you want to use them, you need to first "escape" them: https://uc-r.github.io/regex#metacharacters
# See what happens when you run the code below, and use the help() function to learn more about this function
 trimws(" hello ")
 

# Make a table of your `high_level_protests` by using table() and then View() it
 table(high_level_purposes)
 View(high_level_purposes)
 
 # Reflection 4 (answer in README.md file): What is the first and fourth most frequent category of protest? Do these frequencies align with your sense of the major protest movements in the U.S. in the last few years? Why or why not? (3 points)
 #complete

# Congrats! You're finished. Don't forget to save, push all changes to GitHub, and submit the link to your repository on Canvas!