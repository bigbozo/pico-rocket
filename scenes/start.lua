StartScene = {

  name = 'start',

  draw = function()
    cls(1)
    printc("picorocket",30,7)
    printc("a game of superlatives",56,5)
    line(32,64,96,64,5)
    printc("- build rockets",68,5)
    printc("- explore a solar system",76,5)
    printc("- the universe in your pocket",84,5)
    printc("have fun / press ❎ to start",106,5)
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
