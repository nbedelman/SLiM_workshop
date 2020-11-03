#!/usr/bin/env Rscript

library(ggplot2)
library(tidyverse)
library(zoo)


args = commandArgs(trailingOnly=TRUE)
fixedDiffs=as.integer(strsplit(args[1], ",")[[1]])
Dxy=as.integer(strsplit(args[2], ",")[[1]])
gens=as.integer(strsplit(args[3], ",")[[1]])
pdfPlot=args[4]



demoData <- data.frame(gens=gens, fixedDiffs=fixedDiffs, Dxy=Dxy)# %>%
head(demoData)
  #mutate(.,meanFix=c(rep(0,9),rollmean(demoData$fixedDiffs,10)))


demoOverTime <- ggplot(data=demoData)+
  geom_point(aes(x=gens, y=fixedDiffs),col="blue")+
  geom_line(aes(x=gens,y=1e-7*(gens-10000)*100000))

ggsave(pdfPlot,demoOverTime)


# quartz(width=4, height=4, type="pdf", file=pdfPlot) 
# demoOverTime
# dev.off()


# demoOverTime <- ggplot(data=demoData)+
#   geom_point(aes(x=gen, y=Dxy, pch=as.factor(popSize)),col="blue")
#   #geom_line(aes(x=gen,y=1e-7*(gen-10000)*100000))
# demoOverTime
