# annual listings data - OM 488

library(tidyverse)
library(readxl)

work_stoppages <- read_excel("data-analysis/annual-listing.xlsx", 
                             sheet = "data", na = "NA", skip = 1)

# x = year ; y = # of idle days (thousands)
# comments:
# MAJOR SPIKE IN IDLE DAYS IN YEAR 2000s
a <- ggplot(data = work_stoppages,
            mapping = aes(x = Year, y = `Days of idleness [2] - number (in thousands)`))

a <- a + geom_line()

# zoom-in ; emphasis on 1980s and spike in 2000s
a <- a + coord_cartesian(xlim = c(1980, NA), ylim = c(0, 30000))

# labeling
a <- a + labs(title = 'Year 2000s spike in idle days - not seen since 1980s', 
              caption = 'Source: U.S Bureau of Labor Statistics', 
              subtitle = 'Annual work stoppages involving 1,000 or more workers (1947-2021)', 
              y = 'Number of idle days (thousands)')

# x = year ; y = # of workers (thousands)
# comments:
# # of striking workers in 2000s less than 1980s - refer back to spike in IDLE DAYS
# SPIKE IN # OF WORKERS AROUND 2018-2019 - LAST SEEN IN LATE 1980s
b <- ggplot(data = work_stoppages,
            mapping = aes(x = Year, y = `Number of workers \r\n(in thousands) in the period [1] - beginning`))

b <- b + geom_line()

# zoom-in
b <- b + coord_cartesian(xlim = c(1980, NA), ylim = c(0, 1250))

# labeling
b <-  b + labs(title = 'Number of Striking Workers in 2000s comparable to 1980s', 
               caption = 'Source: U.S Bureau of Labor Statistics', 
               subtitle = 'Annual work stoppages involving 1,000 or more workers (1947-2021)', 
               y = 'Number of workers (thousands)')
