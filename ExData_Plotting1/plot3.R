plot3<- function(){
	
	##Read the entire data at once
	data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,as.is=TRUE,na.strings="?")
	
	##as-is puts the column date and time as character. And the rest are numeric. All "?" as replaced by NA 

	##Filter out the required days
	sorted.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]	

	##Transforming first column in data format
	con.data<-transform(sorted.data,Date=as.Date(Date,format="%d/%m/%Y"))
	
	merge <- paste(con.data[,1],con.data[,2])
	dt<-strptime(merge, format= "%Y-%m-%d %H:%M:%S")
	
	##create a new data-frame with the an additional column column day merging time and date	
	new.data=data.frame(con.data,Day= dt)

	plot(new.data[,10],new.data[,7],type="l", main=NULL, xlab= "", ylab="Energy sub metering")
	lines(new.data[,10],new.data[,8],col="red")
	lines(new.data[,10],new.data[,9],col="blue")
	 legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

	dev.copy(png, filename = "plot3.png",height=550,width=550,units="px") ## Copy my plot to a PNG file. Pixel size doesn't have to be specified as 480 x 480 is default
	dev.off()
			}