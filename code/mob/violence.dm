// violence.dm

// Define the standing, stunned, bleeding, and infection states
mob/var/standing = TRUE
mob/var/stunned = FALSE
mob/var/bleeding = FALSE
mob/var/infected = FALSE

// Punch verb for humans
mob/player/verb/punch(mob/target in view(1))
	if(stunned)
		for(var/mob/M in view(7, src))
			M << "[usr] is stunned and cannot act!"
		return
	if(target.standing)
		target.health -= 10
		for(var/mob/M in view(7, src))
			M << "[usr] punches [target]."
		target.check_health()

// Kick verb for humans
mob/player/verb/kick(mob/target in view(1))
	if(stunned)
		for(var/mob/M in view(7, src))
			M << "[usr] is stunned and cannot act!"
		return
	if(!target.standing)
		target.health -= 15
		for(var/mob/M in view(7, src))
			M << "[usr] kicks [target]."
		target.check_health()

// Scratch verb for zombies
mob/player/zombie/verb/scratch(mob/target in view(1))
	if(stunned)
		for(var/mob/M in view(7, src))
			M << "[usr] is stunned and cannot act!"
		return
	if(target.standing)
		target.health -= 5
		target.bleeding = TRUE
		if(prob(25)) // 25% chance of infection
			target.infected = TRUE
		for(var/mob/M in view(7, src))
			M << "[usr] scratches [target], causing them to bleed."
		target.check_health()

// Bite verb for zombies
mob/player/zombie/verb/bite(mob/target in view(1))
	if(stunned)
		for(var/mob/M in view(7, src))
			M << "[usr] is stunned and cannot act!"
		return
	if(!target.standing)
		sleep(40) // Wait for 4 seconds
		target.health -= 20
		target.infected = TRUE
		for(var/mob/M in view(7, src))
			M << "[usr] bites [target], infecting them."
		target.check_health()

// Check health and apply status effects
mob/proc/check_health()
	if(health <= 0)
		standing = FALSE
		stunned = TRUE
		for(var/mob/M in view(7, src))
			M << "[src] falls down, incapacitated."
	if(health < -100)
		for(var/mob/M in view(7, src))
			M << "[src] has died."
	if(health < -500)
		icon_state = "skeleton"
	if(health > -500 && infected && istype(src, /mob/player))
		spawn(1200)  // 2 minutes in deciseconds
			if(health > -500 && infected)
				var/mob/player/zombie/Z = new /mob/player/zombie(loc)
				client.eye = Z
				client.perspective = MOB_PERSPECTIVE
				del(src)
