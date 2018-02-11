NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- dplyr::filter(SCC, grepl('Coal', Short.Name))
SCCcoal <- as.character(data[,1])
coaldata <- subset(NEI,SCC == SCCcoal)

png("Plot4.png", width = 480, height = 480, units = "px")
ggplot(coaldata, aes(year,Emissions))+geom_point(aes(color = type))+labs(title = "Coal-Combustion Related Source Emissions in United States")+labs(x = "Years",y = "PM2.5 Emissions (tons)")+geom_smooth(method = "lm")
dev.off()
