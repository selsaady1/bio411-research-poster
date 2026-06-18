# Saif Elsaady
# Date: 1/26/2024

# File Setup --------------------------------------------------------------
# Load necessary libraries
library(tidyverse)  # For data manipulation and visualization
library(tidylog)    # Provides logs for tidyverse functions

# Question 1 --------------------------------------------------------------
# Load the dataset into R
downloads_dir <- file.path("C:/Users", Sys.getenv("USERNAME"), "Downloads")
file_path <- file.path(downloads_dir, "LawnQuadrats_PHX_2017.csv")

# Read the data set into R
lawn_cover <- read_csv(file_path)  # Load data set into a dataframe called lawn_cover

# Verify the dataset structure
glimpse(lawn_cover)  # Check the structure and types of columns
# This dataset contains plant data from different yard types with details like species names and cover classes.

# Analyze Bermuda grass coverage ------------------------------------------
# What is the overall goal?
# The goal is to create a new dataframe showing the average cover class 
# and the number of quadrats containing Bermuda grass (Cynodon dactylon) by site type.

# Step-by-step explanation of the provided code
cynodon <- lawn_cover %>% filter(species_name_cover == "Cynodon dactylon") %>% group_by(site_type) %>% summarise(avg_cover = mean(cover_class, na.rm = TRUE), number_quadrats = n()) %>% ungroup() %>% arrange(-avg_cover)

#cynodon <- lawn_cover %>%
  # Step 1: Filter rows for Bermuda grass only
#  filter(species_name_cover == "Cynodon dactylon") %>%
  
  # Step 2: Group by site type to analyze data separately for each yard type
 # group_by(site_type) %>%
  
  # Step 3: Calculate two things for each site type:
  #  - avg_cover: Average cover class of Bermuda grass
  #  - number_quadrants: Number of quadrants where Bermuda grass was found
#  summarise(avg_cover = mean(cover_class, na.rm = TRUE),  # Calculate average cover class
   #         number_quadrats = n()) %>%                  # Count number of quadrats
  
  # Step 4: Data to remove grouping after calculations
 # ungroup() %>%
  
  # Step 5: Arrange the site types by descending order of average cover class
 # arrange(-avg_cover)

# View the resulting dataframe
print(cynodon)
# High intensity lawn has the highest average cover class: 6.17.

# Question 2 - Average Plant Abundance Analysis ----------------------------------

# Step 1: Create the dataframe
# Calculate the average cover and the number of quadrats for each species
#average_plant_abundance <- lawn_cover %>%
 # group_by(species_name_cover) %>%  # Group data by species name
 # summarise(
  #  avg_cover = mean(cover_class, na.rm = TRUE),  # Calculate the average cover class
   # number_quadrats = n()  # Count the number of quadrats where species appear
  #) %>%
#  arrange(-avg_cover)  # Sort by descending order of average cover

average_plant_abundance <- lawn_cover %>% group_by(species_name_cover) %>%  summarise(avg_cover = mean(cover_class, na.rm = TRUE),  number_quadrats = n()  ) %>% arrange(-avg_cover)  

# View the dataframe
print(average_plant_abundance)

# Step 2: How many species are there?
# Count the number of unique species
total_species <- n_distinct(average_plant_abundance$species_name_cover)
cat("Total number of species:", total_species, "\n")

# Step 3: How many species are considered "unknown"?
# Count missing species names (NA values)
missing_species_count <- sum(is.na(lawn_cover$species_name_cover))

# Count explicitly labeled "unknown" species
unknown_species_count <- sum(tolower(trimws(lawn_cover$species_name_cover)) == "unknown",na.rm = TRUE)

# Total number of unknown species
total_unknowns <- missing_species_count + unknown_species_count
cat("Number of species considered unknowns:", total_unknowns, "\n")

# Step 4: Which species has the highest average cover?
# Extract the species with the highest average cover
highest_avg_cover_species <- average_plant_abundance %>% slice_max(avg_cover, n = 1)

# Print the species with the highest average cover
print(highest_avg_cover_species)

# Common name for the species with the highest cover 
cat("Common name for the species with the highest average cover is: Orange tree (Citrus sinensis)\n")



# Question 3 (10 pts) - Precipitation Data Analysis ----------------------------------
library(janitor)
# Step 1: Load the dataset (1 pt)
# Define the file path for the dataset
downloads_dir <- file.path("C:/Users", Sys.getenv("USERNAME"), "Downloads")
file_path <- file.path(downloads_dir, "FloodControlDistrict_ASUSouth_Precipitation2010_2018.csv")

# Load the precipitation data
precipitation_data <- read_csv(file_path)

# Step 2: Analyze column names
# Look at column names in the dataset
cat("Original column names:\n")
print(colnames(precipitation_data))
# Observation: The column names include spaces and special characters, which may cause issues in R.

# Step 3: Rename the `Station ID` column to `station_id` 
precipitation_data <- precipitation_data %>% rename(station_id = `Station ID`)

# Verify the column name change
cat("Column names after renaming `Station ID`:\n")
print(colnames(precipitation_data))

# Step 4: Use `clean_names()` to standardize column names 
# Clean all column names to screaming snake case
precipitation_data <- precipitation_data %>% clean_names(case = "screaming_snake")

# Verify the cleaned column names
cat("Column names after cleaning with `clean_names()`:\n")
print(colnames(precipitation_data))

# Step 5: Create a new column with rainfall in centimeters 
# Conversion: 1 inch = 2.54 cm
precipitation_data <- precipitation_data %>% mutate(PRECIPITATION_CM = PRECIPITATION_IN * 2.54)

# Verify the new column
cat("Preview of data with the new column `PRECIPITATION_CM`:\n")
print(head(precipitation_data))

# Step 6: Count the number of missing precipitation values 
# Count the rows where `PRECIPITATION_IN` is NA
missing_values_count <- sum(is.na(precipitation_data$PRECIPITATION_IN))
cat("Number of days with missing precipitation values:", missing_values_count, "\n")

# Step 7: Filter data for 2018 precipitation values 
# Using a pipe (%>%)
precipitation_2018_pipe <- precipitation_data %>% filter(YEAR == 2018)

#  Without using a pipe
precipitation_2018_no_pipe <- precipitation_data[precipitation_data$YEAR == 2018, ]


# Verify the filtered data
cat("Preview of 2018 data (pipe version):\n")
print(head(precipitation_2018_pipe))

# Step 8: Calculate total precipitation by year and find the wettest year (3 pts)
# Group by year and calculate total precipitation
annual_precipitation <- precipitation_data %>% group_by(YEAR) %>% summarise( TOTAL_PRECIPITATION_CM = sum(PRECIPITATION_CM, na.rm = TRUE))  %>% arrange(-TOTAL_PRECIPITATION_CM)  # Sort by total precipitation

# Identify the wettest year
wettest_year <- annual_precipitation %>% slice_max(TOTAL_PRECIPITATION_CM, n = 1)

# Print the results
cat("Annual precipitation totals (in cm):\n")
print(annual_precipitation)

cat("The wettest year on ASU campus:\n")
print(wettest_year)



### SAVING -----------------------------------------------------------------------------------
# Specify the Downloads directory path
downloads_dir <- file.path("C:/Users", Sys.getenv("USERNAME"), "Downloads")

# Define the paths for the R script and the output text file
script_file <- file.path(downloads_dir, "Module2_Section 2_Elsaady.R")
output_file <- file.path(downloads_dir, "Module2_Section_2_Elsaady_Output.txt")

# Check if the R script exists in the specified path
if (!file.exists(script_file)) {
  stop("The script file does not exist at the specified path: ", script_file)
}

# Redirect console output to the output text file
sink(output_file, split = TRUE)  # Split: output to both console and text file

# Execute the entire script line by line and save the output
tryCatch({
  cat("Running script:", script_file, "\n\n")
  
  # Read the script file as text
  script_lines <- readLines(script_file)
  
  # Execute each line of the script
  for (line in script_lines) {
    cat("> ", line, "\n")  # Print the line being executed
    eval(parse(text = line))  # Execute the line of code
  }
  
  cat("\n\nScript execution completed successfully.\n")
}, error = function(e) {
  # Handle errors and print them to the output file
  cat("\n\nAn error occurred while running the script:\n")
  cat(conditionMessage(e), "\n")
}, finally = {
  # Stop redirecting output after the script execution
  sink()
})

# Confirmation message after execution
cat("The output has been saved to:", output_file, "\n")

