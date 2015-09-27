shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel('Automobile mpg Prediction'),
    sidebarPanel(
      h4('Please enter the information about the automobile here:'),
      numericInput('cylinders', 'Number of Cylinders', 4, min = 2, max = 20, step = 1),
      numericInput('horsepower', 'Gross Horsepower', 100, min = 0, max = 1000, step = 1),
      numericInput('weight', 'Weight (lb/1000)', 1.000, min = 0, max = 20.000, step = .001),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered:'),

      h5('Number of Cylinders:'),
        verbatimTextOutput("cylinders"),

      h5('Gross Horsepower'),
        verbatimTextOutput("horsepower"),

      h5('Weight (lb/1000)'),
        verbatimTextOutput("weight"),      
      
      h4('Which resulted in a prediction in mpg'),
        verbatimTextOutput("prediction"),

      h5('Please note that is prediction function uses the mtcars R dataset.'),
      h5('Due to the relatively small size of the data set, the output could vary.'),
      h5('In a real world model, a larger dataset would be required.')
      )
  )
)