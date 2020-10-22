# Tyler Sharretts 
# Week 05: Assignment 

# Load in the libraries 
library(raster)
library(rasterVis)
library (maptools)
library(ncdf4)

# Directly load in dataset via raster package; specify variable name ('tem' for temperature); 
Tem_Clim <- raster("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/globalTemClim1961-1990.nc")

# Extract for January & July
Tem_Clim_Jan <- raster("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/globalTemClim1961-1990.nc", varname = 'tem', band=1)

Tem_Clim_July <- raster("~/GEOG_673/geog473-673-master/geog473-673-master/datasets/globalTemClim1961-1990.nc", varname = 'tem', band=7)

# Take the difference of July & January 
Tem_Clim_Diff <- Tem_Clim_July - Tem_Clim_Jan

# New, blank raster to resample the resolution the first time
New_Raster_1 <- raster(nrow = 36, ncol = 72)

# Resample the raster using the nearest neighbor method
res_Tem_Clim_Diff_1 <- resample(x = Tem_Clim_Diff, y = New_Raster_1, method = 'ngb')

# New, blank raster to resample the resolution a second time
New_Raster_2 <- raster(nrow = 36, ncol = 72)

# Resample the raster using the nearest neighbor method
res_Tem_Clim_Diff_2 <- resample(x = res_Tem_Clim_Diff_1, y = New_Raster_2, method = 'ngb')

# Reproject wrld_simpl
wrld_simpl <- spTransform(wrld_simpl, CRS("+proj=moll +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"))
plt <- levelplot(res_Tem_Clim_Diff_2, margin = F, par.settings = BuRdTheme, main = "Jul - Jan Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# Define the new CRS
New_Proj <- CRS("+proj=moll +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs")

# Poject the newly sampled raster to the newly defined CRS 
proj_res_Tem_Clim_Diff_2 <- projectRaster(res_Tem_Clim_Diff_2, crs = New_Proj)

# Construct new image with color theme and country borders
data("wrld_simpl")
plt <- levelplot(res_Tem_Clim_Diff_2, margin = F, par.settings = BuRdTheme, main = "Jul - Jan Global Average Tempereature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# Reproject wrld_simpl
wrld_simpl <- spTransform(wrld_simpl, CRS("+proj=moll +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"))
plt <- levelplot(proj_res_Tem_Clim_Diff_2, margin = F, par.settings = BuRdTheme, main = "Jul - Jan Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))

# Write raster as netCDF 
writeRaster(x = res_Tem_Clim_Diff_2, filename = "~/GEOG_673/R_scripts/Assignment_Week05_SharrettsTyler.nc", format = 'CDF', 
            varname = 'Temperature', longname = "Jul - Jan Global Average Temperature 1961 - 1990", 
            xname = "lon", yname = "lat")

# Download as PNG 
png(filename = "~/GEOG_673/Figures/Assignment_Week05_SharrettsTyler.png", width = 10, height = 6, units = 'in', res = 100)
plt <- levelplot(proj_res_Tem_Clim_Diff_2, margin = F, par.settings = BuRdTheme, main = "Jul - Jan Global Average Temperature 1961 - 1990")
plt + layer(sp.lines(wrld_simpl, col = 'black', lwd = 0.4))
dev.off()


