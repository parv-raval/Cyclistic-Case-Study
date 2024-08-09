
# Installing the core package
install.packages("tidyverse")

# Loading the libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Loading the data sets for analysis
df_1 <- read_csv("Divvy_Trips_2019_Q1.csv")
df_2 <- read_csv("Divvy_Trips_2020_Q1.csv")

# Merging the rows of the data sets
new_df <- rbind(df_1, df_2)

# Summarizing the new data set
summary(new_df)
colnames(new_df)
str(new_df)
head(new_df)

# Analyzing the new data set
new_df_summary <-
  new_df %>% 
  summarise(mean_ride_len = mean(new_df$ride_length[new_df$ride_length > 0], na.rm = TRUE),
            max_ride_len = max(new_df$ride_length[new_df$ride_length > 0], na.rm = TRUE))

head(new_df_summary)


# Analyzing the annual member riders
members_ride_len <- filter(new_df, new_df$member_casual=="member")

members_summary <-
  members_ride_len %>% 
  summarise(avg_ride_length = mean(members_ride_len$ride_length[members_ride_len$ride_length > 0], na.rm = TRUE),
            min_ride_length = min(members_ride_len$ride_length[members_ride_len$ride_length > 0], na.rm = TRUE),
            max_ride_length = max(members_ride_len$ride_length[members_ride_len$ride_length > 0], na.rm = TRUE))

head(members_summary)


# Analyzing the casual riders
casuals_ride_len <- filter(new_df, new_df$member_casual== "casual")

casuals_summary <-
  casuals_ride_len %>% 
  summarise(avg_ride_length = mean(casuals_ride_len$ride_length[casuals_ride_len$ride_length > 0], na.rm = TRUE),
            min_ride_length = min(casuals_ride_len$ride_length[casuals_ride_len$ride_length > 0], na.rm = TRUE),
            max_ride_length = max(casuals_ride_len$ride_length[casuals_ride_len$ride_length > 0], na.rm = TRUE))

head(casuals_summary)


# Calculating the ride count by Customer Type
ride_count_df <- 
  new_df %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = n())
head(ride_count_df)


# Displaying the ride count by Customer Type
ggplot(data = new_df) +
  geom_bar(mapping = aes(x = member_casual, fill = member_casual)) +
  labs(title = "Ride Count Vs Customer Type",
       x = "Customer Type",
       y = "Ride Count")


# Converting the day_of_week column from numbers to weekdays
new_df$day_of_week <- recode(new_df$day_of_week, 
                             "1"="Sunday",
                             "2"="Monday",
                             "3"="Tuesday",
                             "4"="Wednesday",
                             "5"="Thursday",
                             "6"="Friday",
                             "7"="Saturday")


# Ordering weekdays in a specific format
new_df$day_of_week <- ordered(new_df$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))


# Displaying ride count by Customer Type for weekdays
new_df %>% 
  drop_na(member_casual) %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n(), .groups = 'keep') %>% 
  arrange(member_casual, day_of_week) %>% 
  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
  geom_col(width=0.5, position = position_dodge(width=0.5)) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title = "Ride count by Customer Type for week days",
       x = "Week days",
       y = "Ride Count")


# Displaying average trip duration by Customer Type for weekdays
new_df %>%  
  drop_na(member_casual) %>%
  drop_na(ride_length) %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(average_trip_duration = mean(ride_length), .groups = 'keep') %>% 
  ggplot(aes(x = day_of_week, y = average_trip_duration, fill = member_casual)) +
  geom_col(width=0.5, position = position_dodge(width=0.5)) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title = "Average trip duration by Customer Type for week days",
       x = "Week days",
       y = "Average trip duration")



