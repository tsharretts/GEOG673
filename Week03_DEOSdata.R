# Tyler Sharretts
# Week 03: Time Series with R

# DEOS data

# Read in the csv file 
DEOS_data <- read.csv("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/DEOS.csv", header = TRUE, skip = 0, stringsAsFactors = FALSE)

# Run a head function on the DEOS_data in order to view the top few rows of a dataset
head(DEOS_data)

# Run a summary function on the DEOS_data in order to view data breakdown
summary(DEOS_data)

# Find out the variable names of the dataset
colnames(DEOS_data)

# Rename the data variables 
names(DEOS_data) = c("date_time", "air_temp", "dewpoint", "wind_speed", "wind_direction", "pressure", "solar_radiation", "wind_gust", "precipitation")

# Print out first date_time
DEOS_data$date_time[1]

# View the class of the first date index 
class(DEOS_data$date_time)

# Convert date_time from character class to datetime class
DEOS_data$date_time = as.POSIXct(x = DEOS_data$date_time, format = '%Y-%m-%d %H:%M')

# Subset the data to find our upper and lower indicies
low_ind = which.min(DEOS_data$date_time < "2014-04-04 00:00:00")
upper_ind = which.max(DEOS_data$date_time > "2015-04-04 23:59")

# Plot the dataset by indexing it between the low_ind and upper_ind
plot(DEOS_data$date_time[low_ind:upper_ind], DEOS_data$air_temp[low_ind:upper_ind],
     type = "l", col  ='red',
     xlab = paste0(DEOS_data$date_time[low_ind], "to", DEOS_data$date_time[upper_ind]),
     ylab = "Celsius")
# Add title to the plot
title("1-year Air Temperature at Station")



# Subset the data (this time using the subset function)
subDEOS = subset(DEOS_data, DEOS_data$date_time >= "2014-07-04 00:00:00" & DEOS_data$date_time <= "2014-07-11 23:59:00")



# Add  dewpoint to the plot 
plot(x = subDEOS$date_time, y = subDEOS$air_temp, type = "l", col = 'red',
     xlab = paste0(subDEOS$date_time[1], "to", subDEOS$date_time[length(subDEOS$date_time)]), 
     ylab = "Celsius", ylim = c(5,40))

# Add "lines" to the plot (in case we want our lines to be the dewpoint)
lines(x = subDEOS$date_time, y = subDEOS$dewpoint, col = 'yellow')

# Add legend
legend('bottomright', legend = c('Air Temp', 'Dew Pt'), col = c('red', 'yellow'), lty = c(1, 1))

# Title 
title("Air Temperature & Dew Point Temperature")

