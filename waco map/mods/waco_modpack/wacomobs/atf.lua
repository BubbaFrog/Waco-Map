-- SOUNDS LINK :
-- Shot: https://freesound.org/people/CJDeets/sounds/476740/
-- ira : https://freesound.org/people/Twisted_Euphoria/sounds/205938/


local atfnods = {
"default:dirt",
"default:dirt_with_rainforest",
"default:dirt_with_grass",
"default:dirt_with_dry_grass",
"default:dry_dirt_with_dry_grass",
"default:dirt_with_coniferous_litter",
"default:stone",
"default:ice",
"default:snowblock",
"default:dirt_with_snow",
"default:sand",
"default:desert_sand",
"default:desert_stone",
"default:stone",
"default:desert_stone",
--"default:cobble",
"default:mossycobble",
"default:chest",
"default:ice",

}



mobs:register_mob("wacomobs:atf", {
	-- nametag = "police_officerss" ,
	type = "monster",
	passive = false,
	attack_type = "shoot",
        arrow = "wacomobs:atf_arrow",
	shoot_interval = 2.0,
	shoot_offset = 1.5,
	pathfinding = true,
	reach = 5,
	damage = math.random(3,5),
	hp_min = 20,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.4, -1.0, -0.4, 0.4, 0.9, 0.4},
	visual = "mesh",
	mesh = "hunter.b3d",
	rotate = 180,
	textures = {
		{"atf_agent.png"},
	},
	--glow = 4,
	--blood_texture = "",
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "gun_shot",

		--death = "",
	},
	walk_velocity = 2,
	run_velocity = 5,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	drops = {
		{name = "rangedweapons:m1911", chance = 3, min = 1, max = 1,},
{name = "rangedweapons:sg550", chance = 10, min = 1, max = 1,},
{name = "rangedweapons:mp5", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:baton", chance = 1, min = 1, max = 1,},
{name = "rangedweapons:spym4", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:l85", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:glock", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:spypistol", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:m249", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:qsz92", chance = 15, min = 1, max = 1,},
{name = "rangedweapons:tazer", chance = 1, min = 1, max = 1,},
{name = "rangedweapons:tazerbullet", chance = 2, min = 1, max = 50,}, -- if "rangedweapons" mod is installed	

	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 20,
		walk_end = 60,
		run_start = 80,
		run_end = 100,
		shoot_start = 120,
		shoot_end = 140,
	},
})



mobs:register_arrow("wacomobs:atf_arrow", {
	visual = "sprite",
	visual_size = {x = 0.2, y = 0.2},
	textures = {"shot_bullet.png"},
	velocity = 44,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	minetest.sound_play("wacomobs_impact", {pos=self.object:get_pos(), gain=1.0, max_hear_distance = 10})
	for i=1,10 do

	  minetest.add_particle({
		pos = pos,
		acceleration = 0,
          	velocity = {x =math.random(-3,3),y=math.random(-3,3),z=math.random(-3,3)},
		size = 1,
		expirationtime = 2.0,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 1,
	        })

	        end
	end
})


mobs:spawn({
	name = "wacomobs:atf",
	nodes = police_officernods,
	min_light = 0,
	max_light = 14,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
	active_object_count = 5,
})


mobs:register_egg("wacomobs:atf", "ATF Agent", "atf_inv.png", 0)
