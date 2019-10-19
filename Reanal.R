Max.scale <- 2000
ggplot(Bal.xts, aes(x=Index, y=Prec)) +
    geom_bar(stat="identity", fill ="blue") +
    labs(x="") +
    scale_y_reverse(name = "", breaks = c(0,500,1000, 1500, 2000),
                    labels = c(0, 500,1000,10,5),
                    sec.axis = sec_axis(~.*10, name = "Water level [cm]",
                                        breaks = c(5000,10000,15000,20000),
                                        labels = c(300,200,100,0))
                    ) +
    expand_limits(y=c(0, Max.scale)) +
    geom_line(aes(y = (Max.scale - Temp*100 + 500)), colour = "red") +
    geom_line(aes(y = (Max.scale - WLev*10))) +
    coord_cartesian(xlim=range(index(Bal.xts)) + c(310,-310),
                    ylim= c(Max.scale,0) + c(-80, 80), clip = 'off') +
    annotate(min(index(Bal.xts)) - 1000, y=c(500,1750),
             label=c("Precipitation [mm]","Temperature [C]"),
             geom="text", angle=90, hjust=0.5, size=4,
             colour=c("blue", "red"))

ggsave("reanal.pdf")
