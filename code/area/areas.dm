area
	invisibility = 101
	var/areacanseesky = 0
	Entered(O)
		if(areacanseesky != usr.canseesky) usr.canseesky = areacanseesky
		return ..()

	outside
		areacanseesky = 1
		zombiespawns

	inside
		desc = "You step inside."
		areacanseesky = 0