--
--Rockmonster
--
minetest.register_node("ccmobs:rockmonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{0.0625, -0.5, -0.1875, 0.375, -0.375, 0.1875},
			{-0.375, -0.5, -0.1875, -0.0625, -0.375, 0.1875},
			{0.0625, -0.375, -0.125, 0.3125, -0.1875, 0.125},
			{-0.3125, -0.375, -0.125, -0.0625, -0.1875, 0.125},
			{-0.3125, -0.1875, -0.3125, 0.3125, 0.25, 0.3125},
			{-0.3125, 0.25, -0.25, 0.3125, 0.5, 0.25},
			{0.25, 0.3125, -0.1875, 0.625, 0.625, 0.1875},
			{-0.625, 0.3125, -0.1875, -0.25, 0.625, 0.1875},
			{0.375, -0.1875, -0.125, 0.5625, 0.3125, 0.125},
			{-0.5625, -0.1875, -0.125, -0.375, 0.3125, 0.125},
			{-0.125, 0.5, 0.1875, 0.125, 0.6875, 0.3125},
			{-0.1875, 0.5, 0.125, 0.1875, 0.8125, 0.1875},
			{0.1875, 0.5, -0.125, 0.25, 0.875, 0.25},
			{-0.25, 0.5, -0.125, -0.1875, 0.875, 0.25},
			{-0.1875, 0.8125, -0.125, 0.25, 0.9375, 0.3125},
			{-0.25, 0.5, -0.1875, 0.25, 0.9375, 0.1875},
		},
	},
	tiles = {"ccmobs_rockmonster_top.png", "ccmobs_rockmonster_top.png", "ccmobs_rockmonster_sides.png",
    "ccmobs_rockmonster_sides.png", "ccmobs_rockmonster_front.png", "ccmobs_rockmonster_front.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:rockmonster", {
	type = "monster",
	hp_max = 18,
	collisionbox = {-0.8, -0.75, -0.8, 0.8, 1.5, 0.8},
	visual = "wielditem",
	visual_size = {x = 1.0, y = 1.0},
	textures = {"ccmobs:rockmonster_block"},
	makes_footstep_sound = false,
	walk_velocity = 0.05,
    run_velocity = 0.15,
	armor = 100,
	drops = {
		{name = "default:stone",
		chance = 1,
		min = 1,
		max = 3,},
		},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 1,
    sounds = {
		random = "ccmobs_rockmonster",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "ccmobs:cage" then
                minetest.sound_play("ccmobs_rockmonster",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "ccmobs:cage")
				clicker:get_inventory():add_item("main", "ccmobs:rockmonster")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("ccmobs:rockmonster", {
	description = "Rockmonster  Spawnegg",
	inventory_image = "ccmobs_spawnegg_rockmonster.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
                minetest.sound_play("ccmobs_rockmonster",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
			minetest.env:add_entity(pointed_thing.above, "ccmobs:rockmonster")
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
