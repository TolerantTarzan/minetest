minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	local wielded_item = puncher:get_wielded_item():get_name()
	if wielded_item == "default:pick_diamond"
	or wielded_item == "default:shovel_diamond"
	or wielded_item == "default:axe_diamond"
	or wielded_item == "default:sword_diamond"
	and node.name ~= "air" then
	    puncher:set_wielded_item({name=wielded_item, count=1, wear=80, metadata=""})
	end
end)