library(tidyverse)

# This is where we will download the 2019 bridge data from.
bridgeURL = "https://www.fhwa.dot.gov/bridge/nbi/2019hwybronefiledel.zip"

# Create a temporary file for download.
temp <- tempfile()
download.file(bridgeURL, temp)

# Unzip the file.
unz(temp,"2019HwyBridgesDelimitedAllStates.txt")

# Read the data into the table structure. Only enter the columns for structure number,
# year built, condition, and deck area.
rawData <- read_csv("2019HwyBridgesDelimitedAllStates.txt", 
                    col_types = cols(.default = col_skip(),
                                     STRUCTURE_NUMBER_008 = col_character(),
                                     YEAR_BUILT_027 = col_integer(),
                                     BRIDGE_CONDITION = col_character(),
                                     DECK_AREA = col_double()))

# Clean up temp file
unlink(temp)