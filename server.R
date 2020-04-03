

library(shiny)
library(ggplot2)
library(ggpubr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    training<-read.csv("titanic.csv")
    
    levels(training$sex) <- c(1,0)
    
    fit<-glm(survived ~ pclass + sex + age + sib_sp + par_ch + fare, data = training, family = "binomial")
    
    pred<-reactive({
    
        pclass_input<-as.integer(input$select1)
        sex_input<-as.factor(input$radio1)
        age_input<-input$slider1
        sib_sp_input<-input$num2
        par_ch_input<-input$num1
        fare_input<-input$slider2
        
        predict(fit, newdata = data.frame(pclass = pclass_input, 
                                          sex = sex_input,
                                          age = age_input,
                                          sib_sp = sib_sp_input,
                                          par_ch = par_ch_input,
                                          fare = fare_input),
                type ="response"
                )
        
    })


    output$plot1 <- renderPlot({
       p1<-ggplot(training, aes(x = sex, fill= as.factor(survived))) +
            geom_bar() + scale_fill_discrete(name = "Survived(1) or not(0)") + 
            xlab("Sex: Male(0) or Female(1)")
       p2<-ggplot(training, aes(x = pclass, fill= as.factor(survived))) +
           geom_bar() + scale_fill_discrete(name = "Survived(1) or not(0)") +
           xlab("Passenger Class")
       
       ggarrange(p1, p2, ncol = 2)
    })
    
    output$pred1 <- renderText({
        pred()
    })

})
