#'  Have total emissions from PM2.5 decreased in the United States from 1999 to
#'  2008? Using the base plotting system, make a plot showing the total PM2.5
#'  emission from all sources for each of the years 1999, 2002, 2005, and 2008.

pm <- readRDS("summarySCC_PM25.rds")

pm1999 <- subset(pm, year == 1999)
pm.total.1999 <- sum(pm1999$Emissions, na.rm=TRUE)
pm2002 <- subset(pm, year == 2002)
pm.total.2002 <- sum(pm2002$Emissions, na.rm=TRUE)
pm2005 <- subset(pm, year == 2005)
pm.total.2005 <- sum(pm2005$Emissions, na.rm=TRUE)
pm2008 <- subset(pm, year == 2008)
pm.total.2008 <- sum(pm2008$Emissions, na.rm=TRUE)
png("plot1.png")
barplot(c(pm.total.1999, pm.total.2002, pm.total.2005, pm.total.2008),
        names.arg=c(1999, 2002, 2005, 2008),
        main="US National pm2.5 Emissions",
        xlab="Year",
        ylab="Total pm2.5 Emissions (tons)")
dev.off()