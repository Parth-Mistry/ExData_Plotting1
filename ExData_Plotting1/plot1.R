plot1<- function(){
	
	#Read the entire data at once
	data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,as.is=TRUE,na.strings="?")
	#as-is puts the column date and time as character. And the rest are numeric. All "?" as replaced by NA 

	#Filter out the required days
	sorted.data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]	

	#Transforming first column in data format
	con.data<-transform(sorted.data,Date=as.Date(Date,format="%d/%m/%Y"))

	his<-hist(con.data[,3],col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

	dev.copy(png, filename = "plot1.png") ## Copy my plot to a PNG file. Pixel size doesn't have to be specified as 480 x 480 is default
	dev.off()
			}