--
--COW
--
minetest.register_node("ccmobs:cow_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.25, -0.4375, 0.3125, 0.3125, 0.1875},
			{-0.1875, -0.0625, 0.1875, 0.1875, 0.1875, 0.25},
			{-0.1875, -0.125, 0.25, 0.1875, 0.125, 0.5625},
			{-0.3125, 0.125, 0.25, 0.3125, 0.1875, 0.375},
			{-0.1875, -0.1875, 0.25, 0.1875, 0.1875, 0.4375},
			{-0.125, -0.25, 0.1875, 0.125, 0.1875, 0.3125},
			{-0.25, -0.5, -0.0625, -0.0625, -0.1875, 0.125},
			{0.0625, -0.5, -0.0625, 0.25, -0.0625, 0.125},
			{-0.25, -0.5, -0.375, -0.0625, -0.1875, -0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.25, -0.1875},
			{-0.0276272, -0.1875, -0.478997, 0.0376734, 0.1875, -0.4375},
			{-0.125, 0.1875, 0.1875, 0.125, 0.25, 0.375}
		},
	},
	tiles = {"ccmobs_cow_top.png", "ccmobs_cow_bottom.png", "ccmobs_cow_right_side.png",
    "ccmobs_cow_left_side.png", "ccmobs_cow_front.png", "ccmobs_cow_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:cow", {
	type = "animal",
	hp_max = 10,
	collisionbox = {-0.9, -1, -1, 0.9, 0.9, 1},
	visual = "wielditem",
	visual_size = {x = 1.355, y = 1.355},
	textures = {"ccmobs:cow_block"},
	makes_footstep_sound = false,
	walk_velocity = 0.25,
    run_velocity = 0.5,
	jump = false,
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
		random = "ccmobs_cow",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "bucket:bucket_empty" and not self.empty then
		self.empty = true
                minetest.sound_play("ccmobs_cow",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "bucket:bucket_empty")
				clicker:get_inventory():add_item("main", "ccmobs:bucket_milk")
		elseif tool == "ccmobs:cage" then
                minetest.sound_play("ccmobs_cow",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "ccmobs:cage")
				clicker:get_inventory():add_item("main", "ccmobs:cow")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("ccmobs:cow", {
	description = "Cow",
	inventory_image = "cow_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
            minetest.sound_play("ccmobs_cow",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
			minetest.env:add_entity(pointed_thing.above, "ccmobs:cow")
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
