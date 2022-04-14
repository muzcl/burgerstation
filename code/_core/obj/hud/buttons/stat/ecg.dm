/obj/hud/button/stat/ecg
	name = "life"
	desc = "Health for your limbs."
	id = "life"

	icon = 'icons/hud/ecg.dmi'
	icon_state = "5"

	screen_loc = "RIGHT,BOTTOM:12+5"

	user_colors = FALSE

	layer = 1

	appearance_flags = NO_CLIENT_COLOR | PIXEL_SCALE | LONG_GLIDE | TILE_BOUND | KEEP_TOGETHER

/obj/hud/button/stat/ecg/New(var/desired_loc)
	. = ..()
	filters += filter(type="drop_shadow",x=0,y=0,size=2,offset=1,color=rgb(0,255,0,100))

/obj/hud/button/stat/ecg/update_overlays()
	. = ..()
	var/image/I = new/image(icon,"line_overlay")
	I.appearance_flags = appearance_flags | RESET_COLOR
	I.blend_mode = BLEND_INSET_OVERLAY
	add_overlay(I)

/obj/hud/button/stat/ecg/update_owner(var/mob/desired_owner)
	color = "#000000"
	. = ..()

/obj/hud/button/stat/ecg/update()

	if(!is_living(owner))
		return FALSE

	var/mob/living/L = owner

	var/good_color = "#00FF00"
	var/good_color_outline = "#0000FF"
	var/good_color_text = "#FF0000"


	var/bad_color = "#FF0000"
	var/bad_color_outline = "#FFFFFF"
	var/bad_color_text = "#000000"

	if(owner && owner.client)
		var/color_scheme = L.client.settings.loaded_data["hud_colors"]
		good_color = color_scheme[3]
		bad_color = color_scheme[6]
		good_color_outline = color_scheme[2]
		bad_color_outline = color_scheme[5]
		good_color_text = color_scheme[4]
		bad_color_text = color_scheme[5]

	var/health_mod = clamp(L.health.health_current/owner.health.health_max,0,1)

	var/list/color_mod = list(
		blend_colors(bad_color,good_color,health_mod),
		blend_colors(bad_color_outline,good_color_outline,health_mod),
		blend_colors(bad_color_text,good_color_text,health_mod)
	)

	var/text_to_use
	if(L.dead)
		if(L.health.health_current > 0)
			icon_state = "revivable"
		else
			icon_state = "dead"
		text_to_use = "<center>DEATH</center>"
	else
		icon_state = "[clamp(CEILING(health_mod*5,1),0,5)]"
		text_to_use = "[FLOOR(health_mod*100,1)]%"

	if(color == "#000000")
		color=color_mod
	else
		animate(src,color=color_mod,time=TICKS_TO_DECISECONDS(LIFE_TICK))

	if(text_to_use)
		maptext = "<font color='#0000FF'>[text_to_use]</font>"
	else
		maptext = null


	. = ..()