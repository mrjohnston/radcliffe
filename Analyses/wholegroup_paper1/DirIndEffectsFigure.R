# ------------------------------------------
# Mock figures showing spatial variation in experimental warming
# A. Ettinger, aettinger@fas.harvard.edu
# Description: Mock plot of spatial variation: blocks vs plots vs treatment levels

setwd("~/git/radcliffe")
rm(list=ls()) 
options(stringsAsFactors=FALSE)

#Here is a draft of the conceptual figure for biological implications of warming
quartz(width=11,height=6)
par(mfrow=c(2,3),omi=c(.1,2,.1,.1), mai=c(.6,.3,.5,.1))
x<-c(seq(1:10));y<-rev(seq(261,270))
plot(x,y,type="l", lwd=2, xlab="", ylab="", bty="l", cex.lab=1.2,ylim=c(260,280), yaxt="n",xaxt="n")

mtext("Muted response:",side=3, line=-7, adj=-1.5)
mtext("Direct Effect",side=3, line=2, adj=.5,cex=.9)
mtext("+",side=3, line=2, adj=1, cex=1.1)
mtext("Air temperature",side=1, line=1, adj=.5)
mtext("Focal Response",side=2, line=1.5)
mtext("(e.g. doy of phenological event)",side=2, line=.5, cex=.9)

y2<-seq(261,265.5,by=.5)
plot(x,y2,type="l", lwd=2, xlab="", ylab="", bty="l",cex.lab=1.2,ylim=c(260,280), yaxt="n",xaxt="n")
mtext("=",side=3, line=2, adj=1, cex=1.1)
mtext("Indirect Effect",side=3, line=2, adj=.5,cex=.9)
mtext("Artifically co-varying driver",side=1, line=1, adj=.5)
mtext("(e.g. soil moisture)",side=1, line=2, adj=.5,cex=.8)

y3<-rev(seq(261,265.5,by=.5))
plot(x,y3,type="l", lwd=2, xlab="", ylab="", bty="l",cex.lab=1.2,ylim=c(260,280), yaxt="n",xaxt="n")
mtext("Net Observed Effect of Warming",side=3, line=2, adj=.5,cex=.9)
mtext("Air temperature",side=1, line=1, adj=.5)

plot(x,y2,type="l", lwd=2, xlab="", ylab="", bty="l", cex.lab=1.1,ylim=c(260,280), yaxt="n",xaxt="n")
mtext("Exaggerated response:",side=3, line=-7, adj=-2.5)
mtext("Air temperature",side=1, line=1, adj=.5)
mtext("Focal Response",side=2, line=1.5)
mtext("(e.g. species abundance)",side=2, line=.5, cex=.9)

y5<-rev(seq(261,280,by=2))
plot(x,y5,type="l", lwd=2, xlab="", ylab="", bty="l", yaxt="n",xaxt="n")
mtext("=",side=3, line=1.5, adj=1.2)
mtext("Artifically co-varying driver",side=1, line=1, adj=.5)
mtext("(e.g. abundance of competing species)",side=1, line=2, adj=.5,cex=.8)

y5<-rev(seq(261,280,by=2))
plot(x,y2,type="l", lwd=2, xlab="", ylab="", bty="l", yaxt="n",xaxt="n")
mtext("Air temperature",side=1, line=1, adj=.5)

###Modifications to figure based on lizzie's feedback, plus new version of figure:
quartz(width=11,height=4)
par(mfrow=c(1,3),omi=c(.1,.2,.1,1), mai=c(.6,.3,.5,.1))
x<-c(seq(1:10));y<-seq(261,270)
plot(x,y,type="l", lty=2,lwd=1, xlab="", ylab="", bty="l", cex.lab=1.2,ylim=c(255,275), yaxt="n",xaxt="n")
lines(x,y+.5,lty=1,lwd=2)#observed response
mtext("a) Temperature only response",side=3, line=2, adj=.5,cex=.9)
mtext("Treatment intensity",side=1, line=1, adj=.5)
mtext("(cooler", side=1, line=2, adj=0)
mtext("warmer)", side=1, line=2, adj=1)
text(6.5,266,"Observed response =",adj=0)
text(6.5,265,"Effect of temperature",adj=0)
mtext("Response",side=2, line=1.5)
mtext("(e.g. phenology, growth)",side=2, line=.5, cex=.9)

#Panel b: muted response
plot(x,y,type="l", lty=2,lwd=1, xlab="", ylab="", bty="l", cex.lab=1.2,ylim=c(255,275), yaxt="n",xaxt="n")
y2<-rev(seq(256.5,261,by=.5))
lines(x,y2,lty=3,lwd=1)#indirect effect
y3<-seq(261,265.5,by=.5)
lines(x,y3,lty=1,lwd=2)#observed response
mtext("b) Muted observed response",side=3, line=2, adj=.5,cex=.9)
mtext("Treatment intensity",side=1, line=1, adj=.5)
mtext("(cooler", side=1, line=2, adj=0)
mtext("warmer)", side=1, line=2, adj=1)
text(6.5,266,"Effect of temperature",adj=0)
text(6.5,263.2,"Observed response",adj=0)
text(6.5,256.5,"Indirect effect",adj=0)

#Panel c: exaggerated response
plot(x,y,type="l", lty=2,lwd=1, xlab="", ylab="", bty="l", cex.lab=1.2,ylim=c(255,275), yaxt="n",xaxt="n")
y4<-seq(261,274.5,by=1.5)
lines(x,y4,lty=3,lwd=1)#indirect effect
y5<-seq(261,283.5,by=2.5)
lines(x,y5,lty=1,lwd=2)#observed response
mtext("c) Exaggerated observed response",side=3, line=2, adj=.5,cex=.9)
mtext("Treatment intensity",side=1, line=1, adj=.5)
mtext("(cooler", side=1, line=2, adj=0)
mtext("warmer)", side=1, line=2, adj=1)
text(6.5,266,"Effect of temperature",adj=0)
text(6.5,274.5,"Observed response",adj=0)
text(6.5,269,"Indirect effect",adj=0)

#Alternative bar graph version of figure
quartz(width=11,height=4)
par(mfrow=c(1,3),omi=c(.1,.2,.1,.8), mai=c(.6,.3,.5,1))
x=barplot(c(1.5,NA,1.5),col=c("black",NA,"gray"),horiz=TRUE, space=c(1,1),xlim=c(-2,2),ylim=c(0,8), xlab="",ylab="")
abline(v=0, lwd=1)
mtext("Response",side=1, line=2)
mtext("(e.g. phenology, growth)",side=1, line=3, cex=.9)
text(1.5,x[1],"Effect of temperature", cex=1.5, adj=0)
text(1.5,x[3],"Observed response", cex=1.5, adj=0)
mtext("a) Isolated treatment effect",side=3, line=2, adj=.5,cex=.9)

#Panel b: muted response
x=barplot(c(1.5,-.5,1),col=c("black","white","gray"),horiz=TRUE, space=c(1,1),xlim=c(-2,2),ylim=c(0,8), xlab="",ylab="")
abline(v=0, lwd=1)
mtext("Response",side=1, line=2)
mtext("(e.g. phenology, growth)",side=1, line=3, cex=.9)
text(1.5,x[1],"Effect of temperature", cex=1.5, adj=0)
text(0,x[2],"Indirect effect", cex=1.5, adj=0)
text(1,x[3],"Observed response", cex=1.5, adj=0)
mtext("b) Muted observed response",side=3, line=2, adj=.5,cex=.9)

#Panel c: exaggerated response
x=barplot(c(1.5,.5,2),col=c("black","white","gray"),horiz=TRUE, space=c(1,1),xlim=c(-2,2),ylim=c(0,8), xlab="",ylab="")
abline(v=0, lwd=1)
mtext("Response",side=1, line=2)
mtext("(e.g. phenology, growth)",side=1, line=3, cex=.9)
text(1.5,x[1],"Effect of temperature", cex=1.5, adj=0)
text(.5,x[2],"Indirect effect", cex=1.5, adj=0)
text(2,x[3],"Observed response", cex=1.5, adj=0)
mtext("c) Exaggerated observed response",side=3, line=2, adj=.5,cex=.9)
