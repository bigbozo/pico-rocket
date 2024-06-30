_update = function()
  CurrentScene:update()
  CurrentScene:handle()
end

-- define initial draw-function
_draw = function()
  CurrentScene:draw()
end

change_scene = function(scene)
  printh(scene)
  CurrentScene = scene
  scene:init()
end

change_scene(StartScene)
