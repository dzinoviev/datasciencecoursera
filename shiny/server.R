# All this code is executed once.
library(shiny)

d <- read.table ("data.tsv", na.strings = '-', header = TRUE)
d <- d[complete.cases (d), ]
d$generosity <- d$OGrade - d$IGrade
model <<- glm (generosity ~ Age + Gender, data = d)

shinyServer(
	function(input,output) {
    # The render* functions are reactive - executed when inputs change
    output$inputDemographics <- renderPrint ({c (input$age,
                                                input$gender)})
    generosity <- reactive ({as.numeric (predict (model, 
          data.frame (Age = as.numeric (input$age), 
                      Gender = input$gender)))})
    output$prediction <- renderPrint (generosity ())
    
    output$newHist <- renderPlot ({
      hist (d$generosity, 
            xlab = 'Generosity',
            col = 'lightgreen',
            main = 'Actual Distribution vs Prediction')
      lines (c (generosity (), generosity ()), c (0, 250), col  ='red', 
             lwd = 4)
    })
    output$message <- renderText ({ifelse (generosity () < 0,
      "The user is expected to give the researcher's avatar a worse grade.",
      "The user is expected to give the researcher's avatar a better grade.")})
	}
)
