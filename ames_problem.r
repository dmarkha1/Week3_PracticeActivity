#workcomp
# ames = read.csv("C:/Users/dmarkham/Code/UWEC/Programming/Week3/PracticeActivity/AmesHousing.csv")

#personal_windows_side
ames = read.csv("C:/Users/Daniel/UWEC/Fall2016/Programming/Week3/Week3_PracticeActivity/AmesHousing.csv")


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

#create a natural log of Price (natural log is 2.71 followed by blah blah blah)

logPrice = log(SalePrice)

#First, re-scale the y-axis of your histogram using the following statement
#The argument prob=T changes the y-axis so that the total area of the bars of the histogram is 1 
# (rather than the number of houses in the data). This makes it easier to compare it to a probability 
# distribution (because the total probability of a randomly selected house costing some price should add up to 1).

hist(logPrice, prob=T)
# abline(v=mean(logPrice),col="red",lwd=2)
# abline(v=median(logPrice),col="blue",lwd=2)
curve(dnorm(x, mean(logPrice), sd(logPrice)),add = T,col="green" )

# House sale prices (in dollars) and the above-ground living area (in square feet) 
# are both quantitative variables, so it makes sense to compute their correlation. 

#What is the correlation between sale price and living area? 
cor(SalePrice,Gr.Liv.Area)
#0.7067799
#What is the correlation between sale price and living area? 

# This correlation means that the linear relationship between sale price and living area in Ames, Iowa is...

# A. Fairly weak 
# B. Extremely strong 
# C. Moderately strong >>>>>THIS ONE 
# Which of these interpretations of the correlation is correct?

# A. Larger houses tend to cost more. >>>>>THIS ONE (never use the term "CAUSE" or its derivations in correlation) 
# B. Increasing the area of a house causes the price to increase. 
# C. Larger houses tend to cost less. 
# D. We cannot say anything about the direction of the relationship based on the correlation.



# A scatterplot is the best type of graph for visualizing 
# the relationship between two continuous variables. There are two basic ways to make a scatterplot in R:
plot(x, y)
plot(y ~ x)

# These produce the same graph, but they list the variables in opposite orders.
# Regardless of which syntax you use to make the scatterplot, 
# the x variable should be the predictor variable--the variable that is known (or known first), 
# or the variable whose value you can control. The y variable should be the response variable--the 
# variable whose value you’re trying to estimate, predict, or model.
# If you are told to “plot B as a function of A”, that means that A should be x and B should be y 
# (because in math, yy is often treated as a function of xx and written as y=f(x)y=f(x)). 
# If you are told to “plot B versus A”, that usually means that A should be x and B should be y (but sometimes people are sloppy about this).

# Plot sales price versus above-ground living area. Select the letter of the matching graph.

plot(Gr.Liv.Area,SalePrice) #y is the variable I want to predict,i.e. SalePrice


# Let’s say we want black to represent “Y” (has central air conditioning) 
# and we want red to represent “N” (no central air conditioning). 
# There are 2930 houses in the data set (we can find this using length(Central.Air)), 
# so we can start by making a vector filled with 2930 copies of the word “black”:
mycolors = rep( "black", 2930 )
# rep repeats the first argument as many times as you tell it in the second argument.


#create variable with INDEX numbers to change to the color RED
toChange = which(Central.Air == "N") 

# The first element of toChange turns out to be 83. So we want to change 
# the 83rd element of mycolors to be “red”. We know that we could 
# do that using square bracket notation:
mycolors[83] = "red"
# But square bracket notation also works for vectors of indices. 
# So we can change all of the toChange elements of mycolors at once, using the code
mycolors[ toChange ] = "red"
# Then make the scatterplot using the new colors:

plot( Gr.Liv.Area, SalePrice, col = mycolors )

# We can see that houses without central air conditioning tend to be less expensive 
# than similar-sized houses with central air conditioning. 
# Also, all of the very large houses have central air conditioning.
# Try to add a legend to the scatterplot to explain the meaning of the colors.

#this code:

between300and600_hard = vector()

for(index in 1:length(SalePrice)){
	if ((SalePrice[index] >200000) & (SalePrice[index] < 300000)){
		between300and600_hard  = c(between300and600_hard,index)
	}

}

#is the same as: 


between300and600 = which((SalePrice >200000) & (SalePrice < 300000))



# Barplots are the most appropriate way to graph categorical variables. They can either be used to plot quantitative information for different categories (such as the mean price of houses with and without air conditioning), or to plot the frequency of each category.
# Fireplaces is a discrete, numerical variable that tells how many fireplaces each house has. Let’s make a bar plot of the number of houses with 0, 1, 2, 3, or 4 fireplaces. First, use the table function to count the number of houses in each category:

counts = table(Fireplaces)

How many houses in the data set had 1 fireplace?

# 1274
# Then make the barplot:
# barplot( counts )
barplot(counts, xlab="Number of Fireplaces", ylab="Number of Houses", main="Houses with Fireplaces")


# What if we want a graphical representation of 2 categorical variables at the same time? Barplots can be used for that too!
# Let’s make a bar plot of the number of houses with 0, 1, 2, 3, or 4 fireplaces, and with or without air conditioning. First, use the table function to count the number of houses in each category:
counts = table(Central.Air, Fireplaces)


# Then make the barplot:
barplot( counts, col = c("red", "blue"))
legend("topright", legend = c("Houses With Central Air", "Houses with Fireplaces"), col=c("red","blue"), lwd = 2)


# In this case, all of the sale prices we wanted to compare were in a single vector (SalePrice), and we used another vector (Central.Air) to tell which elements belonged to which group. Sometimes, we will instead want to compare values for which each group is stored in a different vector.
# For example, suppose we want to compare the area (in square feet) on the first floor versus the second floor of homes. These values are stored in the variables X1st.Flr.SF and X2nd.Flr.SF. We can use the following code to make the boxplots:
#     boxplot( X1st.Flr.SF, X2nd.Flr.SF )
# Notice that for groups stored in different variables we use a comma, while for groups stored in the same variable we used a tilde.
boxplot( X1st.Flr.SF, X2nd.Flr.SF, names=c("1st floor","2nd floor") )

# Let’s use stacked histograms to compare the sale prices of houses with and without 
# central air conditioning. The first step is to create a new variable containing the 
# sale prices of houses with A/C, and a separate variable containing the sale prices 
# of houses without A/C. Try doing this with the which function.


# noAC = which(Central.Air == "N") 
# yesAC = which(Central.Air == "Y")


noACSalePrices = SalePrice[which(Central.Air == "N")]
noACSalePrices

yesACSalePrices = SalePrice[which(Central.Air == "Y")]
yesACSalePrices

# Now we need to prepare the graphing window to plot two graphs in the same window, one above the other. Type
par( mfrow = c( 2, 1 ) )
# This prepares the graphing window to plot graphs in 2 rows and 1 column.
# Now plot the histograms. To enable comparison of the distributions, 
# use xlim to set the same span of the horizontal axis for each graph.


hist(noACSalePrices,xlim = c(0,1000000))
hist(yesACSalePrices,xlim = c(0,1000000))



# In the previous problem, you made stacked histograms to compare the distributions of sale prices for houses with and without air conditioning. In this problem, we’ll use side-by-side histograms for the same comparison.
# The function for creating side-by-side histograms is in the plotrix package. The first time you use this package, you’ll need to install it by typing
install.packages( "plotrix")
# (If R asks you which server to download it from, you can choose any of the options, just like when you installed R. I usually choose 0-Cloud.)
# After the package is installed, you need to load it by typing
library( plotrix )
# You’ll need to do this every time you start a new session of R when you want to make side-by-side histograms.
# To make the histogram, use

multhist( list(yesACSalePrices, noACSalePrices), col=c("blue", "red") )

# Notice that because the number of houses with air conditioning is so much larger than the number 
# of houses without it, it’s hard to compare the proportions of houses at each price level. 
# We can correct this by re-scaling the y-axis to refer to probabilities rather 
# than absolute numbers of houses. We do this by setting “frequency” (absolute counts) to FALSE:
multhist( list(yesACSalePrices, noACSalePrices), freq = F, col=c("blue", "red") )
legend("topright", legend = c("No A/C", "With A/C"), fill = c("red", "blue"))

# What does this side-by-side histogram shows us?

# A. There are no houses without A/C that cost more than 180,000 dollars. 
# B. Houses without A/C are more likely to cost less than 180,000 dollars, compared to houses with A/C. 
# C. There are more houses without A/C that cost less than 180,000 dollars, compared to houses with A/C.