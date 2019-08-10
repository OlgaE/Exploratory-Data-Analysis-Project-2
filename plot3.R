#Reading the data:

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

emissions_24510 <- subset(NEI, fips=="24510")
emissions_by_year <- emissions_24510 %>% group_by(year, type) %>% summarise(Emissions=sum(Emissions))
emissions_by_year$type = as.factor(emissions_by_year$type)

qplot(year, Emissions, data=emissions_by_year, 
           facets=.~type, main=expression('Aggregated PM'[2.5]*' Emmissions by Year'),
           xlab="Year", ylab="Total emmision")+  
           geom_point() + geom_line() + 
           scale_x_continuous(breaks = seq(1999, 2008, by = 3))+
           theme(panel.spacing = unit(1, "lines"))

# Saving to a png file:
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()