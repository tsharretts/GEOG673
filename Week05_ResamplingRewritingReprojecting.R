# Tyler Sharretts 
# Week 05: Rewriting, Reprojecting, & Resampling Rasters 

### In-class Tutorial 

# Load in the libraries 
library(raster)
library(rasterVis)
library (maptools)
library(ncdf4)

# Directly load in dataset via raster package; specify variable name ("tem" for temperature)
temClim <- raster("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/globalTemClim1961-1990.nc")

# Create a new, blank raster to reclassify the resolution 
newRaster <- raster(nrow = 180, ncol = 360)

# Resample the temClim raster to the resized raster
res_temClim <- resample(x = temClim, y = newRaster, method = 'bilinear')

# Image the newly resampled raster 
image(res_temClim)

# Define new projection as Robinson via proj4 string;
# Can also be achieved by using EPSG codes with the following: "+init=espg:4326" for longlat 
newproj <- CRS("+proj=robin +lon0_0 +x0_0 +y0_0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

# Projecting the newly sampled temClim to the new CRS 
proj_temClim <- projectRaster(res_temClim, crs = newproj)

# Image the new raster 
image(proj_temClim)

# Construct a new image with a red theme and coast lines 
data("wrld_simpl")
plt <- levelplot(res_temClim, margin  = F, par.settings = BuRdTheme, main = "January Global Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# Reprojecting wrld_simpl
wrld_simpl <- spTransform(wrld_simpl, CRS("+proj=robin +lon0_0 +x0_0 +y0_0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"))
plt <- levelplot(proj_temClim, margin = F, par.settings = BuRdTheme, main = "January Global Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# If we want to download it to our device as a PNG 
png(filename = "~/GEOG_673/Figures/Week05_PNG_2.png", width = 10, height = 6, units = 'in', res = 100)
plt <- levelplot(proj_temClim, margin = F, par.settings = BuRdTheme, main = "January Global Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))
dev.off()

# Writing rasters to save the entire dataset
writeRaster(x = proj_temClim, filename = "~/GEOG_673/Figures/Proj_TemClim191-1990.tif", format = 'GTiff', 
            varname = 'Temperature', longname = "Global Average Temperature January 1960-1990", 
            xname = "lon", yname = "lat")






