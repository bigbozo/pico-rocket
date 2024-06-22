StartScene = {

  name = 'start',

  draw = function()
    cls(0)
    -- ceiling
    ceiling = 78
    circfill(64, 68, ceiling, 1)
    rectfill(0,64,127,127,0)
    camera(-64, -64)
    for _=1,10 do
      local x = rnd(2 * ceiling) - ceiling
      local y = rnd(sqrt(ceiling*ceiling - x^2))
      pset(x , -y,7)
    end
    camera()
    -- title
    printc("picorocket",30,7)
    printc("a game of superlatives",38,3)
    line(0,64,127,64,7 )
    -- bullets
    printc("- build a rockets",70,3)
    printc("- explore a solar system",78,3)
    printc("put the universe in your pocket",92,3)
    -- instructions
    printc("press ❎ to start",109,9)
  end,

  init = function()
  end,

  update = function()
  end,

  handle = function()
    
    if (btn(4)) then
      -- change to game_Scene
      CurrentScene = PlanetsScene
    end
  end

}
