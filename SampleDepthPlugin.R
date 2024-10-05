library("derfinder")
library("derfinderData")
library("GenomicRanges")
library("knitr")

input <- function(inputfile) {
pheno <<- subset(brainspanPheno, structure_acronym == "AMY")
fullCov <<- readRDS(inputfile)
}

run <- function() {}

output <- function(outputfile) {

####################################################################################
# SAMPLE DEPTH
sampleDepths <- sampleDepth(collapseFullCoverage(fullCov), 1)
models <- makeModels(sampleDepths,
    testvars = pheno$group,
    adjustvars = pheno[, c("gender")]
)
lapply(models, head)
####################################################################################

saveRDS(models, outputfile)
}
