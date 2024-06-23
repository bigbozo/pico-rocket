PlanetScene = {

  draw= function()
    cls()
    camera(0,0)
    planet=planets[player.planet]
    circfill(64,64,planet.size * 4,planet.color)
    print(planet.name, 63 - #planet.name*2,2,7)
  end,

  update = function()
  end,

  init = function()
  end,

  handle= function()
    if btnp(4) then
      change_scene(PlanetsScene)
    end
  end,

}
