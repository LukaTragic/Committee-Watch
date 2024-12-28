library(httr)
library(jsonlite)
library(dotenv)
load_dot_env(file = ".env")

API_KEY <- Sys.getenv("API_KEY")

fetch_congress_data <- function(endpoint) {
  base_url = "https://api.congress.gov/v3"
  response <- GET(
    url = paste0(base_url, endpoint),
    query = list(api_key = API_KEY)
  )
  
  if (status_code(response) == 200){
    return(fromJSON(rawToChar(response$content)))
  } else {
    stop(paste("API request failed with status: ", status_code((response))))
  }
}