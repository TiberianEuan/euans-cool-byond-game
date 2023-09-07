
// autocombat.dm

mob/player
	var/auto_combat_level = 0  // 0 - Disabled, 1 - Attack zombies, 2 - Attack humans, 3 - Attack everybody

// Toggle Auto Combat verb
mob/player/verb/toggle_auto_combat()
	set name = "Toggle Auto Combat"
	set category = "Combat"

	auto_combat_level = (auto_combat_level + 1) % 4  // Cycles through 0, 1, 2, 3
	switch(auto_combat_level)
		if(0)
			src << "Auto Combat Disabled."
		if(1)
			src << "Auto Combat Level 1: Attack adjacent zombies."
		if(2)
			src << "Auto Combat Level 2: Attack adjacent humans."
		if(3)
			src << "Auto Combat Level 3: Attack everybody."
