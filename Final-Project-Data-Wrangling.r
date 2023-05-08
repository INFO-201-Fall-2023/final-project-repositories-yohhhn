library(dplyr)
library(stringr)

df_1 <- read.csv("2019.csv") 
df_2 <- read.csv("2019_rankings.csv")

df_1 <- arrange(df_1, Country.or.region)
df_2 <- arrange(df_2, location)

# summarize subcategories of rankings from college rankings and get the mean for each country
df_mean <- summarize(
  group_by(df_2, location),
  mean_overall_rank <- mean(scores_overall_rank),
  mean_scores_teaching_rank <- mean(scores_teaching_rank),
  mean.scores.research <- mean(scores_research),
  mean_scores_research_rank <- mean(scores_research_rank),
  mean_scores_citation_rank <- mean(scores_citations_rank),
  mean_industry_income <- mean(scores_industry_income),
  mean_international_outcome_rank <- mean(scores_international_outlook_rank)
)

# find the counts of top ranking colleges in each country and put it in df_3
college_in_country_count <- table(df_2['location'])
df_3 <- data.frame(college_in_country_count)

# fill in df_1 with the count of the top ranking colleges from each country 
df_1$College.Count <- 0 
for (i in 1:nrow(df_1)) {
  match_row <- df_3[df_3$location == df_1$Country.or.region[i], ]
  if (nrow(match_row) > 0) {
    df_1$College.Count[i] <- match_row$Freq
  }
}

# merge the dataframe with all the means with the World Happiness report 
df <- merge(x = df_1, y = df_mean, by.x = "Country.or.region", by.y = "location", all.x = TRUE)

# fill all the NA values with 0
df[is.na(df)] = 0

# sort the dataframe according to rank from World Happiness report 
df <- arrange(df, Overall.rank)

# add categorical variable that is TRUE if the country has at least one college from the rankings
# (if the country has one of the top 1258 colleges)
df$Has.Top.College <- df$College.Count != 0

# add continous variable that measures the ratio of the college ranking score to the happiness ranking 
# from the World Happiness Report 
df$College.Ranking.Happiness.Ranking.Ratio <- df$mean_overall_rank / df$Score

# add continous variable that numerically represents how college ranking affects GDP per capita,
# social support, healthy life expectancy, freedom to make life decisions, generosity, and 
# perception of corruption (ratio of mean college ranking to whatever variable) 
df$College.Ranking.to.GDP <- df$mean_overall_rank / df$GDP.per.capita
df$College.Ranking.to.SocialSupport <- df$mean_overall_rank / df$Social.support
df$College.Ranking.to.life <- df$mean_overall_rank / df$Healthy.life.expectancy
df$College.Ranking.to.freedom <- df$mean_overall_rank / df$Freedom.to.make.life.choices
df$College.Ranking.to.generosity <- df$mean_overall_rank / df$Generosity
df$College.Ranking.to.corruption <- df$mean_overall_rank / df$Perceptions.of.corruption

# add continous variable to see how volume, incode, and reputation of colleges affect GDP,
# social support, life expectancy, freedom, generosity, and perception of corruption 
# in the country that they are in (ratio of ranking in mean research) 
df$Research.to.GDP <- df$mean.scores.research / df$GDP.per.capita
df$Research.to.Social <- df$mean.scores.research / df$Social.support
df$Research.to.Life <- df$mean.scores.research / df$Healthy.life.expectancy
df$Research.to.Freedom <- df$mean.scores.research / df$Freedom.to.make.life.choices
df$Research.to.Generosity <- df$mean.scores.research / df$Generosity
df$Research.to.Corruption <- df$mean.scores.research / df$Perceptions.of.corruption