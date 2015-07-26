NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
BalLosNEI <- NEI[(NEI$fips=="24510" | NEI$fips=="06037" ),]
BalLosMotor <- data.frame()
BalLosMotor <- aggregate(BalLosNEI$Emissions, by=list(BalLosNEI$year,BalLosNEI$fips), FUN=sum)
names(BalLosMotor) <- c("Year", "City", "Emissions")
BalLosMotor$City[(BalLosMotor$City=="06037")] <- "Baltimore City"
BalLosMotor$City[(BalLosMotor$City=="24510")] <- "Los Angeles County"
g6 <- ggplot(BalLosMotor, aes(Year,Emissions))
p6 <- g6 + geom_point() + geom_line() + facet_grid(. ~ City) + labs(title="PM2.5 Motor Vehicle PM2.5 Emissions in Baltimore and Los Angeles") + labs(y=expression("PM2.5 Emissions")) + theme_bw()
ggsave("plot6.png", width=8.5, height=4)