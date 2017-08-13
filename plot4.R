#' Across the United States, how have emissions from coal combustion-related 
#' sources changed from 1999-2008?
 
pm <- readRDS("summarySCC_PM25.rds")
s <- readRDS("Source_Classification_Code.rds")

coal <- subset(s, grepl("Coal", s$EI.Sector))
coal.SCC <- coal$SCC

pm.coal <- subset(pm, pm$SCC %in% coal.SCC)

pm.coal.1999 <- subset(pm.coal, pm.coal$year == 1999)
pm.coal.1999 <- sum(pm.coal.1999$Emissions, na.rm=TRUE)
pm.coal.2002 <- subset(pm.coal, pm.coal$year == 2002)
pm.coal.2002 <- sum(pm.coal.2002$Emissions, na.rm=TRUE)
pm.coal.2005 <- subset(pm.coal, pm.coal$year == 2005)
pm.coal.2005 <- sum(pm.coal.2005$Emissions, na.rm=TRUE)
pm.coal.2008 <- subset(pm.coal, pm.coal$year == 2008)
pm.coal.2008 <- sum(pm.coal.2008$Emissions, na.rm=TRUE)

Year = c(1999, 2002, 2005, 2008)
Emissions = c(pm.coal.1999, pm.coal.2002, pm.coal.2005, pm.coal.2008)

png("plot4.png")

plot(Year, Emissions, main="National pm2.5 Emission by Coal Sources",
     ylab="pm2.5 Emissions (tons)")

dev.off()