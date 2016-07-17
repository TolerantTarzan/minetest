--[[
Adds crafts to repair diamond tools.
--]]

minetest.register_craft({
	output = "default:pick_diamond",
	type = "shapeless",
	recipe = {"default:pick_diamond", "default:diamond"}
})

minetest.register_craft({
	output = "default:shovel_diamond",
	type = "shapeless",
	recipe = {"default:shovel_diamond", "default:diamond"}
})

minetest.register_craft({
	output = "default:axe_diamond",
	type = "shapeless",
	recipe = {"default:axe_diamond", "default:diamond"}
})

minetest.register_craft({
	output = "default:sword_diamond",
	type = "shapeless",
	recipe = {"default:sword_diamond", "default:diamond"}
})
