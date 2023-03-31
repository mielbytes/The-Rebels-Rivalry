function love.load()
  -- GAME MODULES
  require("objects.enemy")
  require("objects.player")

  -- LIBRARIES
  sti = require("libraries.sti")
  windfield = require("libraries.windfield")
  camera = require("libraries.camera")
  anim8 = require("libraries.anim8")
  require("libraries.simple-slider")

  -- LOAD OBJECTS
  enemy.load()
  player.load()
end

function love.keypressed(key, scancode, isrepeat)
  -- OBJECT KEYPRESSES
  enemy.keypressed(key, scancode, isrepeat)
  player.keypressed(key, scancode, isrepeat)
end

function love.mousepressed(x, y, button)
  -- OBJECT MOUSEPRESSES
  enemy.mousepressed(x, y, button)
  player.mousepressed(x, y, button)
end

function love.update(dt)
  -- UPDATE OBJECTS
  enemy.update(dt)
  player.update(dt)
end

function love.draw()
  -- DRAW OBJECTS
  enemy.draw()
  player.draw()
end