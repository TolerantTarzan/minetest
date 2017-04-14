minetest.register_node("t_jesus:t_jesus", {
			  description = "Jesus Christ",
			  drawtype = "glasslike",
			  tiles = {"t_jesus.png"},
			  paramtype = "light",
			  sunlight_propagates = false,
			  is_ground_content = false,
			  groups = {cracky = 3, oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_glass_defaults(),
			  light_source = default.LIGHT_MAX
	
})

minetest.register_craft({
      output = "t_jesus:t_jesus 1",
      recipe = {
	 {'group:wood', 'default:dirt', 'group:wood'},
	 {'default:dirt', 'default:dirt', 'default:dirt'},
	 {'group:wood', 'default:dirt', 'group:wood'}
      }
})
