// time.dm
mob
	var
		accurate_time = 0

// Define the time variables
var/global/fictional_hour = 0
var/global/fictional_minute = 0
var/global/fictional_second = 0
var/global/day

// Define the time system proc
proc/update_fictional_time()
    while(TRUE)
        sleep(1) // Sleep for 10 deciseconds (1 second)
        fictional_second++

        if(fictional_second >= 60)
            fictional_second = 0
            fictional_minute++

        if(fictional_minute >= 60)
            fictional_minute = 0
            fictional_hour++

        if(fictional_hour >= 24)
            fictional_hour = 0
            day++

// Function to return the predicted time based on the current fictional_hour
proc/get_predicted_time()
    if(!usr.canseesky)
        return "Unknown"
    switch(fictional_hour)
        if(0 to 2) return "Midnight"
        if(3 to 5) return "Night"
        if(6 to 8) return "Dawn"
        if(9 to 11) return "Morning"
        if(12 to 14) return "Noon"
        if(15 to 17) return "Afternoon"
        if(18 to 20) return "Evening"
        if(21 to 23) return "Dusk"
        else return "Unknown"

// Override the Stat proc for the mob type
/mob/Stat()
    ..()
    HasWatch()
    var predicted_time = get_predicted_time()
    if(src.accurate_time)
        stat("Time ", "[fictional_hour]:[fictional_minute]:[fictional_second]")
    else
        stat("Time ", predicted_time)

// Server initialization
world/New()
    ..()
    spawn update_fictional_time()

/mob/proc/HasWatch()
	if(typesof(/obj/clock) in inventory || typesof(/obj/clock) in oview(src))
		accurate_time = 1
	else
		accurate_time = 0

obj
	clock
		name = "clock"
		desc = "tells the time."
		icon = 'clock.dmi'
		icon_state = "clock"