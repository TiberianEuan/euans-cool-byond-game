obj
	mirror
		name = "mirror"
		icon = 'mirror.dmi'
		icon_state = "mirror"
		desc = "You should see yourself right now."
		pixel_y = 32

		magicmirror
			name = "magic mirror"
			desc = "Don't like the way you look? Just change it!"
		broken
			name = "ruined mirror"
			desc = "Somebody hates the truth."


obj/mirror/magicmirror/verb/character_editor()
	set src in oview(1)
	set category = "Objects"
	// Main customization menu
	var/choice = input("Choose an option:", "Character Customization") as null|anything in list("Add Clothing", "Add Features", "Set Skin Colo(u)r", "Reset") //, "Change Color" *remember to fix later*

	// Option to Add Clothing
	if(choice == "Add Clothing")
		var/list/clothing_choices = typesof(/obj/overlay/clothes) - /obj/overlay/clothes
		var/list/clothing_names = list()
		for(var/clothing in clothing_choices)
			var/obj/overlay/clothes/C = new clothing
			clothing_names += C.name
		var/selected_clothing_name = input("Select clothing:", "Add Clothing") as null|anything in clothing_names
		var/selected_color = input("Select a color:", "Add Clothing") as color|null  // Color selection input
		var/selected_clothing_type = clothing_choices[clothing_names.Find(selected_clothing_name)]
		var/obj/overlay/clothes/new_clothing = new selected_clothing_type  // Create new clothing object

		if(selected_color)  // Check if a color was selected
			new_clothing.color = selected_color  // Apply the selected color

		overlays += new_clothing  // Add the possibly-colored clothing to overlays


	// Option to Add Features
	else if(choice == "Add Features")
		var/list/feature_choices = typesof(/obj/overlay/features) - /obj/overlay/features
		var/list/feature_names = list()
		for(var/feature in feature_choices)
			var/obj/overlay/features/F = new feature
			feature_names += F.name
		var/selected_feature_name = input("Select features:", "Add Features") as null|anything in feature_names
		var/selected_color = input("Select a color:", "Add Features") as color|null  // Color selection input
		var/selected_feature_type = feature_choices[feature_names.Find(selected_feature_name)]
		var/obj/overlay/features/new_feature = new selected_feature_type  // Create new feature object

		if(selected_color)  // Check if a color was selected
			new_feature.color = selected_color  // Apply the selected color

		overlays += new_feature  // Add the possibly-colored feature to overlays

	// Option to Add Clothing
	else if(choice == "Set Skin Colo(u)r")
		var/selected_color = input("Select a color:", "Set Skin Colo(u)r") as color|null
		src.color = selected_color


	// Option to Remove Features
	else if(choice == "Reset")
		overlays = null
		src.color = "ffffff"