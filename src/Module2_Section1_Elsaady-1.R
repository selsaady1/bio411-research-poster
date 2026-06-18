# Assignment for Module 2 - Section 1
# Saif Elsaady

# Question 1 - Find current working directory
getwd()

# Yields [1] "C:/Users/Saifs"

# Question 2 - Load the data sets package and check version
library(datasets)  # Load the package
packageVersion("datasets")

# Yields [1] ‘4.2.2’

# Question 3 - Load CO2 data set and analyze it
data(CO2)  # Load the CO2 data set

# Find the number of observations in the data set
nrow(CO2)
# The data set has 84 observations.

# Filter for observations from Mississippi and count them
sum(CO2$Type == "Mississippi")
# There are 42 observations from Mississippi.

# Question 4 - Basic calculations
23 * 76  # 23 times 76
87 - 48  # 87 minus 48
124 / 97 # 124 divided by 97
4837 + 302 # 4837 plus 302

# Question 5 - Calculating seconds in the fall semester
# Step 1: Define constants for time calculations
one_minute <- 60  # 60 seconds in a minute
one_hour <- one_minute * 60  # 60 minutes in an hour
one_day <- one_hour * 24  # 24 hours in a day

# Step 2: Define semester-specific calculations
one_week <- one_day * 7  # Total seconds in a week
one_week_weekdays_only <- one_day * 5  # Total seconds in weekdays of one week

# Step 3: Calculate total weekdays in the semester
weekdays_in_semester <- 16 * 5  # 16 weeks, 5 weekdays per week

# Step 4: Adjust for holidays
holidays_in_semester <- 6 + 3  # 6 holidays + 3 days off in the first week
semester_minus_holidays <- weekdays_in_semester - holidays_in_semester

# Step 5: Calculate total seconds in the semester
total_seconds_in_semester <- semester_minus_holidays * one_day
total_seconds_in_semester  # Output total seconds in the semester
# There are X seconds in the fall semester (after accounting for holidays).


# Question 6 - Analysis of Urban Raptor Nest Survey Data

# Load necessary libraries
library(dplyr)  # For data manipulation
library(readr)

# Part 1: Load the CSV file into R
file_path <- "C:/Users/Saifs/Downloads/188_nest_sites_2006_1.csv"  # Define the file path
nest_data <- read.csv(file_path)  # Load the data using base R
# Dataset successfully loaded.

# Part 2: How many columns and rows does it have?
n_rows <- nrow(nest_data)  # Number of rows
n_cols <- ncol(nest_data)  # Number of columns
n_rows  # Print the number of rows
n_cols  # Print the number of columns
# The dataset has 50 rows and 16 columns.

# Part 3: How many nests were found on utility poles?
# Count rows where the structure_type column equals "Utility Pole"
utility_pole_nests <- sum(trimws(tolower(nest_data$structure_type)) == "utility pole", na.rm = TRUE)
utility_pole_nests  # Print the number of utility pole nests
# Output: 12

# Verify the rows that match "Utility Pole"
utility_pole_rows <- nest_data %>% filter(trimws(tolower(structure_type)) == "utility pole")


# The number of nests found on utility poles is calculated.

# Part 4: What was the mean nest height? (Include units)
mean_nest_height <- mean(nest_data$nest_height, na.rm = TRUE)  # Calculate mean height
mean_nest_height  # Print the mean nest height
# The mean nest height is 15.72 meters.

# Part 5: What data type is the column `nesting_stage`? Suggest an alternative.
nesting_stage_type <- class(nest_data$nesting_stage)  # Check the data type
nesting_stage_type  # Print the current data type
# The current data type of nesting_stage is "character".
# The nesting_stage column is currently of type character, which represents text data. This works, but it's not the most efficient or suitable for categorical analysis.
#Changing nesting_stage to a factor would be ideal. Factors are designed for categorical data and allow better analysis, such as grouping and frequency counts.

# Specify the Downloads directory path
downloads_dir <- file.path("C:/Users", Sys.getenv("USERNAME"), "Downloads")

# Specify the script file and output file paths
script_file <- file.path(downloads_dir, "Module2_Section1_Elsaady.R")
output_file <- file.path(downloads_dir, "Module2_Section1_Elsaady_Output.txt")

# Check if the script file exists
if (!file.exists(script_file)) { stop("The script file does not exist at the specified path: ", script_file)}

# Save console output to the output file
sink(output_file, split = TRUE)  # Redirect output to file and also print to console

# Run each line of the script explicitly
cat("Running script:", script_file, "\n\n")

tryCatch({
  # Read the script file as text
  script_lines <- readLines(script_file)
  
  # Execute each line of the script
  for (line in script_lines) {
    cat("> ", line, "\n")  # Print the line being executed
    eval(parse(text = line))  # Execute the line
  }
  
  cat("\n\nScript execution completed successfully.\n")
}, error = function(e) {
  # Handle errors and print them
  cat("\n\nAn error occurred while running the script:\n")
  cat(conditionMessage(e), "\n")
}, finally = {
  # Stop redirecting output
  sink()
})

# Confirmation message
cat("The output has been saved to:", output_file, "\n")

