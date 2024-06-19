-- draw the title screen
function draw_start_scene()
  cls(1)
  printc("picorocket",30,7)
  printc("a game of superlatives",56,5)
  line(32,64,96,64,5)
  printc("- build rockets",68,5)
  printc("- explore a solar system",76,5)
  printc("have fun / press ❎ to start",106,5)
end

-- nothing to initialize
function init_start()
end

function update_start()
  if (btn(5)) then
    -- change to game_Scene
    init_planets()
    scene_update = update_planets()
    scene_handle = handle_planets()
    _draw = draw_planets()
  end
end



