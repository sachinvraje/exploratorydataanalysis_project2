# Load datasets from local folder
NEI <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset data and append two years in one data frame
MD <- subset(NEI, fips=='24510')

png(filename='/Users/Sachin/coursera/exploratorydataanalysis_project2/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()