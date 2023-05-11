

## Loading packages and source code
library('MASS') 
library(multtest)
library(gplots)
library("scatterplot3d")
library(compiler)
library(rrBLUP)
#source("http://www.zzlab.net/GAPIT/gapit_functions.txt")
#source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("~/Desktop/command/gapit_function.txt")  ## old source code
source("~/Desktop/Atit/gapit_source_code.txt")  ## new source code

# loading the phenotype file and Genotype file 
## (Number of Samples 121, markers 591,919)

## using hapmap file
setwd("~/Desktop/BSA_GWAS")
myY <- read.delim("phenotype_file.txt",head=TRUE)
myG <- read.delim("hapmap110.hmp.txt", header = FALSE)
myCV=read.delim("covariates.txt",head=TRUE)

##
## using numeric file and map file
#myY <- read.delim("phenotype_file.txt",head=TRUE)
#myCV=read.delim("covariates.txt",head=TRUE)
#myGD<- read.delim("snp_file.txt",head=TRUE)
#myGM = read.delim("map_file_filter.txt", header = TRUE)

## In case of using the numeric file and map file for any other analysis purpose
##  to generate numeric file and map file
## output<-GAPIT(G=myG,output.numerical = TRUE)



# running GAPIT using FarmCPU 

myGAPIT <- GAPIT(Y=myY,
                 G=myG,
                 PCA.total = 3, 
                 model = "Farmcpu",
                 file.output = T,
                 CV=myCV)
