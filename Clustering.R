install.packages("ggfortify")

library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

Wine_Data <-read_excel("WineData.xlsx")
Wine_Data <- Wine_Data[,-1]
names(Wine_Data) <- c( "Alcohol","Malic acid","Ash", "Alcalinity of ash","Magnesium","Total phenols","Flavanoids","Nonflavanoid phenols","Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline" )
View(Wine_Data)

boxplot(Wine_Data$Alcohol, plot=FALSE)$out
outliers <- boxplot(Wine_Data$Alcohol, plot=FALSE)$out
View(outliers)
x<-Wine_Data 
View(x)
x<- x[-which(x$Alcohol %in% outliers),]


head(Wine_Data)
par(mfrow=c(1, 2))
plot(Wine_Data)


plot(Wine_Data[,2:4])
kc = kmeans(Wine_Data[2:4], 3)

par(mfrow=c(1, 2))
plot(Wine_Data[,3:4], col=kc$cluster)
points(kc$centers[,2:3], col=1:2, pch=8, cex=3)



#Those were few stuff tried to extend on the areas

#dis = dist(Wine_Data[2:4], method="euclidean")
#Wine_Data_Ave = hclust(dis, method="ave")
#plot(Wine_Data_Ave, hang=-1, labels=Wine_Data_Ave$Alcohol, cex.main = 0.75, cex.axis = 0.5)
#rect.hclust(Wine_Data_Ave, k=3, border="blue")


#Wine_Data_AveCut = cutree(Wine_Data_Ave, k=3)
#table(Wine_Data$Alcohol, Wine_Data_AveCut)

#par(mfcol=c(1,2))
#plot(Wine_Data[,1:2], col=Wine_Data_AveCut, cex.main = 0.75)
#plot(Wine_Data[,1:2], col=Wine_Data_AveCut, cex.main = 0.75)


