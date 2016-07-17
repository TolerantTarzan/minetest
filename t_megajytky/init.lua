local destroy = function(pos)
	local nodename = minetest.env:get_node(pos).name
	if nodename ~= "air" then
		minetest.env:remove_node(pos)
		nodeupdate(pos)

		--[[
		if math.random(1,4) == 1 then
			return
		end
		--]]

		local drop = minetest.get_node_drops(nodename, "")
		for _,item in ipairs(drop) do
		    if type(item) == "string" then
			   local obj = minetest.env:add_item(pos, item)
		    end
		end
	end
end

megajytky_boom = function(pos, time)
	minetest.after(time, function(pos)
		if minetest.env:get_node(pos).name ~= "t_megajytky:t_megajytky_burning" then
			return
		end
		minetest.sound_play("t_megajytky_explode", {pos=pos, gain=1.5, max_hear_distance=2*64})
		minetest.env:set_node(pos, {name="t_megajytky:megajytky_boom"})
		minetest.after(0.5, function(pos)
			minetest.env:remove_node(pos)
		end, {x=pos.x, y=pos.y, z=pos.z})
		
		local objects = minetest.env:get_objects_inside_radius(pos, 7)
		for _,obj in ipairs(objects) do
			if obj:is_player() or (obj:get_luaentity() and obj:get_luaentity().name ~= "__builtin:item") then
				local obj_p = obj:getpos()
				local vec = {x=obj_p.x-pos.x, y=obj_p.y-pos.y, z=obj_p.z-pos.z}
				local dist = (vec.x^2+vec.y^2+vec.z^2)^0.5
				local damage = (80*0.5^dist)*2
				obj:punch(obj, 1.0, {
					full_punch_interval=1.0,
					damage_groups={fleshy=damage},
				}, vec)
			end
		end
		
		for dx=-8,8 do
			for dz=-8,8 do
				for dy=8,-8,-1 do
					pos.x = pos.x+dx
					pos.y = pos.y+dy
					pos.z = pos.z+dz
					
					local node =  minetest.env:get_node(pos)
					if node.name == "t_megajytky:t_megajytky" or node.name == "t_megajytky:t_megajytky_burning" then
						minetest.env:set_node(pos, {name="t_megajytky:t_megajytky_burning"})
						megajytky_boom({x=pos.x, y=pos.y, z=pos.z}, 0)
					elseif node.name == "fire:basic_flame" or string.find(node.name, "default:water_") or string.find(node.name, "default:lava_") or node.name == "t_megajytky:megajytky_boom" then
						
					else
					   destroy(pos)
					end
					
					pos.x = pos.x-dx
					pos.y = pos.y-dy
					pos.z = pos.z-dz
				end
			end
		end
		
		minetest.add_particlespawner(
			100, --amount
			0.1, --time
			{x=pos.x-3, y=pos.y-3, z=pos.z-3}, --minpos
			{x=pos.x+3, y=pos.y+3, z=pos.z+3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=5,z=-0.5}, --minacc
			{x=0.5,y=5,z=0.5}, --maxacc
			0.1, --minexptime
			1, --maxexptime
			8, --minsize
			15, --maxsize
			false, --collisiondetection
			"t_megajytky_smoke.png" --texture
		)
	end, pos)
end

minetest.register_node("t_megajytky:t_megajytky", {
	description = "MEGA JYTKY!!!",
	tiles = {"t_megajytky_top.png", "t_megajytky_bottom.png", "t_megajytky_side.png"},
	groups = {dig_immediate=2, mesecon=2},
	sounds = default.node_sound_wood_defaults(),
	
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "default:torch" then
			minetest.sound_play("t_megajytky_ignite", {pos=pos})
			minetest.env:set_node(pos, {name="t_megajytky:t_megajytky_burning"})
			megajytky_boom(pos, 4)
		end
	end,
	
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.env:set_node(pos, {name="t_megajytky:t_megajytky_burning"})
				megajytky_boom(pos, 0)
			end
		},
	},
})

minetest.register_node("t_megajytky:t_megajytky_burning", {
	tiles = {{name="t_megajytky_top_burning_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1}}, "t_megajytky_bottom.png", "t_megajytky_side.png"},
	light_source = LIGHT_MAX,
	drop = "t_megajytky:t_megajytky",
	groups = {dig_immediate=2, mesecon=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("t_megajytky:megajytky_boom", {
	drawtype = "plantlike",
	tiles = {"t_vmegajytky_boom.png"},
	light_source = LIGHT_MAX,
	walkable = false,
	drop = "",
	groups = {dig_immediate=3},
})

burn = function(pos)
	if minetest.env:get_node(pos).name == "t_megajytky:t_megajytky" then
		minetest.sound_play("t_megajytky_ignite", {pos=pos})
		minetest.env:set_node(pos, {name="t_megajytky:t_megajytky_burning"})
		boom(pos, 1)
		return
	end
	if minetest.env:get_node(pos).name ~= "tnt:gunpowder" then
		return
	end
	minetest.sound_play("tnt:gunpowder_burning", {pos=pos, gain=2})
	minetest.env:set_node(pos, {name="tnt:gunpowder_burning"})
	
	minetest.after(1, function(pos)
		if minetest.env:get_node(pos).name ~= "tnt:gunpowder_burning" then
			return
		end
		minetest.after(0.5, function(pos)
			minetest.env:remove_node(pos)
		end, {x=pos.x, y=pos.y, z=pos.z})
		for dx=-1,1 do
			for dz=-1,1 do
				for dy=-1,1 do
					pos.x = pos.x+dx
					pos.y = pos.y+dy
					pos.z = pos.z+dz
					
					if not (math.abs(dx) == 1 and math.abs(dz) == 1) then
						if dy == 0 then
							burn({x=pos.x, y=pos.y, z=pos.z})
						else
							if math.abs(dx) == 1 or math.abs(dz) == 1 then
								burn({x=pos.x, y=pos.y, z=pos.z})
							end
						end
					end
					
					pos.x = pos.x-dx
					pos.y = pos.y-dy
					pos.z = pos.z-dz
				end
			end
		end
	end, pos)
end

minetest.register_abm({
	nodenames = {"t_megajytky:t_megajytky", "tnt:gunpowder"},
	neighbors = {"fire:basic_flame"},
	interval = 2,
	chance = 10,
	action = function(pos, node)
		if node.name == "t_megajytky:t_megajytky" then
			minetest.env:set_node(pos, {name="t_megajytky:t_megajytky_burning"})
			boom({x=pos.x, y=pos.y, z=pos.z}, 0)
		else
			burn(pos)
		end
	end
})


minetest.register_craft({
	output = "t_megajytky:t_megajytky",
	recipe = {
		{"t_jytky:t_jytky", "t_jytky:t_jytky"},
		{"t_jytky:t_jytky", "t_jytky:t_jytky"}
	}
})

if minetest.setting_get("log_mods") then
	minetest.log("action", "t_megajytky loaded")
end
