NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'plot2.png', width = 480, height = 480)
## Baltimore fips = 24510
BalNEI <- NEI[(NEI$fips=="24510"),]
BalEmi <- data.frame()
BalEmi <- aggregate(BalNEI$Emissions, by=list(BalNEI$year), FUN=sum)
names(BalEmi) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(BalEmi, pch=20, type="l", main="PM2.5 Emissions in Baltimore", lwd=3, col="Blue")
dev.off()