
// zombie_npc.dm

mob/player/zombie
	icon = 'player.dmi'
	icon_state = "zombie"

// Main Zombie AI behavior loop
proc/zombie_ai_behavior()
	while(TRUE)
		for(var/mob/player/zombie/Z in world)
			var/mob/closest_player = null
			var/mob/closest_corpse = null
			var/min_distance = 1e6  // Large value to simulate infinity
			for(var/mob/player/P in oview(7, Z))
				var/distance = get_dist(Z, P)
				if(distance < min_distance)
					min_distance = distance
					if(P.health <= 0 && P.icon_state != "skeleton")  // Corpse
						closest_corpse = P
					else  // Living player
						closest_player = P

			if(closest_player)
				if(prob(50))  // 50% chance to scratch
					Z.scratch(closest_player)
				else  // 50% chance to bite
					Z.bite(closest_player)
			else if(closest_corpse)
				// Munch on the corpse
				Z.bite(closest_corpse)

		sleep(15)  // Loop runs every 1.5 seconds
