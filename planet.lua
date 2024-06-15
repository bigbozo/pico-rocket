function draw_planet()
	cls()
	camera(0,0)
	planet=planets[player.planet]
	circfill(64,64,64,planet.color)
	print(planet.name, 63 - #planet.name*2,2,7)
end

function update_planet()
end

function handle_planet()
	if btn(3) then
		_update60 = update_planets
		_draw = draw_planets
		handle_player=handle_planets
	end
end
