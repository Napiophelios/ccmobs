--
--PIG
--
minetest.register_node("ccmobs:pig_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.4375, -0.4375, 0.3125, 0.125, 0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.375, -0.1875},
			{-0.25, -0.5, -0.375, -0.0625, -0.375, -0.1875},
			{0.0625, -0.5, -0.0625, 0.25, -0.375, 0.125},
			{-0.25, -0.5, -0.0625, -0.0625, -0.375, 0.125},
			{-0.375, -0.0351278, 0.1875, 0.375, 0, 0.3125},
			{-0.1875, -0.3125, 0.375, 0.1875, -0.0625, 0.5},
			{-0.25, -0.375, 0.125, 0.25, 0.0625, 0.375},
			{-0.0625, 0, -0.471661, 0.0625, 0.0625, -0.4375},
			{0.0625, -0.125, -0.471661, 0.125, 0, -0.4375},
			{0, -0.1875, -0.471661, 0.0625, -0.125, -0.4375},
		},
	},
	tiles = {"ccmobs_pig_top.png", "ccmobs_pig_bottom.png", "ccmobs_pig_right_side.png",
    "ccmobs_pig_left_side.png", "ccmobs_pig_front.png", "ccmobs_pig_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:pig", {
	type = "animal",
	hp_max = 4,
	collisionbox = {-0.25, -0.3525, -0.35, 0.25, 0.1, 0.35},
	visual = "wielditem",
	visual_size = {x = 0.45, y = 0.45},
	textures = {"ccmobs:pig_block"},
	makes_footstep_sound = false,
	walk_velocity = 0.45,
    run_velocity = 0.85,
	armor = 100,
	drops = {
		{name = "ccmobs:meat_raw",
		chance = 1,
		min = 1,
		max = 1,},
		},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
    sounds = {
		random = "ccmobs_pig",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "ccmobs:cage" then
                minetest.sound_play("ccmobs_pig_angry",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "ccmobs:cage")
				clicker:get_inventory():add_item("main", "ccmobs:pig")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("ccmobs:pig", {
	description = "Pig  Spawnegg",
	inventory_image = "ccmobs_spawnegg_pig.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
                minetest.sound_play("ccmobs_pig",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
			minetest.env:add_entity(pointed_thing.above, "ccmobs:pig")
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
