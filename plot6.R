#Reading the data: 

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting Baltimor city and on-road:
emissions_Balt <- subset(NEI, fips=="24510" & type=="ON-ROAD")
# Getting yearly data:
emission_by_year_Balt <- emissions_Balt %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# Subsetting Los Angeles city and on-road:
emissions_LA <- subset(NEI, fips=="06037" & type=="ON-ROAD")
# Getting yearly data:
emission_by_year_LA <- emissions_LA %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# setting the plotting area into a 1*2 array
par(mfrow=c(1,2))    

plot(emission_by_year_Balt$year,emission_by_year_Balt$Emissions, main="Baltimor city", xlim = c(1998,2009), ylim = c(0,5000), type = "l", col="blue", xlab = "Year", ylab = "Total emmision", xaxt="n", yaxt="n")
axis(1, at = seq(1999, 2008, by = 3), las=2)
axis(2, at = seq(0, 6000, by = 1500), las=0, labels=c("0","1500","3000","4500","6000"))
points(emission_by_year_Balt$year,emission_by_year_Balt$Emissions)

plot(emission_by_year_LA$year,emission_by_year_LA$Emissions, main="LA", xlim = c(1998,2009), ylim = c(0,5000), type = "l", col="blue", xlab = "Year", ylab = "Total emmision", xaxt="n", yaxt="n")
axis(1, at = seq(1999, 2008, by = 3), las=2)
axis(2, at = seq(0, 6000, by = 1500), las=0, labels=c("0","1500","3000","4500","6000"))
points(emission_by_year_LA$year,emission_by_year_LA$Emissions)

# Saving to a png file:
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()