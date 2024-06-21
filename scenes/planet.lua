PlanetScene = {

  draw= function()
    cls()
    camera(0,0)
    -- TODO das scheint falsch, planets sollte nicht von 
    -- dort referenziert werden
    planet=PlanetsScene.planets[player.planet]
    circfill(64,64,64,planet.color)
    print(planet.name, 63 - #planet.name*2,2,7)
  end,

  update= function()
  end,

  handle= function()
    if btn(3) then
      CurrentScene = PlanetsScene
    end
  end,

}
