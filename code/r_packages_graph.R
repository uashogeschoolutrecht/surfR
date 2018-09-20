## install pacman for easy instalation of other packages
if(!require("pacman")) install.packages("pacman")
library(pacman)

## install other packages
p_load(zoo,
       plotly,
       tidyverse,
       rvest,
       XML,
       plotly
       )

## get packages data url
url <- "https://cran.r-project.org/web/packages/available_packages_by_date.html"

## extract data from url
page <- read_html(url)

page %>%
  html_node("table") %>%
  html_table() %>%
  mutate(count = rev(1:nrow(.))) %>%
  mutate(Date = as.Date(Date)) %>%
  mutate(Month = format(Date, format="%Y-%m")) %>%
  group_by(Month) %>%
  summarise(published = min(count)) %>%
  mutate(Date = as.Date(as.yearmon(Month))) -> pkgs

## generate graphs
p <- ggplot(data = pkgs, aes(x = Date, y = published))
plot <- p + geom_point() + geom_line() + theme_bw() +
  labs(title = "CRAN packages published from 2005 - yesterday") +
  xlab("Date")
plot

#ggsave("./images/cran_pkgs_published.png", plot = plot)
#margins = list(l = 100, r = 100, b = 100, t = 100, pad = 4)
#pkgs %>%
#  plot_ly(x=Date, y=published, name="Published packages") %>%
#  layout(title = "CRAN packages published ever since.", margin = margins)


