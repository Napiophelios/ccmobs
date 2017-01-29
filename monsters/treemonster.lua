--
--Treemonster
--
minetest.register_node("ccmobs:treemonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.1875, 0.4375, -0.125, 0.375, 0.5},
			{-0.125, 0.1875, 0.4375, 0.125, 0.375, 0.5},
			{-0.25, 0.125, 0.4375, -0.1875, 0.375, 0.5},
			{0.1875, -0.5, 0.4375, 0.25, 0.0625, 0.5},
			{0.125, 0.1875, 0.4375, 0.1875, 0.375, 0.5},
			{0.1875, 0.125, 0.4375, 0.25, 0.375, 0.5},
			{-0.25, -0.5, 0.4375, -0.1875, 0.0625, 0.5},
			{-0.1875, -0.5, 0.4375, 0.1875, 0.125, 0.5},
			{-0.0625, 0.375, 0.4375, 0.0625, 0.5625, 0.5},
			{-0.125, 0.5625, 0.4375, 0.125, 0.625, 0.5},
			{-0.1875, 0.625, 0.4375, 0.1875, 0.6875, 0.5},
			{-0.25, 0.6875, 0.4375, 0.25, 1, 0.5},
			{-0.4375, -0.5, 0.4375, -0.25, 1, 0.5},
			{0.25, -0.5, 0.4375, 0.4375, 1, 0.5},
			{0.4375, -0.5, -0.4375, 0.5, 1, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, 1, 0.4375},
			{-0.4375, -0.5, -0.5, 0.4375, 1, -0.4375},
			{-0.4375, -0.5, -0.4375, 0.4375, 0.9375, 0.4375},
		},
	},
	tiles = {"ccmobs_treemonster_top.png", "ccmobs_treemonster_top.png", "ccmobs_treemonster_sides.png",
    "ccmobs_treemonster_sides.png", "ccmobs_treemonster_sides.png", "ccmobs_treemonster_sides.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:treemonster", {
	type = "monster",
	hp_max = 10,
	collisionbox = {-0.8, -1.0, -0.8, 0.85, 1.65, 0.85},
	visual = "wielditem",
	visual_size = {x = 1.0, y = 1.25},
	textures = {"ccmobs:treemonster_block"},
	makes_footstep_sound = false,
	walk_velocity = 0.25,
    run_velocity = 0.45,
	armor = 100,
	drops = {
		{name = "default:tree",
		chance = 1,
		min = 1,
		max = 1,},
		},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 10,
	light_damage = 1,
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
