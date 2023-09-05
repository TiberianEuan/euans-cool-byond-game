mob
	var/canmove = TRUE
	var/health = 100
	var/move_delay = 2
	var/const/default_move_delay = 2
	var/movement_queue
    // Modify the Move() proc to use the movement queue
	Move(direction)
		if(canmove)
			// Add the direction to the movement queue
			movement_queue += direction

            // Start processing the movement queue if not already doing so
			if(!length(movement_queue))
				spawn
					src.process_movement_queue()

    // Function to process the movement queue
    proc/process_movement_queue()
		while(length(movement_queue))
			direction = movement_queue[1]  // Get the first direction in the queue
			movement_queue -= direction  // Remove the first direction from the queue

			// Move in the chosen direction
			spawn(move_delay)
				..(direction)
