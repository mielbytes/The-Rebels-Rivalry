Dependencies = {}


require("utilities.util")
fonts = {
  mini = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 8),
  small = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 16),
  big = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 32),
  huge = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 50)
}
-- LIBRARIES
Class = require"libraries.class"
sti = require("libraries.sti")
wf = require("libraries.windfield")
camera = require("libraries.camera")
cam = camera()
anim8 = require("libraries.anim8")
require("libraries.simple-slider")
world = wf.newWorld(0, 0, true)
require("test_world")
require"objects.enemy"
require"objects.officer"
require"objects.rookie"
require"objects.sniper"
require"objects.general"
require"objects.player"
require"objects.player_run"
require"objects.player_shoot"
require"objects.bullet"
require("utilities.menu")
require"utilities.Global_Variables"
require"utilities.sfx"
require"utilities.options"
require"utilities.controls"
require"utilities.Debug"
require"utilities.settings"

function Dependencies:load()
  love.audio.stop()
  gameState = "menu" --menu
  test_world:load()
  menu:load()
  sfx:load()
  options:load()
  controls:load()
  Debug:load()
  settings:load()
end


function Dependencies:update(dt)
  if gameState == "playing" then
    player:update(dt)
  end
  if gameState == "playing" then
    test_world:update(dt)
  end
  menu:update(dt)
  options:update(dt)
  controls:update(dt)
  Debug:update(dt)
  settings:update(dt)
end


function Dependencies:draw()
  if gameState == "playing" then
    test_world:draw()
  end
  menu:draw()
  options:draw()
  controls:draw()
  settings:draw()
  Debug:draw()
end

function Dependencies:keypressed(key, scancode, isrepeat)
  if gameState == "playing" then
    player:keypressed(key, scancode, isrepeat)
  end
  menu:keypressed(key, scancode, isrepeat)
  -- if key == "escape" then
  --   love.event.quit()
  -- end
  options:keypressed(key, scancode, isrepeat)
  controls:keypressed(key, scancode, isrepeat)
  settings:keypressed(key, scancode, isrepeat)
  if gameState == "playing" then
    if key == "escape" then
      gameState = "settings"
      optionssettingsButton.clicked = false
      controlssettingsButton.clicked = false
      quitsettingsButton.clicked = false
      menuButton.clicked = false
    end
  elseif gameState == "settings" then
    if key == "escape" then
      gameState = "playing"
      optionssettingsButton.clicked = true
      controlssettingsButton.clicked = true
      quitsettingsButton.clicked = true
      menuButton.clicked = true
    end
  end
end

function Dependencies:mousepressed(x,y,button)
  if gameState == "playing" then
    player:mousepressed(x, y, button)
  end
  menu:mousepressed(x, y, button)
  options:mousepressed(x,y,button)
  controls:mousepressed(x, y, button)
  settings:mousepressed(x, y, button)
end

function Dependencies:keyreleased(key)
  player:keyreleased(key)
end