--
--Treemonster
--
minetest.register_node("ccmobs:treemonster_block", {
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
	tiles = {"ccmobs_treemonster_top.png", "ccmobs_treemonster_top.png", "ccmobs_treemonster_sides.png",
    "ccmobs_treemonster_sides.png", "ccmobs_treemonster_front.png", "ccmobs_treemonster_sides.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:treemonster", {
	type = "monster",
	hp_max = 5,
	collisionbox = {-0.8, -1.725, -0.8, 0.85, 1.65, 0.85},
	visual = "wielditem",
	textures = {"ccmobs:treemonster_block"},
	visual_size = {x = 2.0, y = 2.25},
	makes_footstep_sound = false,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:sapling",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "default:tree",
		chance = 3,
		min = 1,
		max = 3,},
	},
	light_resistant = true,
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	disable_fall_damage = true,
	attack_type = "dogfight",
    sounds = {
		random = "ccmobs_treemonster",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "ccmobs:cage" then
            minetest.sound_play("ccmobs_treemonster",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
            clicker:get_inventory():remove_item("main", "ccmobs:cage")
            clicker:get_inventory():add_item("main", "ccmobs:treemonster")
            self.object:remove()
		end
	end,
})

minetest.register_craftitem("ccmobs:treemonster", {
	description = "Treemonster  Spawnegg",
	inventory_image = "ccmobs_spawnegg_treemonster.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
            minetest.sound_play("ccmobs_treemonster",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
			minetest.env:add_entity(pointed_thing.above, "ccmobs:treemonster")
			if minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			else
				itemstack:take_item()
				placer:get_inventory():add_item("main", "ccmobs:cage")
			end
		end
		return itemstack
	end,
})
