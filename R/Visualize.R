# Function to visualize COVID-19 data
#' @param processed_data Processed COVID-19 data.
#' @return List of ggplot objects.
#' @export

visualize_covid_data <- function(processed_data) {
   library(ggplot2)

  processed_data$month <- factor(processed_data$month, levels = 1:12)

  # Create subtitle
  subtitle <- paste(paste(unique(processed_data$countriesAndTerritories), collapse = ", "),
                    " (",
                    paste(unique(processed_data$month), collapse = ", "),
                    "/",
                    unique(processed_data$year),
                    ")"
  )


  plot_cases <- ggplot(processed_data, aes(x = as.Date(dateRep, format = "%d/%m/%Y"), y = cases)) +
    geom_line() +
    labs(title = "COVID-19 Cases",
          subtitle = subtitle,
         x = "Date",
         y = "Cases")

  # Create ggplot for deaths
  plot_deaths <- ggplot(processed_data, aes(x = as.Date(dateRep, format = "%d/%m/%Y"), y = deaths)) +
    geom_line() +
    labs(title = "COVID-19 Deaths",
         subtitle = subtitle,
         x = "Date",
         y = "Deaths")

  # Return a list of ggplot objects
  return(list(cases_plot = plot_cases, deaths_plot = plot_deaths))
}
