/obj/item/weapon/ranged/bullet/magazine/smg/handheld
	name = "\improper 9mm SMP"
	bullet_type = "9"
	icon = 'icons/obj/items/weapons/ranged/smg/9mm.dmi'
	icon_state = "inventory"

	shoot_delay = 2

	automatic = TRUE

	bullet_count_max = 1 //One in the chamber



	shoot_sounds = list('sounds/weapons/silenced/fire.ogg')

	can_wield = FALSE

	view_punch = 4

	slowdown_mul_held = HELD_SLOWDOWN_SMG

	size = SIZE_3
	weight = WEIGHT_3

	heat_per_shot = 0.03
	heat_max = 0.3

/obj/item/weapon/ranged/bullet/magazine/smg/handheld/get_static_spread() //Base spread
	return 0.04

/obj/item/weapon/ranged/bullet/magazine/smg/handheld/get_skill_spread(var/mob/living/L) //Base spread
	return 0.05 - (0.05 * L.get_skill_power(SKILL_RANGED))