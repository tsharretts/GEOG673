#Tyler Sharretts 
# Week 04: Rasters 

### In-class tutorial 

# Install the necessary apckages 
install.package("maptools")
install.packages("sp")
install.packages("ncdf4")
install.packages("raster")
install.packages("rasterVis")
install.packages("RColorBrewer")

# Load in the packages
library(maptools)
library(sp)
library(ncdf4)
library(raster)
library(rasterVis)
library(RColorBrewer)

# Load in the net cdf file 
ncFile <- nc_open("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/GOES_R_ROLLING_1DAY_20190814.nc")

# Get the sea surface temperature variable from the nc_file 
sstGOES <- ncvar_get(ncFile, varid = "sst")

# Load the sstGOES data in as a raster 
sstRast <- raster(sstGOES)

# Plot using the image function from raster (much quicker)
image(sstRast)

# Plot is incorrectly flipped; reclassify the sstRast data as a transposed data
sstRast <- t(sstRast)

# Re-run the plot 
image(sstRast)

# Plot not quite correct (still needs flipped); use the flip function
sstRast <- flip(sstRast, 2)

# Re-run th plot 
image(sstRast)

# Extents are still incorrect / not included; obtain the lon and lat variables from original nc_File
lat = ncvar_get(ncFile, varid = "latitude")
lon = ncvar_get(ncFile, varid = "longitude")

# Classifying / defining the new extent of the sstRast
extent(sstRast) = c(min(lon), max(lon), min(lat), max(lat))

# Re-run the plot
image(sstRast)

# Define the CRS
crs(sstRast) <- "+proj=longlat +datum=WGS84 +no_defs "

# Re-run the plot (should be the exact same)
image(sstRast)

# Run a level plot 
levelplot(sstRast)

# Run a world simple function to load a base dataset / shapefile that R has automatically stored 
data("wrld_simpl")

# Define its map themes
plt <- levelplot(sstRast, margin = F, par.settings=BuRdTheme, main = "GOES-R Rolling SST 08/14")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# Add a custom shapefile 
world.shp <- rgdal::readOGR("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/world_shpfiles/world.shp")

# Define map themes with the brewer package 
mapTheme <- rasterTheme(region=brewer.pal(8, "Reds"))

plt <- levelplot(sstRast, margin = F, par.settings=mapTheme, main = "GOES-R Rolling SST 08/14")
plt + layer(sp.lines(world.shp, col = 'black', lwd = 0.8))

