Dependencies = {}

require "objects.enemy"
require "objects.player"
require"objects.world"
-- LIBRARIES
sti = require("libraries.sti")
wf = require("libraries.windfield")
camera = require("libraries.camera")
cam = camera()
anim8 = require("libraries.anim8")
require("libraries.simple-slider")






function Dependencies:load()
    enemy.load()
    player.load()
  
end


function Dependencies:update(dt)
    enemy.update(dt)
    player.update(dt)
end


function Dependencies:draw()
    enemy.draw()
    player.draw()
end

function Dependencies:keypressed(key, scancode, isrepeats)
    enemy.keypressed(key, scancode, isrepeat)
    player.keypressed(key, scancode, isrepeat)
end

function Dependencies:mousepressed(x,y,button)
    enemy.mousepressed(x, y, button)
    player.mousepressed(x, y, button)
end
