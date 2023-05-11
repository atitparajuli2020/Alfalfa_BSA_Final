## Plotting PCA after calculating PCs from whole genome SNP data from three locations 
## Prosser, Utah and Wisconsin using Tassel software

## setting the working directory

setwd ("~/Desktop")

# loading the data file 

pca<- read.table("pca.txt", head=TRUE )
attach(pca)
pca$Location<-as.factor(pca$Location)
pca$Health <- as.factor(pca$Health)

## to use two different shapes with filled and open in ggplot do this

filename$inter <- with (filename,interaction(variable1,variable2))
                        
 ## then at some point use > filename$inter <- c(15,0,16,1)
 ## this will provide 4 different combination of shapes               
 
 ## loading visualization library, ggplot2 in this case                    
 library(ggplot2)
 library(tidyverse)
 library(RNHANES)
 ## plotting basic scatter plot using 2 PCs (test)
 ggplot (pca, aes(x=pca$PC1, y= pca$PC2)) + geom_point(aes(shape=factor(pca$Health),size=3))
 
 ## separating the samples by health and location as well
 ggplot (pca, aes(x= pca$PC1, y=pca$PC2)) + geom_point(aes(col=factor(pca$Location), shape=factor(pca$Health)))
 
 
 ## solid circle for strong and open circle for weak samples, here scale_shape_manual customizes the shapes into 1 - open circle and 19 solid circle
 ggplot(pca, aes(pca$PC1,pca$PC2))+ geom_point(aes(col=factor(pca$Location),shape=factor(pca$Health))) + 
   scale_shape_manual(values=c(1,20))
 
 ## complete graph with labels and legends maintained
 ## here both health and location are used as factors, the shape is customized manually using scale_shape_manual function
 ## legend of shape is not shown using guide = "none" inside scale_shape_manual while that of color is provided using
 ## scale_color_discrete (name = "Legend title)
 ## PC 1 and PC 2   
 
 ggplot(pca, aes(PC1,PC2)) + 
   geom_point(aes(shape=factor(Health),col=factor(Location)),size=8,stroke=1) +          ## here the stroke is used to darken the border of the circles (points)
   scale_shape_manual(values=c(1,20),guide="none") + 
   scale_color_discrete(name = "Location") + 
   theme(legend.text = element_text(size=16),legend.title=element_text(size=22,face="bold"),legend.position = c(.1,.9)) + 
   xlab("Principal Component 1 (10.13 %)") + 
   ylab("Principal Component 2 (4.66 %)") + 
   #ggtitle(" Principal Component Analysis using SNPs from whole genome") +
   theme (panel.background = element_rect(fill="transparent",color="black"),plot.title = element_text(hjust=0.5,size=16)) +
   theme(axis.text.x = element_text(size = 16),axis.title.x = element_text(size=26),axis.text.y = element_text(size=16),axis.title.y = element_text(size=26))
 #+ geom_text(aes(label=pca$Taxa))    ## used for labelling the data points (here it is labelled based on taxa names)
 
 ## PCs 2 and 3
 
 ggplot(pca, aes(PC2,PC3)) + 
   geom_point(aes(shape=factor(Health),col=factor(Location)),size=8,stroke=1) + 
   scale_shape_manual(values=c(1,20),guide="none") + 
   scale_color_discrete(name = "Location") + 
   theme(legend.text = element_text(size=16),legend.title=element_text(size=22,face="bold"),legend.position = c(0.1,0.9)) + 
   xlab("Principal Component 2 (4.66 %)") + 
   ylab("Principal Component 3 (3.79 %)") + 
   #ggtitle(" Principal Component Analysis using SNPs from whole genome") +
   theme (panel.background = element_rect(fill="transparent",color="black"),plot.title = element_text(hjust=0.5,size=16)) +
   theme(axis.text.x = element_text(size = 16),axis.title.x = element_text(size=26),axis.text.y = element_text(size=16),axis.title.y = element_text(size=26))
 
 ## PCs 1 and 3
 
 ggplot(pca, aes(PC1,PC3)) + 
   geom_point(aes(shape=factor(Health),col=factor(Location)),size=8,stroke = 1) + 
   scale_shape_manual(values=c(1,20),guide="none") + 
   scale_color_discrete(name = "Location") + 
   theme(legend.text = element_text(size=16),legend.title=element_text(size=22,face="bold"),legend.position = c(0.1,0.9)) + 
   xlab("Principal Component 1 (10.13 %)") + 
   ylab("Principal Component 3 (3.79 %)") + 
   #ggtitle(" Principal Component Analysis using SNPs from whole genome") +
   theme (panel.background = element_rect(fill="transparent",color="black"),plot.title = element_text(hjust=0.5,size=16)) +
   theme(axis.text.x = element_text(size = 16),axis.title.x = element_text(size=26),axis.text.y = element_text(size=16),axis.title.y = element_text(size=26))
 
 ## for removing legend in ggplot use show.legend = FALSE inside the shape aesthetics e.g. geom_point(aes(show.legend=FALSE))
 
 ## loading scatterplot3d 
 
 library(scatterplot3d)
 #scatterplot3d (PC1,PC2,PC3)  ## basic 3d scatterplot
 
 ## changing the shapes based on groups
 shapes = c(1,20)
 shapes <- shapes[as.numeric(pca$Health)]
 
 scatterplot3d(PC1,PC2,PC3,pch=shapes,cex.symbols = 2.5,angle=35)
 
 ## changing color along with shapes         ## for changing the axis label size cex.lab, for axis ticks cex.axis using cex only changes 
 ## figure shapes size
 colors <- c("orangered2", "forestgreen", "royalblue1")
 colors <- colors[as.numeric(pca$Location)]
 
 scatterplot3d(PC1,PC2,PC3,pch=shapes, cex.symbols = 3.5, cex.lab  = 2,angle=40,color = colors,grid = FALSE, xlab = "Principal Component 1 ( 10.13 %)",
               ylab = " Principal Component 2 ( 4.66 %)", zlab = " Principal Component 3 ( 3.79 %)")
 legend("topleft",legend=levels(pca$Location),col=c("orangered2","forestgreen","royalblue1"),pch=16)
 
 #mar function is used to set the margin of the plot
 scatterplot3d(PC1,PC2,PC3,pch=shapes, cex.symbols = 3.5, cex.lab  = 3.2,angle=40,color = colors,grid = FALSE, xlab = "Principal Component 1 ( 10.13 %)",
               ylab = " Principal Component 2 ( 4.66 %)", zlab = " Principal Component 3 ( 3.79 %)",mar=c(5,5,4,4))
 
 
 
 ## CMplot for manhattan plot 
 
 CMplot(depth,type="p",plot.type = "m",LOG10 = TRUE,threshold = c(5.18e-07,8.18e-08),threshold.lty = c(2,1),file="jpg",
        col=c("indianred3","orange","forestgreen","deepskyblue3"),memo="",file.output = TRUE,verbose = TRUE,width = 14,height=6)                        
                       
