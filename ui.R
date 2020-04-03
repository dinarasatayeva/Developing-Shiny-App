
library(shiny)
library(ggplot2)


# Define UI for application that predicts chances of survival based on user input
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Your Probability of Surviving on Titanic"),
    
    sidebarLayout(
        sidebarPanel(
            h4("Enter your information: "),
            
               # Slider Input for Passenger Age
               sliderInput("slider1", h5("Passenger's Age"),
                           min = 0, max = 80, value = 28),
        
               # Radion Button  for Passenger Sex
               radioButtons("radio1", h5("Passenger's Sex"),
                            choices = list("Male" = 0, "Female" = 1),
                            selected = 0),
               
               # Slider Input for Fare
               sliderInput("slider2", h5("Fare (in pounds)"),
                           min = 0, max = 513, value = 32),

               # Select Box for Passenger Class
               selectInput("select1", h5("Passenger Class"), 
                           choices = list("Class 1" = 1, "Class 2" = 2,
                                          "Class 3" = 3), selected = 1),
               
            # Numeric Input for N of Parents/Children Aboard  
            numericInput("num1", 
                         h5("Number of Parents/Children Aboard"), 
                         min = 0, max = 6, value = 0),
            
            # Numeric Input for N of Siblings/Spouses Aboard  
            numericInput("num2", 
                            h5("Number of Siblings/Spouses Aboard"), 
                            min = 0, max = 8, value = 0),
            
            #Calculate Predictions
            submitButton("Submit")
            ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Based on the data entered, your probability of survival is:" ),
            textOutput("pred1"),
            
            h3("Some statistics about people sruvived on Titatanic:"),
            plotOutput("plot1")
            )
        )
    )
    )

