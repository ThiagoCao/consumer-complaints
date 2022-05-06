#first we'll load our libraries
#make sure to install the tidyverse if it's not already installed
library(tidyverse)
library(lubridate)

# run this line below load the data for this assignment
impeach <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRh8d5JaDqBtByzNw2JZF3idaACobDhhk-p7chJoktA0HawELHFOvjQOqCpzGA4MGONvPlR7GASqW-K/pub?gid=1765341510&single=true&output=csv")

# it will load a dataframe called "impeach," containing U.S. House Democrats
# and whether they supported impeachment along with when they announced such support



# FOR EACH OF THE QUESTIONS BELOW, WRITE YOUR WORKING R CODE TO RETURN THE REQUESTED RESULTS
# USE COMMENTS (PREFACED BY THE #) TO ACCOMPANY YOUR CODE TO EXPLAIN WHAT YOU'RE DOING 
# FOR EACH STEP




# 1) The column "for_impeachment" indicates whether the member has publicly called for
# an impeachment inquiry. Filter to return only the ones where the answer is NO.    

impeach %>%
  filter(for_impeachment == "NO")


# 2) Filter to return only results where a member is both against impeachment, and comes from a 
# district that President Trump won in 2016 (which is noted in the "p16winningparty" column)

impeach %>%
  filter(p16winningparty == "R", for_impeachment == "YES")


# 3) Filter for only results where a member is against impeachment, comes from a 
# district that President Trump won in 2016 (which is noted in the "p16winningparty" column),
# and also comes from a district that Mitt Romney won in 2012 ("p12winningparty").

impeach %>%
  filter(for_impeachment == "NO", p16winningparty == "R", p12winningparty == "R")


# 4) Filter for only results from September 2019 where a member is a YES for impeachment. 

impeach %>%
  filter(for_impeachment == "YES", date_month == "9", date_year == "2019")


# 5) Filter for only results where a member is a YES for impeachment and is from a district
# where Clinton won more than 70 percent of the vote in 2016 (found in column "clinton_percent")

impeach %>%
  filter(for_impeachment == "YES", clinton_percent > 70)


# 6) Sort the entire dataframe based on the percentage of a district that has a 
# bachelor's degree or higher ("pct_bachelors"), from lowest to highest

impeach %>%
  arrange(pct_bachelors)


# 7) Sort the just those who are NO on impeachment based on the percentage of a district that has a 
# bachelor's degree or higher ("pct_bachelors"), from lowest to highest

impeach %>%
  filter(for_impeachment == "NO") %>% 
  arrange(pct_bachelors)


# 8) Sort the just those who are NO on impeachment based on the percentage of a district that has a 
# bachelor's degree or higher ("pct_bachelors"), from lowest to highest.
# Then filter those records by only those whose bachelor's percentage is below the national average (found
# in the "pct_bachelors_compared_to_national" column).

impeach %>%
  filter(for_impeachment == "NO", pct_bachelors_compared_to_national == "BELOW") %>% 
  arrange(pct_bachelors)


# 9) Filter for only members from New Jersey who are NO on impeachment

impeach %>%
  filter(state == "NJ", for_impeachment == "NO")


# 10) Filter for those who were YES on impeachment, with a declared date prior to 2019. So only
# those with dates before 2019.  Then sort those so that the highest Clinton vote percentages are 
# at the top.   

impeach %>%
  filter(for_impeachment == "YES", date_year < 2019) %>%
  arrange(clinton_percent)


# 11) Answer this question with a single numeric answer, and show the R code you
# used to reach that answer: How many members in the dataset who are holdouts on impeachment
# come from districts with a GDP below the national figure?
# Hint: there's a function called nrow() that tells you how many rows are in a dataframe

impeach %>%
  filter(for_impeachment == "NO", gdp_above_national == "BELOW") %>%
  nrow()

#Answer:19

