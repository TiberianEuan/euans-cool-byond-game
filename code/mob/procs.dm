mob
	proc
		Harm(A as num)
			health -= A
			if(health <= 0)
				src.Die()
		Heal(A as num)
			health += A
		Die()
			if(!key) //NPC
				del(src)
			else //PC
				loc = null  //vacate the scene
				var/again = input("Play Again?") as null|anything in list("yes","no")
				if(again == "yes")
					Login() //back to square one!
				else
					del(src)