StartScene = {

  name = 'start',
  turns = 0,

  draw = function(self)
    if(self.turns % 5 ~= 0) then
      return
    end

    cls(0)
    -- ceiling
    ceiling = 78
    circfill(64, 68, ceiling, 1)
    rectfill(0,64,127,127,0)
    camera(-64, -64)
    for _=1,50 do
      local x = rnd(2 * ceiling) - ceiling
      local y = rnd(sqrt(ceiling*ceiling - x^2))
      pset(x * 0.95, -y * 0.95, 7)
    end
    camera()
    -- title
    printc("picorocket",30,7)
    printc("a game of superlatives",38,3)
    line(0,64,127,64,7 )
    -- bullets
    printc("- build a rocket",70,3)
    printc("- explore the solar system",78,3)
    printc("put the universe in your pocket",92,3)
    -- instructions
    printc("press ❎ to start",109,9)
  end,

  init = function(self)
    self.turns = 0
  end,

  update = function(self)
    self.turns = self.turns + 1
  end,

  handle = function()
    if (btn(4)) then
      -- change to game_Scene
      change_scene(PlanetsScene)
    end
  end

}
