minetest.register_on_newplayer(function(player)
	local activ = {{"1.1.1.1",0,0,0,0}}
	player:set_attribute("activ_task", minetest.serialize(activ))
	player:set_pos({x=0.5, y=2, z=1.25})
	local player_inv = player:get_inventory()
	player_inv:set_stack("main", 1, "stella:axe1")
	player_inv:set_stack("main", 2, "stella:pick1")
	set_hexagon("1.1.1.0", player, true)
	player:set_attribute("LMB", 0)
	local formspec = "bgcolor[#080808BB;true]"
		.."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] "
		.. "background9[5,5;1,1;stella_gui_formbg.png;true;10]"
	player:set_formspec_prepend(formspec)
	player:set_inventory_formspec(stella.invget_formspec(player))
	minetest.show_formspec(player:get_player_name(), "info1" , stella.info1(player))
end)