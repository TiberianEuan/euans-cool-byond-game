turf/wall
	density = 1
	opacity = 1
	var/health = 100
	icon = 'wall.dmi'
	wood
		name = "wooden wall"
		icon_state = "wood"
		health = 40
	grass
		name = "hedge"
		icon_state = "grass"
		health = 10
	dirt
		name = "dirt wall"
		icon_state = "dirt"
		health = 30
	stone
		name = "stone wall"
		icon_state = "stone"
		health = 50
		unbreakable
			name = "dense stone wall"
			desc = "Never gettin' through this."
			health = 99999999
			meteor
				name = "meteor stone"
				desc = "Why's it so darn strong?"
	mud
		name = "mud wall"
		icon_state = "mud"
		health = 20