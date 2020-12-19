/mob/living/simple/arachnid
	name = "giant arachnid"
	desc = "Might as well be a miniboss."
	desc_extended = "A giant quadreped carniverous creature."
	icon = 'icons/mob/living/simple/jungle/arachnid.dmi'
	icon_state = "living"
	damage_type = /damagetype/unarmed/claw/
	class = /class/arachnid

	value = 1000

	ai = /ai/

	stun_angle = 0

	butcher_contents = list(
		/obj/item/container/food/dynamic/meat/raw_arachnid,
		/obj/item/container/food/dynamic/meat/raw_arachnid,
		/obj/item/container/food/dynamic/meat/raw_arachnid,
		/obj/item/container/food/dynamic/meat/raw_arachnid,
		/obj/item/container/food/dynamic/meat/raw_arachnid,
		/obj/item/container/food/dynamic/meat/raw_arachnid
	)

	pixel_x = -16

	armor_base = list(
		BLADE = 50,
		BLUNT = 25,
		PIERCE = 50,
		LASER = -25,
		ARCANE = 25,
		HEAT = 25,
		COLD = -50,
		BOMB = 25,
		BIO = 75,
		HOLY = 50,
		DARK = 50,
		FATIGUE = 25,
		ION = INFINITY,
		PAIN = 0
	)

	iff_tag = "Jungle"
	loyalty_tag = "Jungle"

	health_base = 500

	movement_delay = DECISECONDS_TO_TICKS(2)

	status_immune = list(
		STUN = STAGGER,
		SLEEP = STAGGER,
		PARALYZE = STAGGER,
		STAMCRIT = STAGGER,
		DISARM = TRUE
	)

	mob_size = MOB_SIZE_GIANT

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	blood_type = /reagent/blood/alien/green
	blood_volume = 2000

/mob/living/simple/arachnid/post_death()
	. = ..()
	icon_state = "dead"
	update_sprite()