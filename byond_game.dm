/*
	These are simple defaults for your project.
 */

world
	fps = 60		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 8		// show up to 8 tiles outward from center

	name = "BYOND Garbage"
	movement_mode = TILE_MOVEMENT_MODE
	mob = /mob/player





// Make objects move 8 pixels per tick when walking

mob
	step_size = 32
	icon = 'placeholders.dmi'
	icon_state = "mob"
obj
	step_size = 32
	icon = 'placeholders.dmi'
	icon_state = "obj"
turf
	icon = 'placeholders.dmi'
	icon_state = "turf"