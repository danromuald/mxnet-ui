require(mxnet)
require(imager)
require(shiny)
require(jpeg)
require(png)

shinyUI(pageWithSidebar(
  headerPanel(title = 'MXNet Pre-Trained Model Image Classification',
              windowTitle = 'Image Classification Demo'),
  
  sidebarPanel(
    includeCSS('boot.css'),
    tabsetPanel(
      id = "tabs",
      tabPanel("Upload Image",
               fileInput('file1', 'Upload a PNG / JPEG File:')),
      tabPanel(
        "Use the URL",
        textInput("url", "Image URL:", "http://"),
        actionButton("goButton", "Submit")
      )
    )
  ),
  
  mainPanel(
    h3("Image"),
    tags$hr(),
    imageOutput("originImage", height = "auto"),
    tags$hr(),
    h3("Classes Observed (ordered by confidence level)"),
    tags$hr(),
    verbatimTextOutput("res")
  )
))
