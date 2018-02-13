rankhospital<-function(state,outcomes,rank)
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
states<-outcome[outcome$State==x,]

View(states)
mortrates<-as.numeric(as.vector(states[,out]))
if(rank=="best")
{
  value<-min(mortrates,na.rm=TRUE)
 
}
if(rank=="worst")
{
  value<-max(mortrates,na.rm=TRUE)
}
else{
minrates<-sort(mortrates)
value<-minrates[rank]
}
hospi<-as.vector(states[value==mortrates,2])
hospia<-sort(hospi,decreasing=TRUE)[1]
hospia

}