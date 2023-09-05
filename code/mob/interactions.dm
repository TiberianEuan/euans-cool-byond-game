mob
	verb
		say(msg as text)
			var/count = 0
			var/description = "says"
			var/size = 1  // Default text size

			// Count the number of exclamation marks in the message
			for(var/i = 1, i <= length(msg), i++)
				if(copytext(msg, i, i+1) == "!")
					count++

			// Determine the description and text size based on the number of exclamation marks
			if(count == 1)
				description = "exclaims"
				size = 2
			else if(count == 2)
				description = "shouts"
				size = 3
			else if(count == 3)
				description = "yells"
				size = 4
			else if(count >= 4)
				description = "screams"
				size = 5

			// Display the message to users within range, with adjusted text size
			view(world.view * count, usr) << "<font size='[size]'>[usr] [description]: \"[msg]\"</font>"
		whisper(msg as text)
			var/range = 2 // Maximum range for whisper to be heard
			var/obscured_msg = ""

            // Create the obscured message for 2 tiles away
			for(var/i = 1, i <= length(msg), i++)
				if(prob(50)) // 50% chance to replace each character
					obscured_msg += pick(".", "-")
				else
					obscured_msg += copytext(msg, i, i+1)

            // Display the message to users within range
			for(var/mob/M in view(range, usr))
				var/dist = get_dist(M, usr)

				if(dist <= 1)
					M << "[usr] whispers: \"[msg]\""
				else if(dist == 2)
					M << "[usr] whispers: \"[obscured_msg]\""