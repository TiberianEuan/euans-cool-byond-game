// BYOND Code
atom
	verb
		Examine()
			set category = "Object"
			set src in view(1)

			usr << "You examine [src]."
			usr << "Name: [name]"
			usr << "Description: [desc]"
			var/tmp/examine_icon_state = icon_state
			var/tmp/examine_icon = image(icon, icon_state = examine_icon_state

	// Capture Alt+Click
	Click()
		..()
		user.Examine()
