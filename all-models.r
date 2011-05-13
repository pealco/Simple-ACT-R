########################################################################################################
###
###  Simple Memory Retrieval Model of Agreement Phenomena (based on ACT-R theory)
###
###  Original code by:
###  Rick Lewis & William Badecker (rickl@umich.edu)
###
###  Simplified and modified by:
###  Pedro Alcocer (pealco@umd.edu)
###
###  Version 3.1
###  26 Apr 2011
###
########################################################################################################

library(reshape)
library(gplots)
library(doMC)

registerDoMC()

source("run-model.r")

history = NULL

## Experiment definitions
source("experiments.r")

## Parameter settings
source("parameters.r")


## Generate matrix defining combinatoric space of parameter values.
## Each column is a parameter; each row is a distinct comabination of 
## parameters defining a model simulation to run.

parameters = list(cat.penalty, F, G, ans, mas, d, match.penalty, VAR.fan, var.mismatch.penalty,
                   modulate.by.distinct, distinctiveness)
num.parameters = length(parameters)


## The total number of combinations is the product of the number of values
## for each parameter
num.combinations = prod(as.vector(lapply(parameters, length), mode="integer"))


## Set up matrix of parameter combinations.  Rows are model experiments,
## columns are parameters.
num.params = length(parameters)
p.matrix = matrix(nrow=num.combinations, ncol=num.params)

cumulative.num.combs = 1
for (p in 1:num.params) {
  p.matrix[,p] = rep(parameters[p][[1]], each=cumulative.num.combs, length.out=num.combinations)
  cumulative.num.combs = cumulative.num.combs * length(parameters[p][[1]])
}



##  Now set up matrix of unique model runs.
count.conditions = function(e) {
  length(e$conditions)
}

total.conditions = sum(as.vector(lapply(experiments, count.conditions),
                                  mode="integer"))
model.runs = data.frame()

for (e in 1:num.experiments) {
  exp.name = experiments[[e]]$name
  for (c in 1:length(experiments[[e]]$conditions)) {
    cond = experiments[[e]]$conditions[[c]]
    
    model.runs = rbind(model.runs,
        data.frame(experiment                = rep(exp.name,num.combinations),
                   condition                 = rep(cond$condition, num.combinations),
                   retrievals                = rep(cond$retrievals, num.combinations),
                   items                     = rep(cond$items, num.combinations),
                   critical.retrieval        = rep(cond$critical.retrieval, num.combinations),
                   correct.item              = rep(cond$correct.item, num.combinations),
                   distractor.item           = rep(cond$distractor.item, num.combinations),
                   model                     = rep(NA, num.combinations)
                   )
                )
  }
}



# Duplicate the parameter matrix "total.conditions" number of times.
total.runs = total.conditions * num.combinations

full.parameter.matrix = matrix(data=t(p.matrix), nrow=total.runs,
                                ncol=num.params, byrow=TRUE)
colnames(full.parameter.matrix) = c("cat.penalty", "F", "G", "ans", "mas", "d", "match.penalty", "VAR.fan",
                                     "var.mismatch.penalty", "modulate.by.distinct", "distinctiveness")


## Finally, form the complete model run matrix.
all.runs = as.data.frame(cbind(full.parameter.matrix, model.runs))
final.samples = matrix(data=NA, nrow=default.trials, ncol=total.runs)

## Loop over all runs and run the models

#pdf(file="output/activation-plots.pdf",width=11,height=5)

all.model.results = foreach(r = 1:total.runs, .combine="rbind") %do% {
    print(paste("Executing run #",r,"of",total.runs))
    
    ## select out row corresponding to this run
    this.run = all.runs[r,]      
    
    ## now set the model parameters according to this combination of values
    set.parameters(this.run[1:num.parameters])
    
    ## and run the model
    item.file = as.character(this.run$items)
    retrieval.file = as.character(this.run$retrievals)

    
    results = run.model()
    
    #plot.activation(moments, history, this.run$correct.item, this.run$distractor.item, this.run$experiment, this.run$condition);
        
    ## now extract the relevant measures.
    
    # Percent error.
    crit.ret = results$summary[[this.run$critical.retrieval]]
    model.result = crit.ret$retrieval.prob[this.run$distractor.item] * 100
    
    # Latency.
    final.samples[,r] = results$latencies[[this.run$critical.retrieval]]
    
    model.result
}

for (r in 1:total.runs) {
    all.runs[r,]$model = all.model.results[r,]
}
#dev.off()


write.csv(all.runs, "output/all.runs.txt")
write.csv(final.samples, "output/final.samples.txt")









