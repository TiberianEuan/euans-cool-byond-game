// BYOND Code
atom
	verb
		Examine()
			set category = "Objects"
			set src in view(1)

			usr << "[src]"
			usr << "[desc]"
			var/examine_icon_state = icon_state
			var/icon/examine_icon = image(icon, icon_state = examine_icon_state)
			usr << "[examine_icon]"
