--
--Rockmonster
--
minetest.register_node("ccmobs:rockmonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{0.0625, -0.5, -0.125, 0.25, -0.4375, 0.125},
			{-0.25, -0.5, -0.125, -0.0625, -0.4375, 0.125},
			{0.0625, -0.4375, -0.0625, 0.1875, -0.25, 0.0625},
			{-0.1875, -0.4375, -0.0625, -0.0625, -0.25, 0.0625},
			{-0.25, -0.25, -0.125, 0.25, 0.125, 0.125},
			{-0.1875, -0.3125, -0.1875, 0.1875, 0.0625, 0.1875},
			{-0.125, 0.125, -0.0625, 0.125, 0.1875, 0.0625},
			{-0.1875, 0.4375, -0.125, 0.1875, 0.5, 0.155877},
			{-0.125, 0.1875, -0.125, 0.125, 0.4375, 0.0625},
			{0.125, 0.1875, -0.125, 0.1875, 0.5, 0.125},
			{-0.1875, 0.1875, -0.125, -0.125, 0.5, 0.125},
			{-0.125, 0.1875, 0.0625, 0.125, 0.325302, 0.15031},
			{-0.0625, 0.1875, -0, 0.0625, 0.4375, 0.122475},
			{-0.450931, 0, -0.108557, -0.1875, 0.1875, 0.105774},
			{0.1875, 0, -0.108557, 0.459281, 0.1875, 0.105774},
			{0.270002, -0.3125, -0.0625, 0.409178, 0, 0.0625},
			{-0.406394, -0.3125, -0.0625, -0.272785, 0, 0.0625},
		},
	},
	tiles = {"ccmobs_rockmonster_top.png", "ccmobs_rockmonster_bottom.png", "ccmobs_rockmonster_sides.png",
    "ccmobs_rockmonster_sides.png", "ccmobs_rockmonster_front.png", "ccmobs_rockmonster_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("ccmobs:rockmonster", {
	type = "monster",
	hp_max = 10,
	collisionbox = {-1.0, -1.7, -1.0, 1.0, 1.7, 1.0},
	visual = "wielditem",
	textures = {"ccmobs:rockmonster_block"},
	visual_size = {x = 2.0, y = 2.25},
	makes_footstep_sound = false,
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:stone",
		chance = 1,
		min = 2,
		max = 5,},
	},
	light_resistant = true,
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "dogfight",
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
