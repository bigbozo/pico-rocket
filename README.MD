# Pico-Rocket
The fabulous non-working game in wich you will navigate a solar system with your pico-rocket.

## Scenes
Scenes are Tables which provide the following methods:

  - update(self) = Update the data as needed
  - handle(self) = Handle User Input (executed after update)
  - draw(self) = draw the Scene on screen
  - init(self) = gets called when the global `change_scene(scene)` is called


