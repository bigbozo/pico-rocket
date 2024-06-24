function printc(t,y,c)
  print(t,64-#t*2+1,y+1,0)
  print(t,64-#t*2,y,c)
end

function printr(t,y,c)
  print(t,123 - #t*4+1, y+1, 0)
  print(t,123 - #t*4, y, c)
end
