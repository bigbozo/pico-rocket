settings = {
	speed = 0x0.004,
	scale = .25
}
-- linear collection of all objects to iterate through
planets = {}

-- the data for the solar system
sun = {
  x=0,
  y=0,
  size=20,
  color=10,
  mass = 32000,
  children = {
    { r=50, mass=10, speed = 17, color=9, size=5, name="picorino"},
    { r=80, mass=40, speed = 7, color =11, size=8, name="alpico",
      children = {
        {r=15, mass=5, speed=11, size=3, color=15, name="mambuz"}
      }
    },
    { r=140, mass=50, speed = 5, color =8, size=10, name="portico",
      children={
        {r=20, mass=8, speed=11, size=4, color=15, name="kerbuz"},
        {r=30, mass=5, speed=13, size=3, color=15, name="wambuz"}
      }
    },
    { r=210, mass=200, speed=3, color=14, size=15, name="ciopo",
      children = {
        {r=25,mass=20, speed=7, size=6, color=15, name="shabuz"}
      }
    },
    { r=300, mass=120, speed=2, color=13, size=10, name="pocorn"},
    { r=450, mass=400, speed=1, color=12,size=18, name="jupico",
      children= {
        {r=60, mass=10, speed=13, size=4, color=15, name="nimbuz"},
        {r=100, mass=6, speed=11, size=3, color=15, name="chocbuz"}
      }
    }
  }
}


player = {
  oldp = 1,
  planet = 4,
  speed=2,
  size=6,
  transition=1
}

rocket_parts = {
  { spr = 52, name = "back", action="back"},
  { spr = 10, name = "integrity" , action="part", frame=true, price=1},
  { spr = 11, name = "lifesupport" , action="part", frame=true, price=1000},
  { spr = 53, name = "fuel" , action="part", frame=true, price=5},
  { spr = 55, name = "transport", action="part", frame=true, price=10},
  { spr = 44, name = "engine" , action="part", price=50},
  { spr = 13, name = "antenna" , action="part", price=250},
  { spr = 54, name = "trash", action="erase"},
}
