## Parameter settings

## number of monte carlo trials per experiment
default.trials = 5000

## Discrete parameter space to search.  Each parameter now contains a list
## of possible values rather than a single value.  

## Latency factor
F = c(0.85)

## Extra category penalty
cat.penalty = c(-999);

## Total source activation
#G = c(0.8, 1.0);
G = c(1.0);


## Activation noise parameter for logistic distribution
#ans  = seq(0.45, 0.6, 0.05)
ans  = c(0.45)

## Fan parameter
#mas = c(1.5, 2.0)
mas = c(1.5)


### Base level decay parameter
#d = c(1e-16, 0.5)
d = c(0.5)

## Match penalty
match.penalty = seq(-3, 0, 0.25) # From -1 to 0 in steps of 0.25
#match.penalty = c(-1.0)


## Following are non-ACT-R modifications that we turn off by default
var.mismatch.penalty = c(FALSE);
VAR.fan = c(0);    # additional fan associated with VAR retrieval cues
modulate.by.distinct = c(FALSE);
distinctiveness = c(0);                 # Note that the quantitative parameter has no
                                        # effect when modulate.by.distinct is FALSE. So this is some  wasted
                                        # effort in the simple code below.
