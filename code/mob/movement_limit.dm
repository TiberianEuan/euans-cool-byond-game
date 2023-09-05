mob
	var
		ismoving = 0
		move_delay = 5
		base_move_delay = 5
	Move()
		if(!ismoving)
			ismoving = 1
			..()
			spawn(move_delay*0.5)
			ismoving = 0
		else
			return 0 // epic fail