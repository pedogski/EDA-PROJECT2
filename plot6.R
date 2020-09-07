setwd("./PROJECT2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

balmotsur <- aggregate(NEISCCsub[c("Emissions")], list(type = NEISCCsub$type, year = NEISCCsub$year, zip = NEISCCsub$fips), sum)

subbaltlos <- subset(NEISCC, fips == "06037" & type=="ON-ROAD")
losmotsur <- aggregate(subbaltlos[c("Emissions")], list(type = subbaltlos$type, year = subbaltlos$year, zip = subbaltlos$fips), sum)
cmbmotveh <- rbind(balmotsur, losmotsur)

png("plot6.png")
qplot(year, Emissions, data = cmbmotveh, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")     
dev.off()
