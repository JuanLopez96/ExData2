NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'plot5.png', width = 480, height = 480)
sub55 <- grep('Vehicle',SCC$EI.Sector, ignore.case = TRUE) ## dim: 1138
MotorCodes <- SCC[sub55,1]
MotorData <- subset(BalNEI, BalNEI$SCC %in% MotorCodes)
MotorEmi <- data.frame()
MotorEmi <- aggregate(MotorData$Emissions, by=list(MotorData$year), FUN=sum)
names(MotorEmi) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(MotorEmi, pch=20, type="l", main="Motor Vehicles PM2.5 Emissions in Baltimore", lwd=3, col="blue")
dev.off()