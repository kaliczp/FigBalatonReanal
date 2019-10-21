library(zoo)
library(ggplot2)
Bal.zoo <- read.zoo("Balaton.txt", head=T)

.expressions <- c('Precipitation~group("[",mm,"]")', 'Temperature~group("[",degree*C,"]")')
y_axis_expressions <- parse(text = .expressions)

ggplot(Bal.zoo, aes(x=Index, y=Prec)) +
    geom_bar(stat="identity", fill ="blue")+
    labs(x="") +
    coord_cartesian(xlim=range(index(Bal.zoo)) + c(310,-310),
                    ylim= c(-1.44,0.4), clip = 'off') +
    geom_line(aes(y = ((WLev-145)/100))) +
    geom_line(aes(y = (Temp-1.15)), colour = "red") +
    annotate(min(index(Bal.zoo)) - 700, y=c(0, -1.25),
             label = c('Precipitation [%]', 'Temperature [%]'),
             geom="text", angle=90, hjust=0.5, size=4,
             colour=c("blue", "red")) +
    scale_y_continuous(name = "",
                       breaks = c(0.25,0,-0.25, -0.9, -1.15, -1.4),
                       labels = c(25, 0, -25, 25, 0, -25),
                       sec.axis = sec_axis(~ . ,
                                           name = 'Water level [cm]',
                                           breaks = c(-0.25,-0.58,-0.9),
                                           labels = c(120,90,60)
                                           )
                       )


    expand_limits(y=c(0, Max.scale)) +



ggsave("reanal.jpg")
