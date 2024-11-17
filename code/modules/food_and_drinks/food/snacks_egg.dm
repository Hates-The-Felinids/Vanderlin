
////////////////////////////////////////////EGGS////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/chocolateegg
	name = "chocolate egg"
	desc = ""
	icon_state = "chocolateegg"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2)
	filling_color = "#A0522D"
	tastes = list("chocolate" = 4, "sweetness" = 1)
	foodtype = JUNKFOOD | SUGAR

/obj/item/reagent_containers/food/snacks/rogue/friedegg
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("eggs" = 1)
	name = "fryegg"
	desc = ""
	icon_state = "friedegg"
	foodtype = MEAT
	warming = 10 MINUTES

/obj/item/reagent_containers/food/snacks/egg
	icon = 'modular/Neu_Food/icons/food.dmi'
	name = "cackleberry"
	desc = ""
	icon_state = "egg"
	list_reagents = list(/datum/reagent/consumable/eggyolk = 5)
	cooked_type = null
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/friedegg
	filling_color = "#F0E68C"
	foodtype = MEAT
	grind_results = list()
	var/static/chick_count = 0 //I copied this from the chicken_count (note the "en" in there) variable from chicken code.
	rotprocess = 15 MINUTES
	var/fertile = FALSE
	become_rot_type = /obj/item/reagent_containers/food/snacks/rotten/egg

/obj/item/reagent_containers/food/snacks/egg/become_rotten()
	. = ..()
	if(.)
		fertile = FALSE


/obj/item/reagent_containers/food/snacks/egg/Crossed(mob/living/carbon/human/H)
	..()
	if(istype(H))
		var/turf/T = get_turf(src)
		var/obj/O = new /obj/effect/decal/cleanable/food/egg_smudge(T)
		O.pixel_x = rand(-8,8)
		O.pixel_y = rand(-8,8)
		visible_message("<span class='warning'>[H] crushes [src] underfoot.</span>")
		qdel(src)

/obj/item/reagent_containers/food/snacks/egg/gland
	desc = ""

/obj/item/reagent_containers/food/snacks/egg/gland/Initialize()
	. = ..()
	reagents.add_reagent(get_random_reagent_id(), 15)

	var/color = mix_color_from_reagents(reagents.reagent_list)
	add_atom_colour(color, FIXED_COLOUR_PRIORITY)

/obj/item/reagent_containers/food/snacks/egg/blue
	icon_state = "egg-blue"

/obj/item/reagent_containers/food/snacks/egg/green
	icon_state = "egg-green"

/obj/item/reagent_containers/food/snacks/egg/mime
	icon_state = "egg-mime"

/obj/item/reagent_containers/food/snacks/egg/orange
	icon_state = "egg-orange"

/obj/item/reagent_containers/food/snacks/egg/purple
	icon_state = "egg-purple"

/obj/item/reagent_containers/food/snacks/egg/rainbow
	icon_state = "egg-rainbow"

/obj/item/reagent_containers/food/snacks/egg/red
	icon_state = "egg-red"

/obj/item/reagent_containers/food/snacks/egg/yellow
	icon_state = "egg-yellow"

/obj/item/reagent_containers/food/snacks/friedegg
	name = "fried egg"
	desc = ""
	icon_state = "friedegg"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	bitesize = 1
	filling_color = "#FFFFF0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("egg" = 4, "salt" = 1, "pepper" = 1)
	foodtype = MEAT | FRIED | BREAKFAST

/obj/item/reagent_containers/food/snacks/boiledegg
	name = "boiled egg"
	desc = ""
	icon_state = "egg"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#FFFFF0"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("egg" = 1)
	foodtype = MEAT | BREAKFAST

/obj/item/reagent_containers/food/snacks/omelette	//FUCK THIS
	name = "omelette du fromage"
	desc = ""
	icon_state = "omelette"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 1)
	bitesize = 1
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("egg" = 1, "cheese" = 1)
	foodtype = MEAT | BREAKFAST | DAIRY

/obj/item/reagent_containers/food/snacks/omelette/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/kitchen/fork))
		var/obj/item/kitchen/fork/F = W
		if(F.forkload)
			to_chat(user, "<span class='warning'>I already have omelette on your fork!</span>")
		else
			F.icon_state = "forkloaded"
			user.visible_message("<span class='notice'>[user] takes a piece of omelette with [user.p_their()] fork!</span>", \
				"<span class='notice'>I take a piece of omelette with your fork.</span>")

			var/datum/reagent/R = pick(reagents.reagent_list)
			reagents.remove_reagent(R.type, 1)
			F.forkload = R
			if(reagents.total_volume <= 0)
				qdel(src)
		return
	..()

/obj/item/reagent_containers/food/snacks/benedict
	name = "eggs benedict"
	desc = ""
	icon_state = "benedict"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4)
	trash = /obj/item/trash/plate
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("egg" = 1, "bacon" = 1, "bun" = 1)

	foodtype = MEAT | BREAKFAST | GRAIN
