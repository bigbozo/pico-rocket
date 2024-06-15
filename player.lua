player = {
				oldp = 1,
				planet = 4, 
				speed=2, 
				size=6,
				transition=1
}


function update_player_transitioning()
  player.transition+=1/15
	if (player.transition >= 1) then
	  update_player = update_player_idle
		player.transition=1
	end
end

function update_player_idle()
	if (btnp(0)) then
		player.oldp = player.planet
		player.planet = min(player.planet+1, #planets)
	  player.transition =0
		update_player = update_player_transitioning
	
	end
	if btnp(1) then
		player.oldp = player.planet
		player.planet = max(1,player.planet-1)
		player.transition = 0
		update_player = update_player_transitioning
	end
	if btn(2) then
		settings.scale *=1.01
	end
	if btn(3) then
		settings.scale /=1.01
	end
	if btn(4) then
		_update60 = update_planet
		_draw = draw_planet
	end
end

function draw_player()
	  
  -- .1 to make backcolor transparent
  fillp(0b01011010010110100101.1)
	local planet = planets[player.planet]
  local size= max(2,planet.size * settings.scale)+1
  camera(-64,-64)
	-- cursor
  rect(
   	-size,
  	-size,
    size+1, 
    size+1, 7
  )
	-- crosslines vert 
  line(0, -size, 0, -64)
  line(0, size, 0, 64)
  line(-size, 0, -64, 0)
  line(size, 0, 64, 0)
  fillp()
	-- planet name
	if player.transition==1 then
	 rectfill(3,3,5+4*#planet.name,11,8)
	 rectfill(4,4,4+4*#planet.name,10,7)
	 print(planet.name,5,5,8)
	end

end

update_player = update_player_idle
