library(ggplot2)

data = read.csv("all.runs.txt")

bpns = subset(data, experiment %in% c("BPNS_embed", "BPNS_no_embed"))
bpns$condition = bpns$condition[drop=T]

bpns = subset(bpns, condition != "BAD")
bpns$condition = bpns$condition[drop=T]

agr = subset(data, experiment %in% c("agr_embed", "agr_no_embed"))
agr$condition = agr$condition[drop=T]

#rm this
bpns = subset(bpns, match.penalty == -1)

all_plot  = ggplot(data) + 
           geom_density(aes(model, color=condition)) + 
           facet_grid(experiment ~ .) + 
           scale_x_continuous(limits=c(0,100)) +
           labs(x = "% Error", y = "Density", colour = "Condition", title = "ACT-R modeling of BP null subjects") +
           theme_bw()
#
#bpns_plot = ggplot(bpns) + 
#            geom_density(aes(model, color=condition)) + 
#            facet_grid(. ~ experiment) + 
#            scale_x_continuous(limits=c(0,100)) +
#            labs(x = "% Error", y = "Density", colour = "Condition", title = "ACT-R modeling of BP null subjects") +
#            theme_bw()
            #coord_cartesian(ylim = c(0, 0.1))
#
#agr_plot  = ggplot(agr) + 
#            geom_density(aes(model, color=condition)) + 
#            facet_grid(match.penalty ~ experiment) +
#            scale_x_continuous(limits=c(0,100)) +
#            labs(x = "% Error", y = "Density", colour = "Condition", title = "ACT-R modeling of BP agreement") +
#            theme_bw()




print(bpns_plot)
#print(agr_plot)
print(all_plot)

#cond.gp = subset(lat.m, variable %in% c("V1", "V5", "V9",  "V13", "V17"))
#cond.gp = data.frame(condition="gp", subset(lat.m, variable %in% c("V1", "V5", "V9",  "V13", "V17")))
#cond.gp$variable = cond.gp$variable[drop=T]
#
#cond.gs = subset(lat.m, variable %in% c("V2", "V6", "V10",  "V14", "V18"))
#cond.gs = data.frame(condition="gs", subset(lat.m, variable %in% c("V1", "V5", "V9",  "V13", "V17")))
#cond.gs$variable = cond.gs$variable[drop=T]
#
#cond.up = subset(lat.m, variable %in% c("V3", "V7", "V11",  "V15", "V19"))
#cond.up = data.frame(condition="up", subset(lat.m, variable %in% c("V1", "V5", "V9",  "V13", "V17")))
#cond.up$variable = cond.up$variable[drop=T]
#
#cond.us = subset(lat.m, variable %in% c("V4", "V8", "V12",  "V16", "V20"))
#cond.us = data.frame(condition="us", subset(lat.m, variable %in% c("V1", "V5", "V9",  "V13", "V17")))
#cond.us$variable = cond.us$variable[drop=T]
#
#latency = rbind(cond.gp, cond.gs, cond.up, cond.us)
#latency = data.frame(latency, params=1:5)
