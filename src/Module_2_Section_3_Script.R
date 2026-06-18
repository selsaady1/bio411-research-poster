#Module 2, Section 3 Introduction to Modeling Growth in R

#How do we model population growth?

#Start simple
#Birth-Death=Growth

b<-8 #birth rate of eight
d<-5 #death rate of five
g<-b-d #growth equals birth minus death. #growth rate of 3

#Population changes over time in a constant fashion under this model
#Make a data frame for 10 generations

Sample_Growth1<-data.frame("Year"=c(1:10), "Population"=c(g*seq(1,10,1))) #seq makes a sequence of n (1) to m (10) by x (1)
#use seq(1,10,.5) as another example of seq
Sample_Growth1

#Now let's plot this information
plot(Sample_Growth1)

#We can add immigration and emmigration
i<-2 #two individuals immigrate each period
e<-1 #one individual emmigrates

g2<-b+i-e-d #growth including new variables

#Make a more complete data frame which includes all the variables
Sample_Growth2<-data.frame("Year"=c(1:10), "Population"=c(g2*seq(1,10,1)),
                           "Birth"=c(b*seq(1,10,1)),"Death"=c(d*seq(1,10,1)),
                           "Immigration"=c(i*seq(1,10,1)),"Emmigration"=c(e*seq(1,10,1))) 

#Add a plot of the data
plot(Sample_Growth2$Year, Sample_Growth2$Population, pch=19, col="black", xlab="Year", ylab="Population")
# Add a line
lines(Sample_Growth2$Year, Sample_Growth2$Population, pch=19, col="black", lty=2) #lty is line type 

# Add a legend
legend(2, 35, legend=c("Population"), #x and y are where the legend will be
       col=c("black"), lty=2, cex=0.8)


#Question 1 (3 points)

#We know that population growth rate is influenced by the population itself. 
#As more individuals are born, the population grows expoentially

#Start with a population growth rate of 5%, and look at 10 time periods
N1<-75
lambda<-1.05

N1<-75
N2<-N1*lambda
N3<-N2*lambda
N4<-N3*lambda
N5<-N4*lambda
N6<-N5*lambda
N7<-N6*lambda
N8<-N7*lambda
N9<-N8*lambda
N10<-N9*lambda

#Make a vector of these populations
pop_size<-c(N1,N2,N3,N4,N5,N6,N7,N8,N9,N10)


#Now lets module continuous growth
#This is modeled by the equation Nt+1=Nt*lambda^t where N1 is the starting population, 
#r is the population growth rate (note above 1 is growth
#and below one is decline), and t is the current time 

time<-c(0:9) # 0-9 gives us 10 values, the first is 0, and anything 
#raised to the 0 is 1 so it gives us N1*1 for our first value
pop_size_equation<-c(N1*lambda^time) #note that this works as a vector since our time variable is a vector

#compare the two
pop_size
pop_size_equation

#quickly plot
plot(pop_size, pch = 19, col = "black", xlab = "Year", ylab = "Count",
     main = "Population Growth with Births, Deaths, Immigration, and Emigration")

# Add lines and points for births
points(Sample_Growth2$Year, Sample_Growth2$Birth, pch = 19, col = "blue")
lines(Sample_Growth2$Year, Sample_Growth2$Birth, col = "blue", lty = 1)

# Add lines and points for deaths
points(Sample_Growth2$Year, Sample_Growth2$Death, pch = 19, col = "red")
lines(Sample_Growth2$Year, Sample_Growth2$Death, col = "red", lty = 1)

# Add lines and points for immigration
points(Sample_Growth2$Year, Sample_Growth2$Immigration, pch = 19, col = "green")
lines(Sample_Growth2$Year, Sample_Growth2$Immigration, col = "green", lty = 1)

# Add lines and points for emigration
points(Sample_Growth2$Year, Sample_Growth2$Emmigration, pch = 19, col = "purple")
lines(Sample_Growth2$Year, Sample_Growth2$Emmigration, col = "purple", lty = 1)

# Add a legend to the plot
legend("topright", legend = c("Population", "Births", "Deaths", "Immigration", "Emigration"),
       col = c("black", "blue", "red", "green", "purple"), lty = c(2, 1, 1, 1, 1),
       pch = c(19, 19, 19, 19, 19), cex = 0.8)

#this looks fairly linear but we can see that our growth is not constant
#look at the change from one cell to the next
pop_change1 <- pop_size[2] - pop_size[1]
pop_change2 <- pop_size[3] - pop_size[2]
pop_change3 <- pop_size[4] - pop_size[3]
pop_change4 <- pop_size[5] - pop_size[4]
pop_change5 <- pop_size[6] - pop_size[5]


pop_change_vector<-c(pop_change1,pop_change2,pop_change3,pop_change4,pop_change5)
pop_change_vector


#Let's investigate a longer period of time

time2<-c(0:49)
pop_size2<-c(N1*lambda^time2)
pop_size2
plot(pop_size2)

#Question 2 (3 points)


#Adding in carrying capacity helps make this more realistic. 
#In this example, our carrying capcity is 500 individuals, and a starting population of 100
#add carrying capcity to our equation
#Nt+1=Nt+[(k-Nt)/k]Nt*r 
#Note that [(k-Nt)/k]Nt*r represents the CHANGE in growth hence why it is being added to the population

k<-500
N1<-100
r1<-1.01

#Write out the equation and run it in a step wise fashion

N1<-100
N2<-N1+((k-N1)/k)*N1*r1
N3<-((k-N2)/k)*N2*r1
N4<-((k-N3)/k)*N3*r1
N5<-((k-N4)/k)*N4*r1
N6<-((k-N5)/k)*N5*r1
N7<-((k-N6)/k)*N6*r1
N8<-((k-N7)/k)*N7*r1
N9<-((k-N8)/k)*N8*r1
N10<-((k-N9)/k)*N9*r1




####The above method works but clearly we do not want to write out everything manually
#Using For loops can solve for this

#Create a blank vector
Pop_Growth_Logistic<-c(rep(NA,40))
N_starting<-100
Pop_Growth_Logistic[1]<-N_starting
#For Loop
for (i in 1:(length(Pop_Growth_Logistic)-1)){ #i is our variable we are looping. For in is 1: the
  Pop_Growth_Logistic[i+1]<-Pop_Growth_Logistic[i]+              # the length of the vector minus 1 since
    ((k-Pop_Growth_Logistic[i])/k)*Pop_Growth_Logistic[i]*r1    #we are starting with 1
}

plot(Pop_Growth_Logistic)

# Create a blank vector for logistic growth with 1000 time steps
Pop_Growth_Logistic_Long <- c(rep(NA, 1000))
N_starting <- 100
Pop_Growth_Logistic_Long[1] <- N_starting

# For loop to calculate population for 1000 time steps
for (i in 1:(length(Pop_Growth_Logistic_Long) - 1)) {
  Pop_Growth_Logistic_Long[i + 1] <- Pop_Growth_Logistic_Long[i] +
    ((k - Pop_Growth_Logistic_Long[i]) / k) * Pop_Growth_Logistic_Long[i] * r1
}

# Plot for time up to 100
plot(Pop_Growth_Logistic_Long[1:100], type = "l", col = "blue", xlab = "Time (steps)", 
     ylab = "Population", main = "Logistic Growth (Time Up to 100)")

# Plot for time up to 1000
plot(Pop_Growth_Logistic_Long, type = "l", col = "red", xlab = "Time (steps)", 
     ylab = "Population", main = "Logistic Growth (Time Up to 1000)")

# Determine when population reaches 2000
time_to_2000 <- which(Pop_Growth_Logistic_Long >= 2000)[1]  # Find the first time step where population >= 2000
cat("Population reaches 2000 at time step:", time_to_2000, "\n")




#Question 3,4,and 5
# Question 3: Parameter Modifications for Logistic Growth --------------------------

# Define a function for logistic growth simulation
logistic_growth <- function(k, r, N1, time_steps) {
  # Create a blank vector to store population values
  population <- c(rep(NA, time_steps))
  population[1] <- N1  # Set the starting population
  # Loop to calculate population for each time step
  for (i in 1:(time_steps - 1)) {
    population[i + 1] <- population[i] +
      ((k - population[i]) / k) * population[i] * r
  }
  return(population)
}

# Simulate populations with different parameters
time_steps <- 100
k1 <- 500; r1 <- 1.01; N1_1 <- 100
k2 <- 800; r2 <- 1.05; N1_2 <- 50
k3 <- 1000; r3 <- 0.9; N1_3 <- 200

pop1 <- logistic_growth(k = k1, r = r1, N1 = N1_1, time_steps = time_steps)
pop2 <- logistic_growth(k = k2, r = r2, N1 = N1_2, time_steps = time_steps)
pop3 <- logistic_growth(k = k3, r = r3, N1 = N1_3, time_steps = time_steps)

# Create plots to compare the results
par(mfrow = c(1, 3))  # Set up 1 row and 3 columns for plots

# Plot 1: Scenario 1
plot(pop1, type = "l", col = "blue", xlab = "Time", ylab = "Population",
     main = "Scenario 1: K = 500, r = 1.01")
abline(h = k1, col = "red", lty = 2)  # Add a line for carrying capacity

# Plot 2: Scenario 2
plot(pop2, type = "l", col = "green", xlab = "Time", ylab = "Population",
     main = "Scenario 2: K = 800, r = 1.05")
abline(h = k2, col = "red", lty = 2)

# Plot 3: Scenario 3
plot(pop3, type = "l", col = "purple", xlab = "Time", ylab = "Population",
     main = "Scenario 3: K = 1000, r = 0.9")
abline(h = k3, col = "red", lty = 2)

# Reset plotting layout
par(mfrow = c(1, 1))

# The [(K-N)/K] term represents the proportion of the carrying capacity still available for growth.
# - When N is low (far from K), [(K-N)/K] is close to 1, meaning there is plenty of room for growth.
# - As N approaches K, [(K-N)/K] becomes smaller, meaning growth slows down because the population is near carrying capacity.
# - When N equals K, [(K-N)/K] becomes 0, and growth stops entirely.



# Question 4: Simulating Declining Population -----------------------------------
# A growth rate less than 1 indicates a decline in population.
# For example, a growth rate of 0.95 represents a -5% growth rate (decline).

# Define initial parameters
N1 <- 500  # Starting population size
r_decline <- 0.95  # Growth rate for decline (-5% per time step)
time_periods <- 10  # Number of time periods

# Simulate population over time
pop_decline <- c(rep(NA, time_periods))
pop_decline[1] <- N1  # Set the starting population

for (i in 2:time_periods) {
  pop_decline[i] <- pop_decline[i - 1] * r_decline
}

# Plot the population
plot(pop_decline, type = "b", col = "blue", xlab = "Time (Periods)", ylab = "Population",
     main = "Declining Population (Growth Rate = -5%)", pch = 19)
abline(h = 0, col = "red", lty = 2)  # Add a horizontal line at population = 0
# The curve shows exponential decay.
# - The population starts at 500 and decreases by 5% each time period.
# - Over time, the population declines rapidly but never quite reaches zero within 10 time periods.

