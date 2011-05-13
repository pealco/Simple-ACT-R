## Experiment definitions

bp_embed = list(
    name = "BPNS_embed",
    description ="Brazilian Portuguese Null Subjects w/ embed as cue",
    conditions = list(
        list(
            condition = "GOOD",
            retrievals = "experiment_definitions/NS_with_embed/bp-good-retrievals.txt",
            items      = "experiment_definitions/NS_with_embed/bp-good-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2),   # second retrieval is critical

        list(
            condition = "BAD",
            retrievals = "experiment_definitions/NS_with_embed/bp-bad-retrievals.txt",
            items      = "experiment_definitions/NS_with_embed/bp-bad-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2),   

        list(
            condition = "INTERFERER",
            retrievals = "experiment_definitions/NS_with_embed/bp-interferer-retrievals.txt",
            items      = "experiment_definitions/NS_with_embed/bp-interferer-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2)
        )
    )

bp_no_embed = list(
    name = "BPNS_no_embed",
    description ="Brazilian Portuguese Null Subjects w/o embed as cue",
    conditions = list(
        list(
            condition = "GOOD",
            retrievals = "experiment_definitions/NS_without_embed/bp-good-retrievals.txt",
            items      = "experiment_definitions/NS_without_embed/bp-good-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2),   # second retrieval is critical

        list(
            condition = "BAD",
            retrievals = "experiment_definitions/NS_without_embed/bp-bad-retrievals.txt",
            items      = "experiment_definitions/NS_without_embed/bp-bad-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2),   

        list(
            condition = "INTERFERER",
            retrievals = "experiment_definitions/NS_without_embed/bp-interferer-retrievals.txt",
            items      = "experiment_definitions/NS_without_embed/bp-interferer-items.txt",
            correct.item = 1,
            distractor.item = 2,
            critical.retrieval = 2)
        )
    )

agr_embed = list(
    name = "agr_embed",
    description ="Brazilian Portuguese Subject-Verb Agreement w/ embed as cue",
    conditions = list(
        list(
            condition = "GP",
            retrievals = "experiment_definitions/agr_with_embed/agr-GP-retrievals.txt",
            items      = "experiment_definitions/agr_with_embed/agr-GP-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),

        list(
            condition = "GS",
            retrievals = "experiment_definitions/agr_with_embed/agr-GS-retrievals.txt",
            items      = "experiment_definitions/agr_with_embed/agr-GS-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),

        list(
            condition = "UP",
            retrievals = "experiment_definitions/agr_with_embed/agr-UP-retrievals.txt",
            items      = "experiment_definitions/agr_with_embed/agr-UP-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),
            
        list(
            condition = "US",
            retrievals = "experiment_definitions/agr_with_embed/agr-US-retrievals.txt",
            items      = "experiment_definitions/agr_with_embed/agr-US-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1)
        )
    )


agr_no_embed = list(
    name = "agr_no_embed",
    description ="Brazilian Portuguese Subject-Verb Agreement w/o embed as cue",
    conditions = list(
        list(
            condition = "GP",
            retrievals = "experiment_definitions/agr_without_embed/agr-GP-retrievals.txt",
            items      = "experiment_definitions/agr_without_embed/agr-GP-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),

        list(
            condition = "GS",
            retrievals = "experiment_definitions/agr_without_embed/agr-GS-retrievals.txt",
            items      = "experiment_definitions/agr_without_embed/agr-GS-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),

        list(
            condition = "UP",
            retrievals = "experiment_definitions/agr_without_embed/agr-UP-retrievals.txt",
            items      = "experiment_definitions/agr_without_embed/agr-UP-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1),
            
        list(
            condition = "US",
            retrievals = "experiment_definitions/agr_without_embed/agr-US-retrievals.txt",
            items      = "experiment_definitions/agr_without_embed/agr-US-items.txt",
            correct.item = 2,
            distractor.item = 1,
            critical.retrieval = 1)
        )
    )


## Complete list of experiments
experiments = list(bp_embed, bp_no_embed, agr_embed, agr_no_embed)
num.experiments = length(experiments)
