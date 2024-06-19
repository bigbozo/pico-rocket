function init_planets()
  local c = 1
  for planet in all(sun.children) do
    planet.id = c
    planet.type = 1
    c = c+ 1
    add(planets,planet)
    for moon in all(planet.children) do
      moon.id = c
      moon.type = 2
      c = c + 1
      add(planets,moon)
    end
  end
end

function update_planets()
  for planet in all(sun.children) do
    ct = turns * planet.speed
    planet.x = planet.r * sin(ct)
    planet.y=  planet.r * cos(ct)
    if (planet.children) then
      for moon in all(planet.children) do
        ct = turns  * moon.speed
        moon.x = planet.x + moon.r * sin(ct)
        moon.y = planet.y + moon.r * cos(ct)
      end
    end
  end
end

function draw_planets()
  s = settings.scale
  -- draw sun
  circfill(sun.x, sun.y, max(6,sun.size*settings.scale)+1,7)
  circfill(sun.x, sun.y, max(6,sun.size*settings.scale), sun.color)

  for planet in all(planets) do
    -- draw orbit of planet
    if (planet.type==1) then
      circ(0, 0, planet.r * s, 1)
    end
    -- draw planet
    circfill(planet.x * s, planet.y * s, max(1.5 ,planet.size * s),planet.color)
  end
end

function draw_planets_scene()
  cls()
  local p = planets[player.planet]
  local op = planets[player.oldp]
  -- TODO: add easing function 
  local x = op.x + (p.x-op.x)*player.transition
  local y = op.y + (p.y-op.y)*player.transition

  camera(-64 +x * settings.scale, - 64 + y * settings.scale)
  draw_planets()
  draw_player()
end
