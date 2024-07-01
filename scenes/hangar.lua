HangarScene = {

  cursor = { x=5, y=5, dx=0, dy=0, transition = 1 },
  max_w = 9,
  max_h = 9,

  rocket = {},

  brush = 1,

  init = function(self)
    if (#self.rocket==0) then
      for i=1,self.max_w do
        self.rocket[i]={}
        for j=1,self.max_h do
          self.rocket[i][j]=1
        end
      end
    end
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
    -- move cursr
    if self.cursor.transition~=1 then
      return
    end
    if (btnp(1) and self.cursor.x<self.max_w) then
      self.cursor.dx = 1
      self.cursor.dy = 0
      self.cursor.transition = 0
    end
    if (btnp(0) and self.cursor.x>1) then
      self.cursor.dx = -1
      self.cursor.transition = 0
    end
    if (btnp(3) and self.cursor.y>1) then
      self.cursor.dy = -1
      self.cursor.transition = 0
    end
    if (btnp(2) and self.cursor.y<self.max_h) then
      self.cursor.dy = 1
      self.cursor.transition = 0
    end
    if btnp(5) then
      self:toggle_part()
    end
    if btnp(4) then
      if (self.brush==0) then
        change_scene(PlanetScene)
        return
      end
      self.rocket[self.cursor.x][self.cursor.y] = rocket_parts[self.brush].spr
    end
  end,

  draw = function(self)
    cls(12)

    local ox = 64 - self.max_w*4
    local oy = 32


    self:draw_grid(ox,oy)
    self:draw_rocket(ox,oy)

    -- draw cursor
    local x = ox - 3 + (self.cursor.x + self.cursor.transition * self.cursor.dx) * 8 -1
    local y = oy + 4 + 8*self.max_h - (self.cursor.y + self.cursor.transition * self.cursor.dy) * 8
    draw_cursor(x,y,6,7)

    -- draw controls
    self:draw_controls()
  end,

  draw_grid = function(self, x, y)
    -- draw grid + axes
    camera(-x,-y)
    spr(50,-6,-8)
    spr(48,-8,8*self.max_h)
    spr(48,8 * self.max_w,8*self.max_h)
    for j=0,self.max_h-1 do
      spr(49,-8,j*8)
    end
    for i=1,self.max_w do
      spr(48,i*8-8,8*self.max_h)
      for j=1,self.max_h do
        spr(51,j*8-8,i*8-8)
      end
    end
    camera()
  end,

  draw_rocket = function(self,x,y)
    y = y + 8*self.max_w
    palt(12,true)
    for i=1,self.max_w do
      for j=1,self.max_h do
        spr(self.rocket[i][j],x- 8 + i*8, y -j*8)
      end
    end
  end,

  draw_controls = function(self)
    camera(-32,-4)
    rectfill(-1,-1,#rocket_parts*13+12,12,12)

    if self.brush==0 then
      rect(0,0,11,11,7)
      printc("back",110,7,64)
    else
      rect(0,0,11,11,1)
    end
    palt(0, false)
    spr(52,2,2)

    -- draw toolbox
    self:draw_toolbox()



    camera()
  end,

  draw_toolbox = function(self)
    for i,part in pairs(rocket_parts) do
      if self.brush == i then
        rect(i*13,0,i*13+11,11,7)
        printc(part.name,110,7,64)
      else
        rect(i*13,0,i*13+11,11,1)
      end
      spr(part.spr,i*13+2,2)
    end
  end,

  toggle_part = function(self)
    self.brush = (self.brush + 1) % (#rocket_parts + 1)
  end


}
