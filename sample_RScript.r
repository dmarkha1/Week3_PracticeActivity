
#macbook pro home
#airports = read.csv("/Users/Ender/Code/UWEC/Fall2016/Programming/Week2/ds710fall2016assignment2/airport.csv")

#windows work
airports = read.csv("C:/Users/dmarkham/Code/UWEC/Programming/Week2/ds710fall2016assignment2/airport.csv")

attach(airports)

head(airports)


# b. Print a list of airports at which the number of scheduled 
#   departures was less than the number of departures performed.


num_passengers = 0 #variable to keep track of passengers in airports where ScheduledDepartures < PerformedDepartures

for(airport_index in 1:length(Airport)){#begin iteration over Airports
    if (Scheduled.Departures[airport_index] < Performed.Departures[airport_index]) { #check if scheduled departures < Performed departures
        print(Airport[airport_index])
        num_passengers = num_passengers + Passengers[airport_index]

    }#end check if scheduled departures < Performed departures
} #end iteration over Airports


#c. find the total number of passengers on flights from the airports in part b.
print(num_passengers)
