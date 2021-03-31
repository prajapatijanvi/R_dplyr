#Load flights dataset
flights <- read.csv('./flights.csv')

#View flights
View(flights)

#View 1st 6 Records
head(flights)
head(flights,10)

#View last 6 Records
tail(flights)
tail(flights,10)

#convert into dataframe
flights <- data.frame(flights)

#Overview of the data
glimpse(flights)

#Select required columns
select(flights, dep_time, arr_time, flight)

#filter required rows
filter(flights, month==1, day==1, origin=="EWR")

#Comparison Operator
filter(flights, carrier=="AA" | carrier=="UA")

#dplyr approach

#chaining method
flights %>%
  select(carrier,dep_delay) %>%
  filter(dep_delay > 60)

flights %>%
  select(carrier,dep_delay) %>%
  filter(dep_delay > 60)
  
#Arrange Method
#
flights %>%
  select(carrier,dep_delay) %>%
  arrange(dep_delay)
#Descending
flights %>%
  select(carrier,dep_delay) %>%
  arrange(desc(dep_delay))

#Speed 
flights <- flights %>% mutate(speed = distance/air_time)

#Groupby method
flights %>%
  group_by(dest) %>%
  summarise(avg_delay = mean(arr_delay,na.rm=TRUE))

flights %>%
  group_by(month,day) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))

