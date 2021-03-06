--
--Treemonster
--

ccmobs2 = {}

minetest.register_node("ccmobs2:treemonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5, -0.1875, 0.25, 0.5, 0.1875},
			{-0.25, -0.5, -0.1875, -0.1875, 0.5, 0.1875},
			{0.125, 0.3125, 0.1875, 0.1875, 0.5, 0.25},
			{-0.125, 0.25, 0.1875, -0.0625, 0.5, 0.25},
			{-0.1875, 0.3125, 0.1875, -0.125, 0.5, 0.25},
			{0.0625, 0.25, 0.1875, 0.125, 0.5, 0.25},
			{-0.0625, 0.0625, 0.1875, 0.0625, 0.5, 0.25},
			{-0.1875, 0, 0.1875, 0.1875, 0.125, 0.25},
			{-0, -0.5, 0.1875, 0.0625, -0.3125, 0.25},
			{-0.0625, -0.0625, 0.1875, -0, 0, 0.25},
			{0.0625, -0.1875, 0.1875, 0.125, 0, 0.25},
			{0.125, -0.5, 0.1875, 0.1875, -0.25, 0.25},
			{-0.125, -0.5, 0.1875, -0.0625, -0.3125, 0.25},
			{-0.125, -0.1875, 0.1875, -0.0625, 0, 0.25},
			{0.125, -0.125, 0.1875, 0.1875, 0, 0.25},
			{-0.1875, -0.5, 0.1875, 0.1875, -0.375, 0.25},
			{-0.1875, -0.125, 0.1875, -0.125, 0, 0.25},
			{-0.1875, -0.5, 0.1875, -0.125, -0.1875, 0.25},
			{-0.1875, -0.5, -0.25, 0.1875, 0.5, -0.1875},
			{-0.1875, -0.5, -0.1875, 0.1875, 0.4375, 0.1875},
		},
	},
	tiles = {"ccmobs2_treemonster_top.png", "ccmobs2_treemonster_top.png", "ccmobs2_treemonster_sides.png",
    "ccmobs2_treemonster_sides.png", "ccmobs2_treemonster_front.png", "ccmobs2_treemonster_sides.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs2:treemonster", {
	type = "monster",
	attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
	damage = 2,
	hp_min = 7,
	hp_max = 33,
	armor = 100,
	collisionbox = {-0.8, -1.725, -0.8, 0.85, 1.65, 0.85},
	visual = "wielditem",
	textures = {"ccmobs2:treemonster_block"},
	visual_size = {x = 2.0, y = 2.25},
	drawtype = "front",
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
    sounds = {
		random = "ccmobs2_treemonster",
	},
		walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:stick", chance = 1, min = 0, max = 2},
		{name = "default:sapling", chance = 2, min = 0, max = 2},
		{name = "default:apple", chance = 4, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 3,
	light_damage = 1,
	fall_damage = 1,
    fear_height = 5,
    animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 24,
		walk_start = 25,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		punch_start = 48,
		punch_end = 62,
	},
	on_rightclick = function(self, clicker)
		ccmobs2:capture_mob(self, clicker, "ccmobs2:treemonster")
	end,
})
