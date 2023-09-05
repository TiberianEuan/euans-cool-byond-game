mob
	var/canmove = TRUE
	var/health = 100
	// Modify the Move() proc to use the movement queue
	Move(direction)
		if(canmove)
			..()