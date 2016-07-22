minetest.register_node("t_lamps:t_nazilamp", {
			  description = "Nazi Lamp",
			  drawtype = "glasslike",
			  tiles = {"t_nazilamp.png"},
			  paramtype = "light",
			  sunlight_propagates = true,
			  is_ground_content = false,
			  groups = {cracky = 3, oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_glass_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_lamps:t_nazilamp 1",
      type = "shapeless",
      recipe = {"dye:red ", "default:meselamp"}
})



if minetest.setting_get("log_mods") then
   minetest.log("action", "t_lamps loaded")
end
