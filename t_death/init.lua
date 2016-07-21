minetest.register_on_dieplayer(function(player)
      pos = player:getpos()
      name = player:get_player_name()
      minetest.chat_send_all(name .. " died at (" .. math.floor(pos.x) .. ", " .. math.floor(pos.y) ..  ", " .. math.floor(pos.z) .. ")." )
	minetest.sound_play("mario", {
		pos = pos,
		max_hear_distance = 100,
		gain = 10.0,
})
end)

minetest.register_on_respawnplayer(function(player)
	player:get_inventory():add_item("main", "default:torch 20")
	player:get_inventory():add_item("main", "default:apple 20")
end)
