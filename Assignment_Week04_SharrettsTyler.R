#Tyler Sharretts 
# Week 04: Assignment

# Load in necessary packages 
library(maptools)
library(sp)
library(ncdf4)
library(raster)
library(rasterVis)
library(RColorBrewer)
library(rgdal)

# Load in the tree cover net cdf file 
ncFile <- nc_open("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/treecov.nc")

# Get the tree cover variable from the nc_file
TreeCov_Percent <- ncvar_get(ncFile, varid = "treecov")

# Remove values outside of 0 & 100 & Plot data 
TreeCov_Percent[TreeCov_Percent < 0] = NA
TreeCov_Percent[TreeCov_Percent > 100] = NA

# Load the TreeCov_Percent data in as a raster 
TreeCov_Percent_Raster <- raster(TreeCov_Percent)

# Plot using the image function from the raster 
image(TreeCov_Percent_Raster)

# Plot is not oriented correctly; reclassify the TreeCov_Percent_Raster dataset with transposition function
TreeCov_Percent_Raster <- t(TreeCov_Percent_Raster)

image(TreeCov_Percent_Raster)

# Plot still incorrect; also needs to be reclassified with the flip function 
TreeCov_Percent_Raster <- flip(TreeCov_Percent_Raster, 2)

image(TreeCov_Percent_Raster)

# Defining the new extent 
extent(TreeCov_Percent_Raster) = extent(c(-180, 180, -90, 90))

# Define the CRS
crs(TreeCov_Percent_Raster) <- "+proj=longlat +datum=WGS84 +no_defs"

# Add a custom shapefile with rgdal package
world.shp <- rgdal::readOGR("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/world_shpfiles/world.shp")

# Define map theme with the brewer package 
mapTheme <- rasterTheme(region = brewer.pal(8, "Greens"))

plt <- levelplot(TreeCov_Percent_Raster, margin = F, par.settings = mapTheme, main = "Tree Cover Percentage")
plt + layer(sp.lines(world.shp, col = 'black', lwd = 0.8))





