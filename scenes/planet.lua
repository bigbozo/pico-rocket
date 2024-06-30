PlanetScene = {

  draw= function()

    planet=planets[player.planet]

    cls(1)
    camera(0,-75)

    -- draw the planet
    circfill(0,0,planet.size * 4,planet.color)

    -- draw the moons of the planet
    if (planet.children) then
      local dx=planet.size * 4
      for moon in all(planet.children) do
        circfill(dx + moon.size * 4 + 4, 0, moon.size * 4, moon.color)
        dx = dx + moon.size * 8 + 4
      end
    end

    camera()
    -- print the planet datasheet
    printr(planet.name, 4, 4)
    printr("distance " .. planet.r .. "000 pc",12,7)
    printr("size " .. planet.size .. "0 pc", 20,7)
    printr("mass " .. planet.size .. "00 t",  28, 7)


  end,

  update = function()
  end,

  init = function()
  end,

  handle= function()
    if btnp(5) then
      change_scene(PlanetsScene)
    end
    if btnp(4) then
      change_scene(HangarScene)
    end
  end,

}
