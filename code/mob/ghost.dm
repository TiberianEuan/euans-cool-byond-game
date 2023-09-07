// ghost.dm

// Define the ghost mob type
mob/ghost
	icon_state = "ghost"
	var/mob/corpse = null  // Reference to the corpse left behind, explicitly typed as a mob

// Check health and handle transition between ghost and player
mob/ghost/proc/check_ghost_health()
	if(corpse && istype(corpse, /mob) && corpse.health > 0)
		// Implement logic to transform the ghost back into a player
		corpse.client.eye = corpse
		corpse.client.perspective = MOB_PERSPECTIVE
		del(src)  // Remove the ghost

// Ghost communication
mob/ghost/verb/say_ghost(message as text)
	for(var/mob/ghost/G in world)
		G << "[usr]: [message]"
	for(var/mob/M in world)
		if(M.health < -50)
			M << "[message]"
