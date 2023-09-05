mob/verb/character_editor()
	// Main customization menu
	var/choice = input("Choose an option:", "Character Customization") as null|anything in list("Add Clothing", "Remove Clothing", "Add Features", "Remove Features", "Change Color")

	// Option to Add Clothing
	if(choice == "Add Clothing")
		var/list/clothing_choices = typesof(/obj/overlay/clothes) - /obj/overlay/clothes
		var/list/clothing_names = list()
		for(var/clothing in clothing_choices)
			var/obj/overlay/clothes/C = new clothing
			clothing_names += C.name
		var/selected_clothing_name = input("Select clothing:", "Add Clothing") as null|anything in clothing_names
		var/selected_clothing_type = clothing_choices[clothing_names.Find(selected_clothing_name)]
		overlays += new selected_clothing_type

	// Option to Remove Clothing
	else if(choice == "Remove Clothing")
		var/list/current_clothing = list()
		for(var/obj/overlay/clothes/C in overlays)
			current_clothing += C
		var/selected_clothing_to_remove = input("Select clothing to remove:", "Remove Clothing") as null|anything in current_clothing
		overlays -= selected_clothing_to_remove

	// Option to Add Features
	else if(choice == "Add Features")
		var/list/feature_choices = typesof(/obj/overlay/features) - /obj/overlay/features
		var/list/feature_names = list()
		for(var/feature in feature_choices)
			var/obj/overlay/features/F = new feature
			feature_names += F.name
		var/selected_feature_name = input("Select features:", "Add Features") as null|anything in feature_names
		var/selected_feature_type = feature_choices[feature_names.Find(selected_feature_name)]
		overlays += new selected_feature_type

	// Option to Remove Features
	else if(choice == "Remove Features")
		var/list/current_features = list()
		for(var/obj/overlay/features/F in overlays)
			current_features += F
		var/selected_feature_to_remove = input("Select features to remove:", "Remove Features") as null|anything in current_features
		overlays -= selected_feature_to_remove


	// Option to Change Color
	else if(choice == "Change Color")
		var/selected_overlay_to_color = input("Select an overlay to change its color:", "Change Color") as null|anything in overlays
		var/selected_color = input("Select a color:", "Change Color") as color|null
		if(selected_overlay_to_color && selected_color)
			var/image/I = image(selected_overlay_to_color.icon, selected_overlay_to_color.icon_state)
			I.color = selected_color
			overlays += I