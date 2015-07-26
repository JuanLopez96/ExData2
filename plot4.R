NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'plot4.png', width = 480, height = 480)
sub1 <- grep('Coal',SCC$Short.Name, ignore.case = FALSE)  ## dim: 230
CcrCodes <- SCC[sub1,1]
CcrData <- subset(NEI, NEI$SCC %in% CcrCodes)
CcrEmi <- data.frame()
CcrEmi <- aggregate(CcrData$Emissions, by=list(CcrData$year), FUN=sum)
names(CcrEmi) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(CcrEmi, pch=20, type="l", main="Coal Combustion-Related PM2.5 Emissions in the United States", lwd=3, col="Blue")
dev.off()