setwd("./PROJECT2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEIsub  <- subset(NEI, fips=="24510")

balttotyr <- aggregate(Emissions ~ year, NEIsub, sum)
str(balttotyr)
png('plot2.png')
plot(balttotyr$year, balttotyr$Emissions,  xlab ="years", ylab=expression('total PM'[2.5]*' emission'), , type = "l", pch = 16, lty =5,  col = "seagreen", main =expression('Total PM'[2.5]*' Baltimore City, MD emissions at various years'))
dev.off()
