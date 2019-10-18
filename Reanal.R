Max.scale <- 2000
ggplot(Bal.xts, aes(x=Index, y=Prec)) +
    geom_bar(stat="identity", fill ="lightblue") +
    labs(x="") +
    scale_y_reverse(name = "", breaks = c(0,500,1000, 1500, 2000),
                    labels = c(0, 500,1000,10,5),
                    sec.axis = sec_axis(~.*10, name = "Water level [cm]",
                                        breaks = c(5000,10000,15000,20000),
                                        labels = c(300,200,100,0))
                    ) +
    expand_limits(y=c(0, Max.scale)) +
    geom_line(aes(y = (Max.scale - Temp*100 + 500)), colour = "red") +
    geom_line(aes(y = (Max.scale - WLev*10)), colour = "blue")

