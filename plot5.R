setwd("./PROJECT2")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 24510 is Baltimore, see plot2.R. We search for ON-ROAD type in NEI
#Searching for 'motor' in SCC only gave a subset (non-cars)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
NEISCCsub <- subset(NEISCC, fips == "24510" & type=="ON-ROAD")

balmotsur <- aggregate(NEISCCsub[c("Emissions")], list(type = NEISCCsub$type, year = NEISCCsub$year, zip = NEISCCsub$fips), sum)

png("plot5.png")
qplot(year, Emissions, data = balmotsur, geom= "line") + theme_linedraw() + ggtitle("Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")
dev.off()
