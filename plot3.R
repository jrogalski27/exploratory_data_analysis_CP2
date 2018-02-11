NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI, year == c(1999,2002,2005,2008) & fips == "24510")

png("Plot3.png", width = 960, height = 480, units = "px")
g <- ggplot(baltimore, aes(year, Emissions))
g+geom_point()+facet_grid(.~type)+geom_smooth(method = "lm")
dev.off()
