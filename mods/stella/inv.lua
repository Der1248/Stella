stella.stella_inv = minetest.create_detached_inventory("singleplayer_stella_inv",{
	allow_put = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_take = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
})

stella.invget_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
	stella.stella_inv:set_size("tool", 3)
	player_inv:set_size("tool", 3)
	stella.stella_inv:set_size("armor", 2)
	player_inv:set_size("armor", 2)
    stella.stella_inv:set_size("inv", 40)
	player_inv:set_size("inv", 40)
    for i=1, 3 do
		local stack = player_inv:get_stack("main", i)
		stella.stella_inv:set_stack("tool", i, stack)
    end
	for i=1, 2 do
        local stack = player_inv:get_stack("armor", i)
		stella.stella_inv:set_stack("armor", i, stack)
    end
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella.stella_inv:set_stack("inv", i, stack)
    end
	formspec = "size[8,7.5]"
        .."list[detached:singleplayer_stella_inv;tool;2.5,0.5;5,1]"
        .."list[detached:singleplayer_stella_inv;armor;1,1;1,1]"
		.."list[detached:singleplayer_stella_inv;armor;6,1;1,1;1]"
        .."list[detached:singleplayer_stella_inv;inv;0,2.7;8,5]"
	return formspec		
end
	
stella.timber1get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    stella.stella_inv:set_size("inv", 40)
	player_inv:set_size("inv", 40)
	stella.stella_inv:set_size("t1_from1", 1)
	stella.stella_inv:set_size("t1_from2", 1)
	stella.stella_inv:set_size("t1_from", 1)
	stella.stella_inv:set_size("t1_to1", 1)
	stella.stella_inv:set_size("t1_to2", 1)
	player_inv:set_size("t1_from", 1)
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella.stella_inv:set_stack("inv", i, stack)
    end
	local stack = player_inv:get_stack("t1_from", 1)
	stella.stella_inv:set_stack("t1_from", 1, stack)
	local purple = player_inv:get_stack("inv", 1):get_count()
	if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
		stella.stella_inv:set_stack("t1_from1", 1, "stella:resource_1 3")
		stella.stella_inv:set_stack("t1_to1", 1, "stella:resource_3")
	else
		stella.stella_inv:set_stack("t1_from1", 1, "")
		stella.stella_inv:set_stack("t1_to1", 1, "")
	end
	if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
		stella.stella_inv:set_stack("t1_from2", 1, "stella:resource_1 "..math.floor(purple/3)*3)
		stella.stella_inv:set_stack("t1_to2", 1, "stella:resource_3 "..math.floor(purple/3))
	else
		stella.stella_inv:set_stack("t1_from2", 1, "")
		stella.stella_inv:set_stack("t1_to2", 1, "")
	end
	formspec = "size[8,7.5]"
		.."list[detached:singleplayer_stella_inv;t1_from1;1,0;1,1]"
		.."list[detached:singleplayer_stella_inv;t1_from2;1,1;1,1]"
		.."list[detached:singleplayer_stella_inv;t1_from;6,0.5;1,1]"
		.."list[detached:singleplayer_stella_inv;t1_to1;4,0;1,1]"
		.."list[detached:singleplayer_stella_inv;t1_to2;4,1;1,1]"
		.."button[2,0;2,1;timber1_1;-->]"
		.."button[2,1;2,1;timber1_2;-->]"
        .."list[detached:singleplayer_stella_inv;inv;0,2.7;8,5]"
	return formspec		
end

stella.smith1get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    stella.stella_inv:set_size("inv", 40)
	player_inv:set_size("inv", 40)
	stella.stella_inv:set_size("s1_from1", 1)
	stella.stella_inv:set_size("s1_from2", 1)
	stella.stella_inv:set_size("s1_from", 1)
	stella.stella_inv:set_size("s1_to1", 1)
	stella.stella_inv:set_size("s1_to2", 1)
	player_inv:set_size("s1_from", 1)
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella.stella_inv:set_stack("inv", i, stack)
    end
	local stack = player_inv:get_stack("s1_from", 1)
	stella.stella_inv:set_stack("s1_from", 1, stack)
	local gray = player_inv:get_stack("inv", 1):get_count()
	local gray2 = player_inv:get_stack("inv", 2):get_count()
	if gray > 4 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_2" then
		stella.stella_inv:set_stack("s1_from1", 1, "stella:resource_2 5")
		stella.stella_inv:set_stack("s1_to1", 1, "stella:resource_4")
	elseif gray2 > 4 and player_inv:get_stack("inv", 2):get_name() == "stella:resource_2" then
		stella.stella_inv:set_stack("s1_from1", 1, "stella:resource_2 5")
		stella.stella_inv:set_stack("s1_to1", 1, "stella:resource_4")
	else
		stella.stella_inv:set_stack("s1_from1", 1, "")
		stella.stella_inv:set_stack("s1_to1", 1, "")
	end
	if gray > 4 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_2" then
		stella.stella_inv:set_stack("s1_from2", 1, "stella:resource_2 "..math.floor(gray/5)*5)
		stella.stella_inv:set_stack("s1_to2", 1, "stella:resource_4 "..math.floor(gray/5))
	elseif gray2 > 4 and player_inv:get_stack("inv", 2):get_name() == "stella:resource_2" then
		stella.stella_inv:set_stack("s1_from2", 1, "stella:resource_2 "..math.floor(gray2/5)*5)
		stella.stella_inv:set_stack("s1_to2", 1, "stella:resource_4 "..math.floor(gray2/5))
	else
		stella.stella_inv:set_stack("s1_from2", 1, "")
		stella.stella_inv:set_stack("s1_to2", 1, "")
	end
	formspec = "size[8,7.5]"
		.."list[detached:singleplayer_stella_inv;s1_from1;1,0;1,1]"
		.."list[detached:singleplayer_stella_inv;s1_from2;1,1;1,1]"
		.."list[detached:singleplayer_stella_inv;s1_from;6,0.5;1,1]"
		.."list[detached:singleplayer_stella_inv;s1_to1;4,0;1,1]"
		.."list[detached:singleplayer_stella_inv;s1_to2;4,1;1,1]"
		.."button[2,0;2,1;smith1_1;-->]"
		.."button[2,1;2,1;smith1_2;-->]"
        .."list[detached:singleplayer_stella_inv;inv;0,2.7;8,5]"
	return formspec		
end

stella.shop1get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    stella.stella_inv:set_size("inv", 40)
	player_inv:set_size("inv", 40)
	
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella.stella_inv:set_stack("inv", i, stack)
    end
	formspec = "size[8,7.5]"
		.."label[3.2,1;comming soon]"
        .."list[detached:singleplayer_stella_inv;inv;0,2.7;8,5]"
	return formspec		
end


stella.info1 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,3.5]"
		.."label[0,0;Welcome to stella, my newest game for Minetest.]"
		.."label[0,0.3;I originally made this game for the 2021 Minetest GAME JAM.]"
		.."label[0,0.9;Let's get started:]"
		.."label[0,1.2;You are on a small island in the sea and you have to enlarge it.]"
		.."label[0,1.5;For that you have an axe and a pickaxe.]"
		.."label[0,1.8;Go to the purple pillars first. You can mine them with your axe.]"
		.."label[0,2.1;Collect 10 purple resources, go to the first task and expand the island.]"
		.."label[0,2.7;have a good time]"
		.."label[0,3;your 1248]"
	return formspec		
end

stella.info2 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,0.8]"
		.."label[0,0;Well done!]"
		.."label[0,0.3;Now collect more purple resources and expand the island further.]"
	return formspec		
end

stella.info3 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,1.7]"
		.."label[0,0;Nice you made a new friend!]"
		.."label[0,0.3;He can make an orange resource out of 3 purple resources.]"
		.."label[0,0.6;Hit him and you can choose whether you want to convert three]"
		.."label[0,0.9;or all of your purple resources into orange resources.]"
		.."label[0,1.2;After a while, the resources will automatically be added to your inventory.]"
	return formspec		
end

stella.info4 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,0.8]"
		.."label[0,0;You have unlocked another sector of the island!]"
		.."label[0,0.3;You can mine gray resources with your pickaxe.]"
	return formspec		
end

stella.info5 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,0.8]"
		.."label[0,0;Another new friend!]"
		.."label[0,0.3;He can make a silver resource out of 5 gray resources.]"
	return formspec		
end

stella.info6 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,1.3]"
		.."label[0,0;A third friend!]"
		.."label[0,0.3;If you give him the necessary resources he will improve your pickaxe.]"
		.."label[0,0.8;Unfortunately, you will only be able to use this function after the next update.]"
	return formspec		
end

stella.info7 = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[7,1.3]"
		.."label[0,0;And a fourth friend!]"
		.."label[0,0.3;He immediately exchanges fifty purple resources for ten yellow resources]"
		.."label[0,0.8;Unfortunately, you will only be able to use this function after the next update.]"
	return formspec		
end