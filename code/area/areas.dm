area
	invisibility = 101
	Entered(O)
		if(desc) O << desc
		return ..()

	outside
		zombiespawns

	inside
		desc = "You step inside."