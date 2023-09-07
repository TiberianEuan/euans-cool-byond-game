// Inside your existing mob/player definitions

mob/player
	icon = 'player.dmi'
	icon_state = "default"
	Login()
		var/obj/start/start_obj = locate(/obj/start)
		if(start_obj)
			loc = start_obj.loc

mob/player/zombie
	icon_state = "zombie"

	Move(NewLoc, Dir = 0)
		var/mob/player/target = null

		// Find a non-zombie player in view
		for(var/mob/player/P in view(src))
			if(!istype(P, /mob/player/zombie))
				target = P
				break

		// If a target is found, move toward it
		if(target)
			var/dx = target.x - x
			var/dy = target.y - y

			if(abs(dx) > abs(dy))
				NewLoc = get_step(src, dx > 0 ? EAST : WEST)
			else
				NewLoc = get_step(src, dy > 0 ? NORTH : SOUTH)

		return ..()
