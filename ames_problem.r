ames = read.csv("C:/Users/dmarkham/Code/UWEC/Programming/Week3/PracticeActivity/AmesHousing.csv")

attach(ames)


#changes the x-axis and y-axis labels on the histogram. "main" changeds the title of the histogram.
hist(SalePrice, xlab="Price in Dollars", ylab="Number of Houses", main="My Awesome Histogram")

#las=1 causes all axis numbers to be horizontal 
#cex.axis changes the font size used for the axis numbers. 
hist(SalePrice, las = 1, cex.axis = 1.5)


#xlim and ylim set the lower and upper limits for the axes. (use a vector, i.e. c(0,1200))
#Be careful not to mislead your readers by cutting off data when using xlim and ylim.
hist(SalePrice, xlim = c(0,1000000), ylim = c(0, 1200) )

#to find the mean sale price of houses in the data.
mean(SalePrice)

#to find the mean sale price of houses in the data.
median(SalePrice)



# The argument v= tells R that the line should be vertical.
# We could get a horizontal line instead using h=.
# col tells what color the line should be.
# This argument is optional. If you leave it out, the default color is black.
# See http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf for a list of colors you can choose.
# lwd tells the width of the line.
# This argument is optional. If you leave it out, the default width is 1.

#mean vertical line
abline(v = mean(SalePrice), col ="red", lwd = 2)
#median vertical line
abline(v = median(SalePrice), col ="blue", lwd = 2)

#adding a legend ?legend to get arguments and help
# The first argument tells R where to put the legend. Depending on the graph, it might make more sense to use “top” (centered at the top), “bottomleft”, etc.
# legend tells what text to put in the legend. Be sure that the order matches the order of your colors in the col argument.
legend("topright", legend = c("Mean price", "Median price"), col=c("red","blue"), lwd = 2)

# After you get your graph looking the way you want it, you’ll want to save it. There are 3 ways to do this.
# Right-click on the graph and choose “Save as postscript...”.
# You can also choose “Copy as bitmap” and then paste the figure into another document, such as a Word document.
# Select the graph window in R by left-clicking on it, then click File -> Save As at the top of the R window.
# You can make a script that automatically saves your graph using the functions pdf() and dev.off().
# pdf(“filename.pdf”) starts the creation of a PDF file with the given filename.
# Then type the code to create your graph. This can have more than one line: For example, you might use hist() to create a histogram and legend() to add a legend to it.
# dev.off() shuts down the plotting device (in this case, the PDF creator). This is necessary for you to be able to open and view the created file.
# Option 3 is especially useful if you want to make a lot of similar plots. 

# For example, columns 68-73 of the AmesHousing data all contain quantitative variables. 
# If we wanted a separate PDF with a histogram of each of these variables, we could use the following code:
for(i in 68:73){
    pdf( paste("C:/Users/dmarkham/Code/UWEC/Programming/Week3/PracticeActivity/PDF_Create/Histogram_", i, ".pdf", sep = "") )
    hist( ames[,i], main = paste("Histogram of", colnames(ames)[i]) )
    dev.off()
}