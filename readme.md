# Pico-Rocket
The fabulous non-working game in wich you will navigate a solar system with your pico-rocket.

## Scenes
Scenes are Tables which provide the following methods:

  - update(self) = Update the data as needed
  - handle(self) = Handle User Input (executed after update)
  - draw(self) = draw the Scene on screen
  - init(self) = gets called when the global `change_scene(scene)` is called


## TODO

### Hangar-Scene
This is the starting scene

#### Rocket-Specifications
 
  - Thrust (Engines)
  - Weight
  - Range (Fuel)
  - Capacity (Cargo)
  - Integrity (uses integrity value of parts)
  - Air resistance (width of rocket)

  - Rakete
    - Bauteile
      - Nutzlast-Container
        - Diagnose-Einheit
          Zeigt eine Zusammenfassung der Raketen-Daten an, die ansonsten erraten werden müssen
        - Werkzeuge
          - Bohrer
          - Klaue zum Transport von Asteroiden


### Planet(s)

#### Planet-Properties

  - gaseous/solid
  - temperature


### Gameplay
Level structure, 


#### Level 1
Reach orbit

#### Level 2
Escape planets gravity well

#### Level 3
Land after reaching stable orbit

#### Level 4
Reach orbit around moon

#### Level 5
Land on the moon

#### Level 6
First Pico on the moon

#### Level 7
Bring Pico back to planet

...

### Landing-Scene
Scene like lunar lander

### Trading Scene (tbd)

