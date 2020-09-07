setwd("./PROJECT2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Using the base plotting system, to make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)
str(TotalByYear)
png('plot1.png')
plot(TotalByYear$year, TotalByYear$Emissions, xlab="years", ylab=expression('total PM'[2.5]*' emission'),type="b", col="salmon4", lty = 4, main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()


