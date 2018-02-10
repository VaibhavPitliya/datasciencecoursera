corr<-function(directory,threshold=0)
  {
  complete_table<-complete("specdata",1:332)
  nobs<-complete_table$nobs
  ids<-complete_table$id[nobs>threshold]
  value<-numeric()
  
  fileList<-list.files(path=directory,pattern=".csv",full.names=TRUE)
  
  for(i in ids)
  {
    current_file<-read.csv(fileList[i])
    corelation<-cor(current_file$sulfate,current_file$nitrate,use="complete.obs")
    value<-c(value,corelation)
    
  }
  result<-value
  return(result)
}