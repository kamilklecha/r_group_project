library(tidyverse)

df <- tribble(
  ~date, ~mask, ~no_mask,
  "12/7/2020", 25.2, 9.9,
  "13/7/2020", 19.8, 9.3,
  "14/7/2020", 19.7, 9.5,
  "15/7/2020", 20.6, 9.8,
  "16/7/2020", 19.9, 9.9,
  "17/7/2020", 19.9, 9.6,
  "18/7/2020", 20.6, 9.6,
  "19/7/2020", 19.9, 9.0,
  "20/7/2020", 20.5, 8.4,
  "21/7/2020", 21.3, 8.4,
  "22/7/2020", 19.6, 8.5,
  "23/7/2020", 19.6, 8.3,
  "24/7/2020", 20.3, 9.9,
  "25/7/2020", 19.0, 9.9,
  "26/7/2020", 19.7, 10.1,
  "27/7/2020", 17.0, 9.7,
  "28/7/2020", 16.3, 9.7,
  "29/7/2020", 16.4, 9.7,
  "30/7/2020", 16.5, 10.0,
  "31/7/2020", 16.0, 8.9,
  "1/8/2020", 16.2, 9.1,
  "2/8/2020", 15.9, 8.9,
  "3/8/2020", 16.0, 9.2,
)

dates = seq(as.Date('2020-7-12'), as.Date('2020-8-3'), by = "day")
df$date = dates

#making dataframe with daily difference
daily_mask = ave(df$mask, FUN=function(x) c(NA,diff(x)))
daily_no_mask = ave(df$no_mask, FUN=function(x) c(NA,diff(x)))
df_daily = data.frame(df)
df_daily$mask = daily_mask
df_daily$no_mask = daily_no_mask
df_daily = df_daily[-1,] #i remove first element since there is no previous value to differ
df_daily




plot_regular = ggplot(df, aes(x=date)) +
  geom_path(aes(y=mask, group=1, color="Mask"), size=1.5) +
  geom_path(aes(y=no_mask, group=1, color="No Mask"), size=1.5) +
  labs(x="Date", y="Average cases", color="Counties",
       title="7-day rolling average of daily cases/100K population")


#daily df wide to long
df_daily$date = factor(df_daily$date)
df_daily_long = gather(df_daily, ifmasked, cases, mask, no_mask)


plot_daily = ggplot(df_daily_long, aes(x = date, y = cases, fill = ifmasked)) +
  geom_col( position = "dodge") +
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(x="Date", y="Change of the average", fill="Counties",
       title="Daily change between 7-day rolling average of daily cases/100K population")



plot(plot_daily)
plot(plot_regular)


  
  
  