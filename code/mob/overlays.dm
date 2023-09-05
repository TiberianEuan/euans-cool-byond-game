var/const
	FEATURES_LAYER = FLOAT_LAYER-1
	CLOTHES_LAYER = FLOAT_LAYER-2
obj/overlay
	features
		icon = 'features.dmi'
		layer = FEATURES_LAYER
	clothes
		icon = 'clothing.dmi'
		layer = CLOTHES_LAYER
mob/verb
	wear_clothes()
		overlays += /obj/overlay/clothes
	remove_clothes()
		overlays -= /obj/overlay/clothes
	add_features()
		overlays += /obj/overlay/features
	remove_features()
		overlays += /obj/overlay/features