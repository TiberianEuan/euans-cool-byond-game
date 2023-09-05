turf/floor
	var/speed_modifier = 1
	density = 0
	// Override the Entered() proc
	Entered(atom/movable/AM)
		..()
		if(ismob(AM))  // Check if the entering atom is a mob
			var/mob/M = AM
			M.move_delay = M.default_move_delay * speed_modifier  // Modify the step_size


    // TYPES OF FLOOR BELOW

	icon = 'floor.dmi'

	wood
		icon_state = "wood"
		name = "wooden floor"
		desc = "Comfortable and strong."
		speed_modifier = 0.9
	grass
		icon_state = "grass"
		desc = "Full of bugs."
		speed_modifier = 1.1
	dirt
		icon_state = "dirt"
		desc = "Raise the earth!"
		speed_modifier = 1
	stone
		icon_state = "stone"
		desc = "rocc"
		speed_modifier = 0.8
	mud
		icon_state = "mud"
		desc = "Dirt, but annoying."
		speed_modifier = 1.2
	sand
		icon_state = "sand"
		desc = "Powder rock. It gets everywhere."
		speed_modifier = 1.4
		quicksand
			desc = "Very loose sand. Will make you sink."
			speed_modifier = 1.8
