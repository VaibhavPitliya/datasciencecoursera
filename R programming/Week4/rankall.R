rankall<-function(outcomes,rank="best"){
  #Reading Data
  outcome<-read.csv("outcome-of-care-measures.csv")
  #Name of all states
  s<- as.vector(sort(unique(outcome$State)))
  
  #Checking if outcomes are valid
  if(outcomes == "heart attack"){
    out=11
  }else if (outcomes=="heart failure"){
    out=17
  }else if(outcomes =="pneumonia"){
    out=23
  }
  else{
    stop("Invalid outcome")
  }
  #Intializing a empty character vector 
  n <- length(s)
  hospital <- character(n)
  state <- character(n)
  
  #Running a loop for each state
  for(i in 1:n){
    states<-outcome[outcome$State==s[i],]
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
      value<- sort(mortrates[!is.na(mortrates)])[rank]
      
    }
    minhosp <- as.vector(states[mortrates == value, 2])
    hospital[i] <- sort(minhosp, decreasing = TRUE)[1]
    state[i] <- s[i]
    
  }
  data.frame(hospital,state)
}