// Define the door object
obj/door
	icon = 'door.dmi'
	icon_state = "door_closed"
	var
		state = "Closed"  // State of the door
		icon_state_closed = "door_closed"  // Icon state when closed
		icon_state_opened = "door_opened"  // Icon state when opened

	// Initialize the door with the closed icon state
	New()
		..()
		density = 1
		opacity = 1

	// Define the Interact verb
	verb/Interact()
		set src in oview(1)
		set category = "Objects"

		// If the door is Closed, open it
		if(state == "Closed")
			state = "Opened"
			icon_state = icon_state_opened
			usr << "You open the door."
			density = 0
			opacity = 0
			return

		// If the door is Opened, close it
		else
			state = "Closed"
			icon_state = icon_state_closed
			usr << "You close the door."
			density = 1
			opacity = 1
			return
