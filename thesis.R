install.packages("knitr")
install.packages("ggplot2", dependencies = TRUE)

library(ggplot2)
library(knitr)

bcog <- read.csv("bcog/processed_results.csv")
pcog <- read.csv("pcog/processed_results.csv")
rcog <- read.csv("rcog/processed_results.csv")
qcog <- read.csv("qcog/processed_results.csv")
spcog <- read.csv("StaticPOMDP/processed_results.csv")

kframe <- rbind(data.frame(fill="blue", kills=bcog$kills, type="bcog"),
            data.frame(fill="green", kills=pcog$kills, type="pcog"),
            data.frame(fill="pink", kills=spcog$kills, type="spcog"),
            data.frame(fill="orange", kills=qcog$kills, type="qcog"),
            data.frame(fill="red", kills=rcog$kills, type="rcog"))

ggplot(kframe, aes(x=kills, fill=type)) +
  geom_histogram(binwidth=1, colour="black", position="dodge")

svframe <- rbind(data.frame(fill="blue", survival_time=bcog$surival_time, type="bcog"),
                data.frame(fill="green", survival_time=pcog$surival_time, type="pcog"),
                data.frame(fill="pink", survival_time=spcog$surival_time, type="spcog"),
                data.frame(fill="orange", survival_time=qcog$surival_time, type="qcog"))

ggplot(svframe, aes(x=survival_time, fill=type)) +
  geom_histogram(binwidth=100, colour="black", position="dodge") +
  facet_grid(type~.)

sframe <- rbind(data.frame(fill="blue", score=bcog$score, type="bcog"),
                data.frame(fill="green", score=pcog$score, type="pcog"),
                data.frame(fill="pink", score=spcog$score, type="spcog"),
                data.frame(fill="orange", score=qcog$score, type="qcog"))

ggplot(sframe, aes(x=score, fill=type)) +
  geom_histogram(binwidth=1, colour="black", position="dodge") +
  facet_grid(type~.)

shapiro.test(bcog$kills)
shapiro.test(bcog$surival_time)
shapiro.test(bcog$score)

hist(bcog$score)
hist(bcog$kills)
hist(bcog$surival_time)

shapiro.test(pcog$kills)
shapiro.test(pcog$surival_time)
shapiro.test(pcog$score)

hist(pcog$score)
hist(pcog$kills)
hist(pcog$surival_time)

shapiro.test(spcog$kills)
shapiro.test(spcog$surival_time)
shapiro.test(spcog$score)
hist(spcog$score)
hist(spcog$kills)
hist(spcog$surival_time)

ks.test(bcog$kills, pcog$kills)
ks.test(bcog$kills, rcog$kills)
ks.test(bcog$kills, spcog$kills)
ks.test(rcog$kills, pcog$kills)
ks.test(pcog$kills, spcog$kills)
ks.test(pcog$kills, qcog$kills)

ks.test(bcog$surival_time, pcog$surival_time)
ks.test(bcog$surival_time, rcog$surival_time)
ks.test(bcog$surival_time, spcog$surival_time)
ks.test(rcog$surival_time, pcog$surival_time)
ks.test(pcog$surival_time, spcog$surival_time)
ks.test(pcog$surival_time, qcog$surival_time)

ks.test(bcog$score, pcog$score)
ks.test(bcog$score, rcog$score)
ks.test(bcog$score, spcog$score)
ks.test(rcog$score, pcog$score)
ks.test(pcog$score, spcog$score)
ks.test(spcog$score, qcog$score)
ks.test(qcog$score, pcog$score)

summary(pcog$kills)
summary(spcog$kills)
summary(bcog$kills)
summary(qcog$kills)
summary(rcog$kills)

summary(pcog$score)
summary(spcog$score)
summary(bcog$score)
summary(qcog$score)
summary(rcog$score)

summary(pcog$surival_time)
summary(spcog$surival_time)
summary(bcog$surival_time)
summary(qcog$surival_time)
summary(rcog$surival_time)

# Means
mean(pcog$kills)
mean(spcog$kills)
mean(bcog$kills)
mean(qcog$kills)
mean(rcog$kills)

mean(pcog$score)
mean(spcog$score)
mean(bcog$score)
mean(qcog$score)
mean(rcog$score)

mean(pcog$surival_time)
mean(spcog$surival_time)
mean(bcog$surival_time)
mean(qcog$surival_time)
mean(rcog$surival_time)
