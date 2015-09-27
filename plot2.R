## importing the data into R
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

NEIyear <- group_by(NEI, year)

baltimore <- filter(NEIyear, fips=="24510")
baltimore <- aggregate(Emissions ~ year, baltimore,sum)
barplot(
   (baltimore$Emissions)/10^6,
   names.arg=baltimore$year,
   xlab="Year",
   ylab="PM2.5 Emissions (10^6 Tons)",
   main="Baltimore aggregate PM2.5 Emissions",
   col = "red"
)

dev.copy(png, file="plot2.png", width=480, height=480, units="px") ##   copying plot to png file
dev.off() ##    closing the png device