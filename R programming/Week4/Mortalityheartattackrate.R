#0 Loading data into R and summarizing data
outcome<-read.csv("outcome-of-care-measures.csv")
hospital<-read.csv("hospital-data.csv")
str(outcome)
str(hospital)
#1 Plot the 30-day mortality rates for heart attack
head(outcome)
hist(as.numeric(outcome[,11]))