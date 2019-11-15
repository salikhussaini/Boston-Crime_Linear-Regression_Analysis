install.packages("tidyverse")

library(ggplot2)

ggplot(Boston_Crime_clean_V7, aes(x = as.factor(SHOOTING), y = Population)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("Shooting") +
  ylab("Population") +
  ggtitle("Population by Shooting") +
  theme(plot.title = element_text(hjust = 0.5))
