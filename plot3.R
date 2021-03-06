NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
BalSou <- data.frame()
BalSou <- aggregate(BalNEI$Emissions, by=list(BalNEI$year,BalNEI$type), FUN=sum)
names(BalSou) <- c("Year", "Type", "Emissions")
g <- ggplot(BalSou, aes(Year,Emissions))
p <- g + geom_point() + geom_line() + facet_grid(. ~ Type) + labs(title="PM2.5 Emissions by type in Baltimore") + labs(y=expression("PM2.5 Emissions (in Tons)")) + theme_bw()
ggsave("plot3.png", width=8, height=4)