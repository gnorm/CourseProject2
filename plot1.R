## importing the data into R
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
dim(NEI)
dim(SCC)
View(NEI)
View(SCC)
unique(NEI$year)
## the measurements were taken in 1999, 2002, 2005, 2008
NEIyear <- aggregate(Emissions ~ year,NEIyear, mean)

barplot(
   (NEIyear$Emissions)/10^6,
   names.arg=NEIyear$year,
   xlab="Year",
   ylab="PM2.5 Emissions (10^6 Tons)",
   main="US aggregate PM2.5 Emissions",
   col = "red"
)
dev.copy(png, file="plot1.png", width=480, height=480, units="px") ##   copying plot to png file
dev.off() ##    closing the png device