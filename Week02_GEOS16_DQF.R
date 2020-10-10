### GOES-16 Sea-surface Satellite Data

# load libraries
library(ncdf4)
library(fields)

# loading the file
ncFile <- ncdf4::nc_open("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/OR_ABI-L2-SSTF-M3_G16_s20192081300453_e20192081400161_c20192081406297.nc")

# load in the SST variable and save it as sstk
sstK <- ncdf4::ncvar_get(nc=ncFile, varid="SST")

# load in the latitudes and longitudes 
lat <- ncdf4::ncvar_get(nc=ncFile, varid="latitude")
lon <- ncdf4::ncvar_get(nc=ncFile, varid="longitude")

#load in the DQF variable and save it as dqf 
dqf <- ncdf4::ncvar_get(nc=ncFile, varid="DQF")

# convert sst from Kelvin to Celsius
sstC <- sstK - 273.15

# remove values below 0C
sstC[sstC < 0] = NA

# Plot the matrix
fields::image.plot(x=lon, y=lat, z=dqf, legend.lab="Data Quality Flag")
title("GOES-R DQF 7/25/2019 19:00 UTC")
