#Reading the data:

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI[,c("Emissions","year")]
emissions_by_year <- emissions_by_year %>% group_by(year) %>% summarise_all(sum)

plot(emissions_by_year$year,emissions_by_year$Emissions, main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), xlim = c(1998,2009), ylim = c(0,7500000), type = "l", col="blue", xlab = "Year", ylab = "Total emmision", xaxt="n", yaxt="n")
axis(1, at = seq(1999, 2008, by = 3), las=2)
axis(2, at = seq(0, 8000000, by = 2000000), las=0, labels=c("0","2000","4000","6000","8000"))
points(emissions_by_year$year,emissions_by_year$Emissions)

# Saving to a png file:
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()