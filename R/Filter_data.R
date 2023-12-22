get_and_process_covid_data <- function(country, selected_years, months) {

  library(dplyr)
  # Your code to download the data from the fixed URL
  url <- "https://opendata.ecdc.europa.eu/covid19/nationalcasedeath_eueea_daily_ei/csv/data.csv"
  response <- httr::GET(url)

  # Check if the request was successful
  if (httr::status_code(response) == 200) {
    # Read the CSV data directly
    raw_data <- read.csv(text = httr::content(response, "text"), stringsAsFactors = FALSE)

    # Convert "month" and "year" columns to numeric
    raw_data$month <- as.numeric(raw_data$month)
    raw_data$year <- as.numeric(as.character(raw_data$year))  # Convert factor to numeric

    # Filter the data based on parameters
    processed_data <- raw_data %>%
      filter(
        countriesAndTerritories == country,
        year %in% as.numeric(selected_years),
        month %in% as.numeric(months)
      )

    return(processed_data)
  } else {
    stop("Failed to fetch COVID-19 data.")
  }
}
