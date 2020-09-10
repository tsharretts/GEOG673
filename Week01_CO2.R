### Carbon Dioxide Script

# load CO2 data set
co2

# rename the co2 dataset as co2_data
co2_data <- co2

# find the class of co2_data
class(co2_data)

# summary of co2_data
summary(co2_data)

# length of co2_data
length(co2_data)

#plot co2_data
plot(x = co2, ylab = "Atmospheric concentration of CO2 (ppm)", main = "CO2 Dataset")
