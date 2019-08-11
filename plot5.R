#Reading the data:

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting Baltimor city and on-road:
emissions <- subset(NEI, fips=="24510" & type=="ON-ROAD")

# Getting yearly data:
emission_by_year <- emissions %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

par(mfrow=c(1,1)) 

plot(emission_by_year$year,emission_by_year$Emissions, main="Emmissions by Year from vehicles in Baltimor city", xlim = c(1998,2009), ylim = c(0,400), type = "l", col="blue", xlab = "Year", ylab = "Total emmision", xaxt="n", yaxt="n")
axis(1, at = seq(1999, 2008, by = 3), las=2)
axis(2, at = seq(0, 400, by = 100), las=0, labels=c("0","100","200","300","400"))
points(emission_by_year$year,emission_by_year$Emissions)

# Saving to a png file:
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()