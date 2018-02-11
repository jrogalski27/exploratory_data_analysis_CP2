NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIbaltimore <- subset(NEI,fips == "24510")

mvdata <- dplyr::filter(SCC, grepl('Motor Vehicles', Short.Name))
SCCmv <- as.character(mvdata[,1])
data <- subset(NEIbaltimore,SCC = SCCmv)

png("Plot5.png", width = 480, height = 480, units = "px")
ggplot(data, aes(year,Emissions))+geom_point()+labs(title = "Motor Vehicle Related Emissions in United States")+labs(x = "Years",y = "PM2.5 Emissions (tons)")+geom_smooth(method = "lm")
dev.off()
