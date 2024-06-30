HangarScene = {

  cursor = { x=0, y=0, dx=0, dy=0, transition = 1 },

  rocket = {},

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
    if btnp(5) then
      change_scene(PlanetScene)
    end
  end,

  draw = function(self)
    cls(12)
    camera()
    -- draw grid + axes
    spr(50,16,16)
    spr(48,16,104)
    spr(48,104,104)
    for i=3,12 do
      spr(49,16,i*8)
      spr(48,i*8,104)
      for j=3,12 do
        spr(51,j*8,i*8)
      end
    end

    -- draw cursor
    camera(-28,-100)
    local x = (self.cursor.x + self.cursor.transition * self.cursor.dx) * 8 -1
    local y = (self.cursor.y + self.cursor.transition * self.cursor.dy) * 8
    draw_cursor(x,y,6,7)
  end

}
