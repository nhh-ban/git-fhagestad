# Problem 2
# - - - - - - - - - - - - - - - - - - - - - 
library(tidyverse)   

# Reading the text file
raw_file <- readLines(con = "suites_dw_Table1.txt")

substr(x = raw_file, start = 2, stop = 3)

L <- 
  (substr(x = raw_file, start = 2, stop = 3) == "--") 

cat(raw_file[1:(L-2)], sep = "\n", file = "variable_descriptions")
variable_descriptions <- read_lines("variable_descriptions")

variable_names <- 
  str_split(string = variable_descriptions, pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

comma_separated_values <- 
  raw_file[3:796] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

cat(comma_separated_values_with_names, sep = "\n", file = "Galaxy")

galaxies <- read_csv("Galaxy")

# Problem 3

# Create a histogram 
hist(galaxies$size, breaks = 10, main = "Distribution",
     xlab = "Galaxy Size", ylab = "Frequency")

# The problems are now solved










