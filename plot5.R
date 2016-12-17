library(ggplot2)

# Load datasets from local folder
NEI <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/summarySCC_PM25.rds")
SCC <- readRDS("/Users/Sachin/coursera/exploratorydataanalysis_project2/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# Generate the graph in the same directory as the source code
png('/Users/Sachin/coursera/exploratorydataanalysis_project2/plot5.png')

ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(stat="identity", aes(fill=year)) + guides(fill=F) + 
   ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
   ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
   geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()
