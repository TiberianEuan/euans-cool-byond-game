// OH MY GOD ITS HIM
mob/player
	icon = 'player.dmi'
	icon_state = "default"
	Login()
		var/obj/start/start_obj = locate(/obj/start)
		if(start_obj)
			loc = start_obj.loc
