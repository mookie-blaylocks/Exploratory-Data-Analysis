#' Of the four types of sources indicated by the type (point, nonpoint, onroad,
#' nonroad) variable, which of these four sources have seen decreases in
#' emissions from 1999-2008 for Baltimore City? Which have seen increases in
#' emissions from 1999-2008? Use the ggplot2 plotting system to make a plot to
#' answer this question.

library(ggplot2)

pm <- readRDS("summarySCC_PM25.rds")

pm.baltimore <- subset(pm, fips=="24510")

pm.point.1999 <- subset(pm.baltimore, type=="POINT" & year==1999)
pm.point.1999 <- sum(pm.point.1999$Emissions, na.rm = TRUE)
pm.point.2008 <- subset(pm.baltimore, type=="POINT" & year==2008)
pm.point.2008 <- sum(pm.point.2008$Emissions, na.rm = TRUE)

pm.nonpoint.1999 <- subset(pm.baltimore, type=="NONPOINT" & year==1999)
pm.nonpoint.1999 <- sum(pm.nonpoint.1999$Emissions, na.rm = TRUE)
pm.nonpoint.2008 <- subset(pm.baltimore, type=="NONPOINT" & year==2008)
pm.nonpoint.2008 <- sum(pm.nonpoint.2008$Emissions, na.rm = TRUE)

pm.on.road.1999 <- subset(pm.baltimore, type=="ON-ROAD" & year==1999)
pm.on.road.1999 <- sum(pm.on.road.1999$Emissions, na.rm = TRUE)
pm.on.road.2008 <- subset(pm.baltimore, type=="ON-ROAD" & year==2008)
pm.on.road.2008 <- sum(pm.on.road.2008$Emissions, na.rm = TRUE)

pm.non.road.1999 <- subset(pm.baltimore, type=="NON-ROAD" & year==1999)
pm.non.road.1999 <- sum(pm.non.road.1999$Emissions, na.rm = TRUE)
pm.non.road.2008 <- subset(pm.baltimore, type=="NON-ROAD" & year==2008)
pm.non.road.2008 <- sum(pm.non.road.2008$Emissions, na.rm = TRUE)


Year <- c(rep(1999, 4), c(rep(2008, 4)))
Emissions <- c(pm.point.1999,pm.nonpoint.1999,pm.on.road.1999,pm.non.road.1999,
               pm.point.2008,pm.nonpoint.2008,pm.on.road.2008,pm.non.road.2008)
Type <- c("point","nonpoint","on-road","non-road",
          "point","nonpoint","on-road","non-road")

d <- data.frame(Year, Emissions, Type)

g <- ggplot(d, aes(Year, Emissions))
g <- g + geom_point(size=2) + facet_grid(. ~ Type) + geom_line() +
         labs(title="pm2.5 Emission Change 1999 to 2008: Four Sources")

ggsave("plot3.png", plot=g)