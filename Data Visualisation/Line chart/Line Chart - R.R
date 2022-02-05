library(ggplot2)
library(reshape2)
library(plyr)
mydata = read.csv("line_chart_data.csv",
                  header = TRUE,
                  sep = ",")
mydata

mydata$Date <- as.Date(mydata$Date,
                       format = "%m/%d/%Y")
mydata

mydata <- melt(mydata,
               id= "Date")
mydata

mydata <- rename(mydata, 
                 c("variable" = "Index",
                   "value"= "Returns"))
mydata

line_chart <- ggplot(mydata, aes(x = Date,
                                 y = Returns,
                                 colour = Index,
                                 group = Index))+
  geom_line(aes(color = Index),
            size = 1)+
  theme_minimal()+
  scale_color_manual(values = c("navyblue", "red4")) +
  theme(legend.justification = c(0.01, 1),
        legend.position = c(0.01, 1))+
  ggtitle("S&P vs FTSE 2000 - 2010")

line_chart

startDate = as.Date("2008-07-01")
endDate = as.Date("2008-12-21")
line_chart_H2_2008 <- ggplot(mydata, aes(x = Date,
                                         y = Returns,
                                         colour = Index,
                                         group = Index))+
  geom_line(aes(color = Index),
            size = 1)+
  theme_minimal()+
  scale_color_manual(values = c("navyblue", "red4")) +
  theme(legend.justification = c(0.01, 1),
        legend.position = c(0.01, 1))+
  scale_x_date(limits = c(startDate, endDate))+
  ggtitle("S&P vs FTSE H2 - 2008")

line_chart_H2_2008
