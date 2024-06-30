function printc(t,y,c,w)
  if w then 
    w=w/2
  else
    w=64
  end

  print(t,w-#t*2+1,y+1,0)
  print(t,w-#t*2,y,c)
end

function printr(t,y,c)
  print(t,123 - #t*4+1, y+1, 0)
  print(t,123 - #t*4, y, c)
end

function draw_cursor(x, y, radius, color)
  -- .1 to make backcolor transparent
  fillp(0b01011010010110100101.1)
  -- cursor
  rect(
    x-radius,
    y-radius,
    x+radius,
    y+radius,color 
  )
  -- crosslines vert 
  line(x, y-radius, x, y-127)
  line(x, y+radius, x, y+127)
  line(x-radius, y, x-127, y)
  line(x+radius, y, x+127, y)
  fillp()
end

