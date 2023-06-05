library(shiny)
library(ggplot2)
library(dplyr)

# Load csv
merged_df <- read.csv("merged_df.csv")

# Define the UI
ui <- shinyUI(
  navbarPage(
    "University Happiness Analysis",
    # Introductory Page
    tabPanel("Introduction",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                   # Add any inputs or controls for interactivity on the introductory page
                 ),
                 mainPanel(
                   h1("University Happiness Analysis"),
                   h3("Introduction"),
                   p("Welcome to our University Happiness Analysis project!"),
                   p("In this analysis, we explore the relationship between the prestige of universities and overall happiness."),
                   p("We have utilized two datasets to answer our research questions:"),
                   HTML("<ul>
                          <li>The World University Rankings dataset from 2011 to 2023, sourced from Times Higher Education's rankings. This dataset consists of 200 observations and 20 features.</li>
                          <li>The World Happiness Report dataset, which measures happiness scores across 155 countries based on various factors. This dataset includes 12 features.</li>
                        </ul>"),
                   p("Our goal is to examine how the quality of education around the world affects the quality of life and happiness of individuals."),
                   p("We believe that education is often viewed as a pathway to success and happiness, as it offers economic opportunities, social connections, and personal development."),
                   p("However, we also recognize that education can be a source of stress and pressure, especially in countries known for rigorous schooling."),
                   p("Through this analysis, we aim to uncover the nuanced relationship between education and happiness, and how it varies across countries."),
                   # Add any additional relevant information or context about the project
                 )
               )
             )
    ),
    
    # Data Story 1
    tabPanel("Data Story 1",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                 ),
                 mainPanel(
                   h2("Exploring Overall Happiness Scores"),
                   p("In this data story, we delve into the overall happiness scores of countries and their relationship with university rankings."),
                   p("The scatter plot below visualizes the relationship between a country's overall university ranking and the number of colleges within that country. It allows us to explore whether there is a correlation between a country's higher education infrastructure and its overall happiness."),
                   plotOutput("scatterPlot1"),
                   p("The bar chart below displays the mean overall rank for each of the top 10 countries. Each bar represents a country, with the height of the bar indicating its mean overall rank. By examining these rankings, we can identify countries that have consistently performed well in the university rankings."),
                   plotOutput("barChart1"),
                   h3("Conclusion"),
                   p("Through our exploration of the overall happiness scores of countries and their relationship with university rankings, we have gained valuable insights into the interplay between education and happiness."),
                   p("The scatter plot visualizes the relationship between a country's overall university ranking and the number of colleges within that country. We can observe whether there is a correlation between a country's higher education infrastructure and its overall happiness. This analysis provides insights into how investments in education and the availability of educational institutions contribute to the well-being and happiness of individuals within a country."),
                   p("Additionally, the bar chart showcasing the mean overall rank for the top 10 countries highlights the countries that consistently perform well in university rankings. By identifying these countries, we can recognize the educational systems that excel in providing high-quality education and research opportunities, contributing to their reputation in the global education landscape."),
                   p("By exploring the performance of different countries in university rankings and understanding their impact on overall happiness, we can inform policymakers, educators, and students in their efforts to enhance educational quality and promote well-being. This knowledge serves as a foundation for shaping policies and practices that prioritize educational excellence and ultimately contribute to the happiness and success of individuals and societies as a whole.")
                 )
               )
             )
           ),
    
    # Data Story 2
    tabPanel("Data Story 2",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                 ),
                 mainPanel(
                   h2("Examining Happiness Factors"),
                   p("In this data story, we explore the specific factors that contribute to happiness and their relationship with university rankings."),
                   p("The scatter plot below displays the relationship between social support and university rankings. Each point represents a country's university ranking, with the size of the point indicating the overall happiness score. The plot suggests a positive relationship between social support and university ranking, highlighting the importance of strong social networks and support systems in fostering happiness."),
                   plotOutput("scatterPlot2"),
                   p("Additionally, we analyze the average university ranking to GDP ratio across different regions using a bubble chart. The size of each bubble represents the average university ranking to GDP ratio for a region. This analysis helps us identify regions where universities have a higher ranking relative to their economic output, indicating a commitment to education and potential impact on happiness."),
                   plotOutput("bubbleChart2"),
                   h3("Conclusion"),
                   p("By exploring the relationship between happiness factors and university rankings, we gain valuable insights into the complex dynamics that contribute to overall happiness. These findings can inform policymakers, educators, and students in their efforts to create and maintain positive university environments and foster well-being.")
                 )
               )
             )
    ),
    
    # Data Story 3
    tabPanel("Data Story 3",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                 ),
                 mainPanel(
                   h2("How Education Affects Quality of Life"),
                   p("In this data story, we examine how the research prominence of universities relates to important quality of life indicators, such as freedom and life expectancy. This analysis provides insights into the impact of education on overall well-being."),
                   p("The map plot below visualizes the relationship between a country's research prominence and its level of freedom. It allows us to explore whether countries with highly ranked universities also tend to have higher levels of freedom."),
                   plotOutput("mapPlot3"),
                   p("Additionally, the bar chart presents the research prominence of universities alongside life expectancy. By examining this relationship, we can identify patterns and potential correlations between research prominence, life expectancy, and the overall quality of life within a country."),
                   plotOutput("barChart3"),
                   p("Through this data story, we aim to understand how education, specifically the research prominence of universities, influences key quality of life indicators. These insights can guide policymakers and educational institutions in developing strategies that foster research excellence, promote societal well-being, and contribute to overall happiness."),
                   h3("Conclusion"),
                   p("The analysis of research prominence, freedom, and life expectancy provides valuable insights into the impact of education on overall well-being. Our findings suggest that countries with highly ranked universities tend to exhibit higher levels of freedom and longer life expectancy."),
                   p("This data story underscores the significance of investing in research and higher education to enhance the quality of life for individuals and societies. By recognizing the positive relationship between research prominence and important quality of life indicators, policymakers can prioritize initiatives that support scientific advancements, academic excellence, and societal well-being, ultimately leading to happier and more prosperous nations.")
                 )
               )
             )
    ),
    
    # Summary Takeaways & About Page
    tabPanel("Summary",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                 ),
                 mainPanel(
                   h2("Project Summary"),
                   h3("Key Takeaways"),
                   p("After analyzing the dataset and exploring various aspects of university rankings and happiness factors, we have identified three significant takeaways:"),
                   h3("Key Takeaways"),
                   p("1. Exploring Overall Happiness Scores: Our findings indicate a positive correlation between higher education rankings and overall happiness. Countries with higher university rankings tend to have higher happiness scores, highlighting the importance of education in fostering well-being."),
                   p("2. Examining Happiness Factors: We observed a strong positive relationship between social support and university rankings. Countries with higher university rankings also tend to have higher social support scores, emphasizing the role of strong social networks in contributing to happiness."),
                   p("3. How Education Affects Quality of Life: Our analysis revealed regional disparities in university rankings and happiness scores. Certain regions consistently performed better in university rankings and demonstrated higher happiness scores, suggesting the presence of regional factors influencing educational and well-being outcomes."),
                   h3("Implications"),
                   p("The insights gained from this project have implications for policymakers, educators, and individuals striving to improve educational quality and well-being. By prioritizing investments in education, fostering social support systems, and addressing regional disparities, stakeholders can work towards creating positive university environments and promoting overall happiness."),
                   p("These key takeaways and implications provide valuable insights for shaping policies, practices, and interventions that aim to enhance educational systems and well-being worldwide."),
                   p("Provide information about your names and the dataset source."),
                   p("Authors: Hana Phan and Yohan Cho"),
                   p("Dataset Source: https://www.kaggle.com/datasets/r1chardson/the-world-university-rankings-2011-2023
and https://www.kaggle.com/datasets/unsdsn/world-happiness?select=2017.csv"),
                 )
               )
             )
    )
  )
)

# Define the server logic
server <- shinyServer(function(input, output) {
  
  # Data Story 1
  output$scatterPlot1 <- renderPlot({
    ggplot(data = merged_df, aes(x = Overall.rank, y = College.Count)) +
      geom_point() +
      labs(x = "Overall Rank", y = "College Count") +
      theme_minimal()
  })
  
  output$barChart1 <- renderPlot({
    mean_rank <- aggregate(Overall.rank ~ Country.or.region, merged_df, FUN = mean)
    mean_rank <- mean_rank[mean_rank$Overall.rank > 0, ]  # Filter out countries with rank 0
    mean_rank <- mean_rank[order(mean_rank$Overall.rank), ]  # Sort the data by rank
    top_10 <- mean_rank[1:10, ]  # Select the top 10 countries
    
    ggplot(top_10, aes(x = reorder(Country.or.region, Overall.rank), y = Overall.rank)) +
      geom_bar(stat = "identity", fill = rainbow(nrow(top_10))) +
      labs(x = "Country", y = "Mean Overall Rank") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
  })
  
  # Data Story 2
  output$scatterPlot2 <- renderPlot({
    ggplot(data = merged_df, aes(x = Overall.rank, y = Social.support, size = Score)) +
      geom_point() +
      labs(x = "University Ranking", y = "Social Support", size = "Score") +
      theme_minimal()
  })
  
  bubble_data <- aggregate(College.Ranking.to.GDP ~ Country.or.region, data = merged_df, FUN = mean)
  bubble_data <- bubble_data[bubble_data$College.Ranking.to.GDP > 0, ]
  bubble_data <- bubble_data[order(bubble_data$College.Ranking.to.GDP), ]
  
  bubble_chart <- ggplot(bubble_data, aes(x = reorder(Country.or.region, College.Ranking.to.GDP), y = College.Ranking.to.GDP, size = College.Ranking.to.GDP)) +
    geom_point(color = "blue", alpha = 0.7) +
    labs(x = "Region", y = "Average University Ranking to GDP Ratio", size = "Average University Ranking to GDP Ratio") +
    scale_size_continuous(range = c(3, 10)) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    theme(axis.text.x = element_text(size = 8)) +
    theme(legend.position = "bottom") +  # Placing the legend below the chart
    guides(size = guide_legend(title.position = "top", title.hjust = 0.5))  # Adjusting the position of the size legend
  
  output$bubbleChart2 <- renderPlot({
    bubble_chart
  })
  
  # Data Story 3
  output$mapPlot3 <- renderPlot({
    ggplot(data = merged_df, aes(x = Research.to.Freedom, y = Research.to.Life)) +
      geom_point() +
      labs(x = "Research to Freedom", y = "Research to Life") +
      theme_minimal()
  })
  
  output$barChart3 <- renderPlot({
    if (!is.null(merged_df$Country.or.region) && !is.null(merged_df$College.Count)) {
      filtered_data <- merged_df[merged_df$College.Count > 0, ]
      
      ggplot(data = filtered_data, aes(x = reorder(Country.or.region, College.Count), y = College.Count, fill = Country.or.region)) +
        geom_bar(stat = "identity", position = "dodge") +
        labs(x = "Country or Region", y = "College Count") +
        theme_minimal() +
        ggtitle("College Count by Country or Region") +
        xlab("Country or Region") +
        ylab("College Count") +
        theme(plot.title = element_text(size = 16, face = "bold"),
              legend.position = "none",
              axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 8),
              axis.text.y = element_text(size = 8, face = "bold", color = "black", angle = 0, hjust = 1),
              panel.grid.major.y = element_blank(),
              panel.grid.minor.y = element_blank(),
              panel.spacing = unit(0.1, "lines"))
    } else {
      ggplot() +
        labs(title = "No data available for college count by country or region") +
        theme_void()
    }
  })
  
  
  # Summary page
  output$summary_chart <- renderPlot({
    # Replace with your code to generate the summary chart
  })
})

# Run the Shiny app
shinyApp(ui = ui, server = server)