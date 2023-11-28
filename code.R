install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("ggpubr")
library("ggpubr")
library("tidyverse")
library("ggplot2")
library("dplyr")
renv::snapshot()

data(iris)
head(iris)
summary(iris)
str(iris)

iris <- as_tibble(iris)

#mean, irrespective of species
iris_mean <- iris %>%
  summarize_all(is.numeric,mean)

#mean, depending on species
iris_species <- iris %>% 
  group_by(Species) %>% 
  summarize_all(mean)

#creates a number of dotplots which each variable against the other
S_Length_SWidth <- ggplot(iris,aes(color = Species, y= Sepal.Length, x= Sepal.Width)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic() +
  theme(legend.position = "none")
P_Length_PWidth <- ggplot(iris,aes(color = Species, y= Petal.Length, x= Petal.Width)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic() +
  theme(legend.position = "none")
P_Length_SWidth <- ggplot(iris,aes(color = Species, y= Petal.Length, x= Sepal.Width)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic()+
  theme(legend.position = "none")
S_Length_PWidth <- ggplot(iris,aes(color = Species, y= Sepal.Length, x= Petal.Width)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic()+
  theme(legend.position = "none")
S_Length_PLength <- ggplot(iris,aes(color = Species, y= Sepal.Length, x= Petal.Length)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic() +
  theme(legend.position = "none")
S_Width_PWidth <- ggplot(iris,aes(color = Species, y= Sepal.Width, x= Petal.Width)) + 
  geom_point(alpha = 0.8, size = 2) +
  theme_classic() +
  theme(legend.position = "none")

#creates a number of boxplots per variable, depending on species
PWidth_Boxplot <- ggplot(iris,aes(color = Species, y= Petal.Width, x= Species)) + 
  geom_boxplot(size = 0.5) +
  theme_classic() +
  theme(legend.position = "none")
SWidth_Boxplot <- ggplot(iris,aes(color = Species, y= Sepal.Width, x= Species)) + 
  geom_boxplot(size = 0.5) +
  theme_classic() +
  theme(legend.position = "none")
Slength_Boxplot <- ggplot(iris,aes(color = Species, y= Sepal.Length, x= Species)) + 
  geom_boxplot(size = 0.5) +
  theme_classic() +
  theme(legend.position = "none")
PLength_Boxplot <- ggplot(iris,aes(color = Species, y= Petal.Length, x= Species)) + 
  geom_boxplot(size = 0.5) +
  theme_classic() +
  theme(legend.position = "none")


#arrangement of the graphs
a <- ggarrange(Slength_Boxplot +rremove("xlab"),  
          PLength_Boxplot +rremove("xlab"),
          SWidth_Boxplot +rremove("xlab"), 
          PWidth_Boxplot   +rremove("xlab"),
         ncol = 1, nrow = 4)

b <- ggarrange(S_Length_PWidth ,
               P_Length_PWidth ,
               S_Length_SWidth ,
               P_Length_SWidth ,
               S_Length_PLength ,
               S_Width_PWidth ,  
               ncol = 2, nrow = 3)

c <- ggarrange(b,a, nrow=1, ncol=2, widths=c(5,2))

renv::snapshot()
