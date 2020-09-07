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

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# wgere 24510 is Baltimore.
library(ggplot2)

NEIsub  <- subset(NEI, fips=="24510")

balttotyrtype <- aggregate(Emissions ~ year+type, NEIsub, sum)
str(balttotyrtype)

png("plot3.png")
plv <- ggplot(balttotyrtype, aes(year, Emissions, color = type))
plv <- plv + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(plv)
dev.off()
