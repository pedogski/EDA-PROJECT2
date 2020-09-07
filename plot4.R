setwd("./PROJECT2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
Matchcoal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subNEISCC <- NEISCC[Matchcoal, ]

png("plot4.png")
plot4 <- ggplot(subNEISCC, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .6) + xlab("year") +ylab("Coal-Related PM2.5 Emissions trend") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
dev.off()
