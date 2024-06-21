CurrentScene = StartScene

_update = function()
  CurrentScene:update()
  CurrentScene:handle()
end

-- define initial draw-function
_draw = function()
  CurrentScene:draw()
end
