/// @description Insert description here
// You can write your code in this editor
//getting x and y for sprite drawing
pre_x = x
pre_y = y

if place_free(x,y + 5) = false then
	{
		gravity = 0
		vspeed = 0
	}
	else
	{
		gravity = .2
	}
if place_free(x,y - 5) = false then
	{
		vspeed = 0
	}	
if place_free(x,y) = false then
	{
		y -= 1
	}
//movement 
{if keyboard_check(vk_up) then
{
	if place_free(x,y + 5) = false and place_free(x,y - 5) = true then
	{
		vspeed = -10
	}
}
if keyboard_check(vk_down) then
{
	if place_free(x,y + 5) = true then
	{
		y += 5
	}	
}
if keyboard_check(vk_left) then
{
	if place_free(x - 5,y) = true then
	{
		x -= 5
	}	
}
if keyboard_check(vk_right) then
{
	if place_free(x + 5,y) = true then
	{
		x += 5
	}		
}
}

//sprite drawing direction
{if x = pre_x and y = pre_y then
{
	image_index = 0
}
	else
	{
		dir = point_direction(x,y,pre_x,pre_y)
		image_index = (dir div 45) + 1
	}
}


//Collecting a coin
if place_meeting(x,y,Obj_Coin)
{
	var coin = instance_place(x,y,Obj_Coin)
	with (coin)
	{
		instance_destroy()	
	}
	Var_Coin += 1
}