stella.hud = {}
minetest.register_on_joinplayer(function(player)
	player:set_attribute("1.1.1.0", "y")
	if player:get_player_name() == "singleplayer" then
    else
        minetest.kick_player(player:get_player_name(), "you can play stella only as 'singleplayer'")
    end
	player:hud_set_hotbar_itemcount(3)
	player:hud_set_hotbar_image("stella_gui_hotbar.png")
	player:hud_set_hotbar_selected_image("stella_gui_hotbar_selected.png")
	local formspec = "bgcolor[#080808BB;true]"
		.."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] "
		.. "background9[5,5;1,1;stella_gui_formbg.png;true;10]"
	player:set_formspec_prepend(formspec)
	player:set_inventory_formspec(stella.invget_formspec(player))
	stella.stella_inv:set_size("inv", 40)
	stella.hud["1"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	stella.hud["2"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	stella.hud["3"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	stella.hud["4"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	stella.hud["5"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	update_tasks(player)
	if file_check(minetest.get_worldpath().."/Map_Version.txt") == false then
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write("1")
		file:close()
	end
end)