HangarScene = {

  cursor = { x=0, y=0, dx=0, dy=0, transition = 1 },

  rocket = {},

  brush = 1,

  init = function(self)
    -- nothing so far
  end,

  update= function(self)
    self.cursor.transition = min(1,self.cursor.transition+.2)
    if (self.cursor.transition==1) then
      self.cursor.x = self.cursor.x + self.cursor.dx
      self.cursor.y = self.cursor.y + self.cursor.dy
      self.cursor.dx = 0
      self.cursor.dy = 0
    end
  end,

  handle = function(self)
    -- move cursor
    if self.cursor.transition~=1 then
      return
    end
    if btnp(1) then
      self.cursor.dx = 1
      self.cursor.dy = 0
      self.cursor.transition = 0
    end
    if btnp(0) then
      self.cursor.dx = -1
      self.cursor.transition = 0
    end
    if btnp(3) then
      self.cursor.dy = 1
      self.cursor.transition = 0
    end
    if btnp(2) then
      self.cursor.dy = -1
      self.cursor.transition = 0
    end
    if btnp(4) then
      self:togglePart()
    end
    if btnp(5) then
      change_scene(PlanetScene)
    end
  end,

  draw = function(self)
    cls(12)

    self.draw_grid(24,24)
    -- draw cursor
    local x = 28 + (self.cursor.x + self.cursor.transition * self.cursor.dx) * 8 -1
    local y = 100 + (self.cursor.y + self.cursor.transition * self.cursor.dy) * 8
    draw_cursor(x,y,6,7)

    -- draw controls
    self:draw_controls()
  end,

  draw_grid = function(x, y)
    -- draw grid + axes
    camera(-x,-y)
    spr(50,-8,-8)
    spr(48,-8,80)
    spr(48,80,80)
    for i=0,9 do
      spr(49,-8,i*8)
      spr(48,i*8,80)
      for j=0,9 do
        spr(51,j*8,i*8)
      end
    end
    camera()
  end,

  draw_controls = function(self)
    camera(-4,-4)
    palt(0, false)
    local c=0
    for i,part in pairs(rocket_parts) do
      if self.brush == i then

      rect(i*13-2,2,i*13+9,13,1)
      else
      rect(i*13-2,2,i*13+9,13,2)
      end

      spr(part.spr,i*13,4)
    end
    camera()
  end


}
