/obj/item/weapon/ranged/bullet/magazine/smg/pdw
	name = "\improper .25 PDW"
	bullet_type = ".25"
	icon = 'icons/obj/items/weapons/ranged/smg/25.dmi'
	icon_state = "inventory"

	automatic = TRUE
	can_wield = FALSE

	shoot_delay = 1
	max_bursts = 5
	view_punch = 4

	bullet_count_max = 1 //One in the chamber


	shoot_sounds = list('sounds/weapons/smg_light/smg.ogg')

	override_icon_state = TRUE

	heat_per_shot = 0.01
	heat_max = 0.1

/obj/item/weapon/ranged/bullet/magazine/smg/pdw/get_static_spread() //Base spread
	return 0.04

/obj/item/weapon/ranged/bullet/magazine/smg/pdw/get_skill_spread(var/mob/living/L) //Base spread
	return 0.05 - (0.05 * L.get_skill_power(SKILL_RANGED))