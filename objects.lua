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
  children = {
    { r=50, speed = 17, color=9, size=5, name="picorino"},
    { r=80, speed = 7, color =11, size=8, name="alpico",
      children = {
        {r=15, speed=11, size=3, color=15, name="mambuz"}
      }
    },
    { r=140, speed = 5, color =8, size=10, name="portico",
      children={
        {r=20, speed=11, size=4, color=15, name="kerbuz"},
        {r=30, speed=13, size=3, color=15, name="wambuz"}
      }
    },
    { r=210, speed=3, color=14, size=15, name="coip",
      children = {
        {r=25,speed=7, size=6, color=15, name="shabuz"}
      }
    },
    { r=300, speed=2, color=13, size=10, name="pocorn"},
    { r=450, speed=1, color=12,size=18, name="jupico",
      children= {
        {r=60, speed=13, size=4, color=15, name="nimbuz"},
        {r=100, speed=11, size=3, color=15, name="chocbuz"}
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
