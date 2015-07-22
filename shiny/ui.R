library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Eye for an Eye: Generosity Prediction"),
	sidebarPanel (
	  p ("In an experiment conducted by Suffolk University researchers, profile pictures of certain social network users were anonymously and randomly graded on the scale from 1 to 5+."),	  
    p ("In response, some users visited the researcher avatar's profile and graded the avatar's profile picture using the same scale."),
    p ("The generosity (the original grade minus the response grade) depends on the user's age and gender."),
    p ("You can use this app to predict the expected generosity based on the user demographics."),
		h2 ("Enter data"),
    sliderInput ("age", "Age", value=32,min=18,max=65,step=1),
		radioButtons("gender",'Gender', 
			c("Male" = "M","Female" = "F"), inline=TRUE)
#    actionButton ("goButton", "Go!")
	),
	mainPanel (
		h2("Prediction Results"),
		p('You entered age and gender:'),
		verbatimTextOutput("inputDemographics"),
		h3("Predicted generosity:"),
		verbatimTextOutput("prediction"),
    p(textOutput("message")),
    plotOutput ("newHist")
	)
))
