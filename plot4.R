#Reading the data:

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

coalS <- SCC[grep("Coal|coal", SCC$EI.Sector), "SCC"]
coalN <- NEI %>% filter(SCC %in% coalS)
emission_coal <- coalN %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

plot(emission_coal$year,emission_coal$Emissions, main="Emissions from coal combustion-related sources", xlim = c(1998,2009), ylim = c(0,600000), type = "l", col="blue", xlab = "Year", ylab = "Total emmision", xaxt="n", yaxt="n")
axis(1, at = seq(1999, 2008, by = 3), las=2)
axis(2, at = seq(0, 600000, by = 200000), las=0, labels=c("0","2000","4000","6000"))
points(emission_coal$year,emission_coal$Emissions)

# Saving to a png file:
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()