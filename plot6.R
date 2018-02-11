NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIfiltered <- subset(NEI,fips == c("24510","06037"))

mvdata <- dplyr::filter(SCC, grepl('Motor Vehicles', Short.Name))
SCCmv <- as.character(mvdata[,1])
data <- subset(NEIfiltered,SCC = SCCmv)

png("Plot6.png", width = 960, height = 480, units = "px")
ggplot(data, aes(year,log10(Emissions)))+facet_grid(.~fips)+geom_point()+labs(title = "Motor Vehicle Related Emissions in Los Angeles County vs Baltimore City")+labs(x = "Years",y = "PM2.5 Emissions (tons)")+geom_smooth(method = "lm")
dev.off()
