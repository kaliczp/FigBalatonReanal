ggplot(Bal.xts, aes(x=Index, y=Prec)) +
    geom_bar(stat="identity", fill="lightblue") +
    labs(x="", y="Precipitation [mm]") +
    scale_y_reverse() +
    expand_limits(y=c(0, 1000))
