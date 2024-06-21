PlanetsScene = {

  turns = 0,
  name = 'planets',
  planets = {},

  init = function(self)
    local c = 1
    self.planets = {}
    for planet in all(sun.children) do
      planet.id = c
      planet.type = 1
      c = c+ 1
      add(self.planets,planet)
      for moon in all(planet.children) do
        moon.id = c
        moon.type = 2
        c = c + 1
        add(self.planets,moon)
      end
    end
    self:update()
  end,

  update = function(self)
    for planet in all(sun.children) do
      ct = self.turns * planet.speed
      planet.x = planet.r * sin(ct)
      planet.y=  planet.r * cos(ct)
      if (planet.children) then
        for moon in all(planet.children) do
          ct = self.turns * moon.speed
          moon.x = planet.x + moon.r * sin(ct)
          moon.y = planet.y + moon.r * cos(ct)
        end
      end
    end
  end,

  handle  = function(self)
    self.turns = self.turns + settings.speed
    if (player.transition<1) then
      self:handle_player_transition()
    else
      self:handle_player_idle()
    end
  end,

  draw = function(self)
    cls()
    local p = self.planets[player.planet]
    local op = self.planets[player.oldp]
    -- TODO: add easing function 
    local x = op.x + (p.x-op.x)*player.transition
    local y = op.y + (p.y-op.y)*player.transition
    camera(-64 +x * settings.scale, - 64 + y * settings.scale)
    self:draw_planets()
    self:draw_player()
  end,

  draw_planets  = function(self)
    s = settings.scale
    -- draw sun
    circfill(sun.x, sun.y, max(6,sun.size*settings.scale)+1,7)
    circfill(sun.x, sun.y, max(6,sun.size*settings.scale), sun.color)
    for planet in all(self.planets) do
      -- draw orbit of planet
      if (planet.type==1) then
        circ(0, 0, planet.r * s, 1)
      end
      -- draw planet
      circfill(planet.x * s, planet.y * s, max(1.5 ,planet.size * s),planet.color)
    end
  end,

  draw_player = function(self)
    -- .1 to make backcolor transparent
    fillp(0b01011010010110100101.1)
    local planet = self.planets[player.planet]
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
  end,

  handle_player_idle  = function(self)
    if (btnp(0)) then
      player.oldp = player.planet
      player.planet = min(player.planet+1, #self.planets)
      player.transition =0
    end
    if btnp(1) then
      player.oldp = player.planet
      player.planet = max(1,player.planet-1)
      player.transition = 0
    end
    if btn(2) then
      settings.scale = settings.scale * 1.01
    end
    if btn(3) then
      settings.scale = settings.scale / 1.01
    end
    if btnp(4) then
      CurrentScene = PlanetScene
    end
  end,

  handle_player_transition = function()
    player.transition = player.transition + 1/15
    if (player.transition >= 1) then
      player.transition=1
    end
  end
}

PlanetsScene:init()
