#' Plot COVID-19 data for a given country and time period
#'
#' @param country The country or countries for which to plot the data.
#' @param year The year for which to plot the data.
#' @param months The months for which to plot the data.
#' @return List of ggplot objects.
#' @export
plot_covid <- function(country, year, months) {
  # Download and process COVID-19 data
  processed_data <- get_and_process_covid_data(country = country, selected_years = year, months = months)

  # Visualize the processed data
  plots <- visualize_covid_data(processed_data)

  # Return a list of ggplot objects
  return(plots)
}
