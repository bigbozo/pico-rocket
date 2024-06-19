sun = {
  x=0,
  y=0,
  size=20,
  color=10,
  children = {
    { r=50, speed = 17, color=9, size=5, name="picorino"},
    { r=80, speed = 7, color =11, size=8, name="alpico",
      children = {
        {r=15, speed=11, size=3, color=15, name="mambuz"}
      }
    },
    { r=140, speed = 5, color =8, size=10, name="portico",
      children={
        {r=20, speed=11, size=4, color=15, name="kerbuz"},
        {r=30, speed=13, size=3, color=15, name="wambuz"}
      }
    },
    { r=210, speed=3, color=14, size=15, name="coip",
      children = {
        {r=25,speed=7, size=6, color=15, name="shabuz"}
      }
    },
    { r=300, speed=2, color=13, size=10, name="pocorn"},
    { r=450, speed=1, color=12,size=18, name="jupicto",
      children= {
        {r=60, speed=13, size=4, color=15, name="nimbuz"},
        {r=100, speed=11, size=3, color=15, name="chocbuz"}
      }
    }
  }
}

-- linear collection of all objects to iterate through
planets = {}
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

function draw_planets()
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
