// Define the limb_holder object
obj/limb_holder
	name = "Limb Holder"
	desc = "Why the hell can you see this?"
	icon = 'placeholders.dmi'  // Set an icon for debugging, it won't be visible to players
	icon_state = "obj" // for just in case if players actually see it at some point
	invisibility = 101  // Make it invisible to players




// OH MY GOD ITS HIM
mob/player
	icon = 'player.dmi'
	icon_state = "default"
	Login()
		var/obj/start/start_obj = locate(/obj/start)
		if(start_obj)
			loc = start_obj.loc