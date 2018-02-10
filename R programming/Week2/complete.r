complete<-function(directory,id=1:332){
  fileList<-list.files(path=directory,pattern=".csv",full.names=TRUE)
  nobs<-numeric()
  for(i in id)
  {
    data<-read.csv(fileList[i])
    value<-sum(complete.cases(data))
    nobs<-c(nobs,value)
  }
  data.frame(id,nobs)
}
  