best<-function(state,outcomes)
{ outcome<-read.csv("outcome-of-care-measures.csv")
x<-character()     
if(!state %in% outcome$State)
  stop("Invalid state")
else
  x<-state 
if(outcomes == "heart attack")
{
  out<-11
}else if (outcomes=="heart failure")
{
  out<-17
}else if(outcomes =="pneumonia")
{
  out<-23
}else
  stop("Invalid outcome")

new_outcome<-outcome[outcome$State==x,]
values<-as.numeric(as.vector(new_outcome[,out]))
minrate<-min(values,na.rm=TRUE)
hospi<-as.vector(new_outcome[minrate==values,2])
sort(hospi)[1]
}
