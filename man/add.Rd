% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proxies.R
\name{g_clear_p}
\alias{g_clear_p}
\alias{g_data_p}
\title{Add & Clear}
\usage{
g_clear_p(proxy)

g_data_p(proxy, data, from, to, value, ...)
}
\arguments{
\item{proxy}{A proxy as returned by \code{\link{giorProxy}}.}

\item{data}{A \code{data.frame}.}

\item{from}{Source and target of edges.}

\item{to}{Source and target of edges.}

\item{value}{Numerical value of edges.}

\item{...}{Any other columns to select from the data, i.e.: \code{inColor} or \code{outColor}}
}
\description{
Add and clear data in Shiny.
}
\examples{
if(interactive()){

  library(shiny)

  data("country_data")

  ui <- fluidPage(
    actionButton("add", "add"),
    actionButton("clear", "clear"),
    giorOutput("gior")
  )

  server <- function(input, output, session){
    output$gior <- renderGior({
      data \%>\%
        gior() \%>\%
        g_data(from, to, value)
    })

    observeEvent(input$clear, {
      giorProxy("gior") \%>\%
        g_clear_p()
    })

    observeEvent(input$add, {
      giorProxy("gior") \%>\%
        g_data_p(country_data, from, to, value)
    })
  }

  shinyApp(ui, server)

}

}
