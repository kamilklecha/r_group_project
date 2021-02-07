library(tidyverse)

df <- tribble(
  ~date, ~mask, ~nomask,
  "12/7/2020", 25.2, 20.9,
  "13/7/2020", 19.8, 20.3,
  "14/7/2020", 19.7, 20.5,
  "15/7/2020", 20.6, 20.8,
  "16/7/2020", 19.9, 20.9,
  "17/7/2020", 19.9, 20.6,
  "18/7/2020", 20.6, 20.6,
  "19/7/2020", 19., 20.5 #tu koniec
  "20/7/2020", 19, 20.5,
  "21/7/2020", 11.8, 20.5,
  "22/7/2020", 11.8, 20.5,
  "23/7/2020", 11.8, 20.5,
  "24/7/2020", 11.8, 20.5,
)


plot_A = ggplot(df, aes(x=date)) +
  geom_path(aes(y=mask, group=1, color="Mask"), size=2) +
  geom_path(aes(y=nomask, group=1, color="No Mask"), size=2)

plot(plot_A)
  