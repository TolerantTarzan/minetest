minetest.register_on_dieplayer(function(player)
      minetest.chat_send_all(player:get_player_name().." died.")
      minetest.chat_send_player(player:get_player_name(), "Voi voi :( Ota omena.")
	minetest.sound_play("mario", {
		pos = player:getpos(),
		max_hear_distance = 100,
		gain = 10.0,
})
end)

minetest.register_on_respawnplayer(function(player)
	player:get_inventory():add_item("main", "default:torch 20")
	player:get_inventory():add_item("main", "default:apple 20")
end)
