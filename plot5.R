#' How have emissions from motor vehicle sources changed from 1999-2008 in
#' Baltimore City?
 
pm <- readRDS("summarySCC_PM25.rds")
pm.baltimore <- subset(pm, pm$fips=="24510")

s <- readRDS("Source_Classification_Code.rds")

vehicles <- subset(s, grepl("Vehicles", s$EI.Sector))
vehicles.SCC <- vehicles$SCC

pm.baltimore.vehicles <- subset(pm.baltimore,
                                pm.baltimore$SCC %in% vehicles.SCC)

pm.1999 <- subset(pm.baltimore.vehicles, pm.baltimore.vehicles$year==1999)
pm.1999 <- sum(pm.1999$Emissions, na.rm=TRUE)
pm.2002 <- subset(pm.baltimore.vehicles, pm.baltimore.vehicles$year==2002)
pm.2002 <- sum(pm.2002$Emissions, na.rm=TRUE)
pm.2005 <- subset(pm.baltimore.vehicles, pm.baltimore.vehicles$year==2005)
pm.2005 <- sum(pm.2005$Emissions, na.rm=TRUE)
pm.2008 <- subset(pm.baltimore.vehicles, pm.baltimore.vehicles$year==2008)
pm.2008 <- sum(pm.2008$Emissions, na.rm=TRUE)

Year <- c(1999, 2002, 2005, 2008)
Emissions <- c(pm.1999, pm.2002, pm.2005, pm.2008)

png("plot5.png")

plot(Year, Emissions, main="Baltimore pm2.5 Emission by Vehicle Sources",
     ylab="pm2.5 Emissions (tons)")

dev.off()