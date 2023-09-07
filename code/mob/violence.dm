// violence.dm

// Define the standing, stunned, bleeding, and infection states
mob/var/standing = TRUE
mob/var/stunned = FALSE
mob/var/bleeding = FALSE
mob/var/infected = FALSE

// New variables for Block and Dodge
mob/var/blocking = FALSE
mob/var/can_block = TRUE
mob/var/dodging = FALSE
mob/var/can_dodge = TRUE

// Scratch verb for zombies
mob/player/zombie/proc/scratch(mob/target)
    if(stunned)
        for(var/mob/M in view(7, src))
            M << "[usr] swipes at [target]. \he misses."
        return
    if(target.standing)
        target.health -= 5
        target.bleeding = TRUE
        if(prob(25)) // 25% chance of infection
            target.infected = TRUE
        target.check_health()

// Bite verb for zombies
mob/player/zombie/proc/bite(mob/target)
    if(stunned)
        for(var/mob/M in view(7, src))
            M << "[usr] gnashes \his teeth at [target]"
        return
    if(!target.standing)
        sleep(40) // Wait for 4 seconds
        target.health -= 20
        target.infected = TRUE
        target.check_health()

// Check health and apply status effects
mob/proc/check_health()
    if(health <= 0)
        standing = FALSE
        stunned = TRUE
        // Rotate the icon 90 degrees to the left
        var/matrix/M = matrix()
        M.Turn(90)
        src.transform = M
    else
        // Reset the icon rotation
        var/matrix/M = matrix()
        M.Turn(0)
        src.transform = M
        standing = TRUE

    if(health < -100)
        for(var/mob/M in view(7, src))
            M << "[src] lets out one last groan.."
    if(health < -500)
        icon_state = "skeleton"
    if(blocking)
        stunned = TRUE
    if(dodging)
        stunned = FALSE
