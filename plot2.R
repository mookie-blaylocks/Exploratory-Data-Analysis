#' Have baltimore emissions from PM2.5 decreased in Baltimore City, Maryland
#' (fips == "24510") from 1999 to 2008? Use the base plotting system to make
#' a plot answering this question.

pm <- readRDS("summarySCC_PM25.rds")

pm.baltimore <- subset(pm, fips=="24510")

pm1999 <- subset(pm.baltimore, year == 1999)
pm.baltimore.1999 <- sum(pm1999$Emissions, na.rm=TRUE)
pm2002 <- subset(pm.baltimore, year == 2002)
pm.baltimore.2002 <- sum(pm2002$Emissions, na.rm=TRUE)
pm2005 <- subset(pm.baltimore, year == 2005)
pm.baltimore.2005 <- sum(pm2005$Emissions, na.rm=TRUE)
pm2008 <- subset(pm.baltimore, year == 2008)
pm.baltimore.2008 <- sum(pm2008$Emissions, na.rm=TRUE)
png("plot2.png")
barplot(c(pm.baltimore.1999, pm.baltimore.2002, 
          pm.baltimore.2005, pm.baltimore.2008),
        names.arg=c(1999, 2002, 2005, 2008),
        main="Baltimore pm2.5 Emissions",
        xlab="Year",
        ylab="pm2.5 Emissions (tons)")
dev.off()