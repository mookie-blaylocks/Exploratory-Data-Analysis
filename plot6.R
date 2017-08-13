#' Compare emissions from motor vehicle sources in Baltimore City with
#' emissions from motor vehicle sources in Los Angeles County, California
#' (fips == "06037"). Which city has seen greater changes over time in motor
#' vehicle emissions?

library(ggplot2)

pm <- readRDS("summarySCC_PM25.rds")
pm.baltimore <- subset(pm, pm$fips=="24510")
pm.la <- subset(pm, pm$fips=="06037")

s <- readRDS("Source_Classification_Code.rds")

vehicles <- subset(s, grepl("Vehicles", s$EI.Sector))
vehicles.SCC <- vehicles$SCC

pm.baltimore.vehicles <- subset(pm.baltimore,
                                pm.baltimore$SCC %in% vehicles.SCC)
pm.la.vehicles <- subset(pm.la, pm.la$SCC %in% vehicles.SCC)

pm.baltimore.1999 <- subset(pm.baltimore.vehicles, 
                            pm.baltimore.vehicles$year==1999)
pm.baltimore.1999 <- sum(pm.baltimore.1999$Emissions, na.rm=TRUE)

pm.baltimore.2002 <- subset(pm.baltimore.vehicles, 
                            pm.baltimore.vehicles$year==2002)
pm.baltimore.2002 <- sum(pm.baltimore.2002$Emissions, na.rm=TRUE)
pm.baltimore.2002 <- pm.baltimore.2002 / pm.baltimore.1999 * 100

pm.baltimore.2005 <- subset(pm.baltimore.vehicles, 
                            pm.baltimore.vehicles$year==2005)
pm.baltimore.2005 <- sum(pm.baltimore.2005$Emissions, na.rm=TRUE)
pm.baltimore.2005 <- pm.baltimore.2005 / pm.baltimore.1999 * 100

pm.baltimore.2008 <- subset(pm.baltimore.vehicles, 
                            pm.baltimore.vehicles$year==2008)
pm.baltimore.2008 <- sum(pm.baltimore.2008$Emissions, na.rm=TRUE)
pm.baltimore.2008 <- pm.baltimore.2008 / pm.baltimore.1999 * 100

pm.la.1999 <- subset(pm.la.vehicles, 
                            pm.la.vehicles$year==1999)
pm.la.1999 <- sum(pm.la.1999$Emissions, na.rm=TRUE)

pm.la.2002 <- subset(pm.la.vehicles, 
                            pm.la.vehicles$year==2002)
pm.la.2002 <- sum(pm.la.2002$Emissions, na.rm=TRUE)
pm.la.2002 <- pm.la.2002 / pm.la.1999 * 100

pm.la.2005 <- subset(pm.la.vehicles, 
                            pm.la.vehicles$year==2005)
pm.la.2005 <- sum(pm.la.2005$Emissions, na.rm=TRUE)
pm.la.2005 <- pm.la.2005 / pm.la.1999 * 100

pm.la.2008 <- subset(pm.la.vehicles, 
                            pm.la.vehicles$year==2008)
pm.la.2008 <- sum(pm.la.2008$Emissions, na.rm=TRUE)
pm.la.2008 <- pm.la.2008 / pm.la.1999 * 100


Year <- rep(c(1999, 2002, 2005, 2008),2)
Emissions <- c(100, pm.baltimore.2002,
               pm.baltimore.2005, pm.baltimore.2008,
               100, pm.la.2002, pm.la.2005, pm.la.2008)
City <- c(rep("Baltimore", 4), rep("Los Angeles", 4))

d <- data.frame(Year, Emissions, City)

g <- ggplot(d, aes(Year, Emissions))
g <- g + geom_point(size=2) + facet_grid(. ~ City) + geom_line() +
    labs(title="pm2.5 Emission Change 1999 to 2008: Baltimore and Los Angeles",
         ylab="pm2.5 Emissions as Percent of 1999")

ggsave("plot6.png", plot=g)
