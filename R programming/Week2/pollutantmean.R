pollutantmean<-function(directory,pollutant,id=1:332){
  fileList<-list.files(path=directory,pattern=".csv",full.names = TRUE)
  value<- numeric()
  for( i in id){
    data<-read.csv(fileList[i])
    value<-c(value,data[[pollutant]])
    
  }
  mean(value,na.rm = TRUE)
}



