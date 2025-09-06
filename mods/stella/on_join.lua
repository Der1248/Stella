stella.hud = {}
local map_version = 2
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
	update_tasks(player)
	if file_check(minetest.get_worldpath().."/Map_Version.txt") == false then
		minetest.after(1, update, player:get_player_name())
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write("1")
		file:close()
	end
	local file = io.open(minetest.get_worldpath().."/Map_Version.txt", "r")
	local map_ver = file:read("*l")
    file:close()
	if tonumber(map_ver) < map_version then
		minetest.after(1, update, player:get_player_name())
		local file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write(map_version)
		file:close()
	end
	local active_now = get_active_tasks(player)
	local activ = {}
	for activCount = 1, #active_now do
		atr = minetest.deserialize(player:get_attribute(active_now[activCount]))
		if atr ~= nil then
			table.insert(activ,{active_now[activCount],atr[1],atr[2],atr[3],atr[4]})
		else
			table.insert(activ,{active_now[activCount],0,0,0,0})
		end
	end
	player:set_attribute("activ_task", minetest.serialize(activ))
end)

