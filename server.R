library(caret)
library(datasets)
data(mtcars)

inTrain<-createDataPartition(y=mtcars$mpg,p=0.75,list=FALSE)
training<-mtcars[inTrain,]

modFit<- train(mpg ~ cyl + hp + wt , method = "lm", data=training)

mpgprec <- function(cyl, hp, wt) 
{
  data <- data.frame(cyl, hp, wt)
  predict(modFit,newdata=data)
}

  
  
shinyServer(
  function(input, output) {

    cyl <- reactive({input$cylinders})
    hp <- reactive({input$horsepower})
    wt <- reactive({input$weight})
    
    output$cylinders <- renderText({cyl()})
    output$horsepower <- renderText({hp()})
    output$weight <- renderText({wt()})
    
    output$prediction <- renderText({mpgprec(cyl(),hp(),wt())})

  }
)