library(ggplot2)

# Load datasets from local folder
NEI <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

png(filename='/Users/Sachin/coursera/exploratorydataanalysis_project2/plot3.png')

ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
   geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
   ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
   ggtitle('Emissions per Type in Baltimore City, Maryland') +
   geom_jitter(alpha=0.10)

dev.off()
