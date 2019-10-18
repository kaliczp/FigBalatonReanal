ggplot(Bal.xts, aes(x=Index, y=Prec)) +
    geom_bar(stat="identity", fill ="lightblue") +
    labs(x="", y="Precipitation [mm]") +
    scale_y_reverse() +
    expand_limits(y=c(0, 1500)) +
    geom_line(aes(y = (1500 - Temp*80))) +
    geom_line(aes(y = (1500 - WLev*10)))
