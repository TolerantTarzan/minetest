-- Hitler 1x1

minetest.register_node("t_hitler:t_hitler11", {
			  description = "Hitler_11",
			  tiles = {"t_hitler_11.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler11 1",
      recipe = {
	 {'group:wood', 'default:diamond', ''},
	 {'group:wood', '', ''},
	 {'group:wood', '', ''}
      }
})


-- Hitler 1x2

minetest.register_node("t_hitler:t_hitler12", {
			  description = "Hitler_12",
			  tiles = {"t_hitler_12.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler12 1",
      recipe = {
	 {'', 'default:diamond', 'group:wood'},
	 {'', '', 'group:wood'},
	 {'', '', 'group:wood'}
      }
})

-- Hitler 2x1

minetest.register_node("t_hitler:t_hitler21", {
			  description = "Hitler_21",
			  tiles = {"t_hitler_21.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler21 1",
      recipe = {
	 {'group:wood', '', ''},
	 {'group:wood', 'default:diamond', ''},
	 {'group:wood', '', ''}
      }
})

-- Hitler 2x2

minetest.register_node("t_hitler:t_hitler22", {
			  description = "Hitler_22",
			  tiles = {"t_hitler_22.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler22 1",
      recipe = {
	 {'', '', 'group:wood'},
	 {'', 'default:diamond', 'group:wood'},
	 {'', '', 'group:wood'}
      }
})


-- Hitler 3x1

minetest.register_node("t_hitler:t_hitler31", {
			  description = "Hitler_31",
			  tiles = {"t_hitler_31.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler31 1",
      recipe = {
	 {'group:wood', '', ''},
	 {'group:wood', '', ''},
	 {'group:wood', 'default:diamond', ''}
      }
})

-- Hitler 3x2

minetest.register_node("t_hitler:t_hitler32", {
			  description = "Hitler_32",
			  tiles = {"t_hitler_32.png"},
			  groups = {oddly_breakable_by_hand = 3},
			  sounds = default.node_sound_wood_defaults(),
			  light_source = default.LIGHT_MAX,
	
})

minetest.register_craft({
      output = "t_hitler:t_hitler32 1",
      recipe = {
	 {'', '', 'group:wood'},
	 {'', '', 'group:wood'},
	 {'', 'default:diamond', 'group:wood'}
      }
})

if minetest.setting_get("log_mods") then
   minetest.log("action", "t_hitler loaded")
end
