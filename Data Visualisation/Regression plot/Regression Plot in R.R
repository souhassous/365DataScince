library(ggplot2)

df <- read.csv("scatter_plot_ii.csv",
               header = TRUE,
               sep = ",")
df
regPlot <- ggplot(data = df,
                  aes(x = Budget,y = Sales)) +
  geom_point(size = 3,
             color = "grey12") +
  geom_smooth(method = "lm",
              color = "red",
              fill = "red") +
  theme_classic() + 
  xlab("Ad Expenditure (K$)") + 
  ylab("Sales (KUnits)") + 
  ggtitle("Effect of Ad Expenditure on Sales")
regPlot
