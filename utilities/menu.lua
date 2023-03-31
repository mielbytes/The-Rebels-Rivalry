menu = {}
local darkGray = {0.1, 0.1, 0.1}
local lightGray = {0.8, 0.8, 0.8}

function menu:load()
  -- PLAY BUTTON TABLE
  playButton = {
    x = love.graphics.getWidth() / 2,
    y = (love.graphics.getHeight() / 2) - love.graphics.getHeight() / 5,
    w = 300,
    h = 100,
    clicked = false
  }
end

function menu:keypressed(key, scancode, isrepeat)
  
end

function menu:mousepressed(x, y, button)
  
end

function menu:update(dt)
  
end

local function isHovering(x, y, w, h)
  local mouseX, mouseY = love.mouse.getPosition()
  if mouseX > x and mouseX < x + w and mouseY > y and mouseY < y + h then
    return true
  else
    return false
  end
end

function menu:draw()
  if gameState == "menu" then
    -- DRAW BACKGROUND COLOR
    local top = love.graphics.getHeight()
    local bottom = 0
    for y = bottom, top do
      local gradient = (y - bottom) / (top - bottom)
      local color = {
        lightGray[1] * (1 - gradient) + darkGray[1] * gradient,
        lightGray[2] * (1 - gradient) + darkGray[2] * gradient,
        lightGray[3] * (1 - gradient) + darkGray[3] * gradient
      }
      love.graphics.setColor(color)
      love.graphics.line(0, y, love.graphics.getWidth(), y)
    end
    
    -- DRAW PLAY BUTTON
    if isHovering(playButton.x - playButton.w / 2, playButton.y - playButton.h / 2, playButton.w, playButton.h) and not playButton.clicked then
      love.graphics.setColor(172/255, 57/255, 43/255)
    else
      love.graphics.setColor(255/255, 76/255, 60/255)
    end
    love.graphics.rectangle("fill", playButton.x - playButton.w / 2, playButton.y - playButton.h / 2, playButton.w, playButton.h)
    love.graphics.setFont(fonts.huge)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("PLAY", playButton.x - playButton.w / 2, (playButton.y - playButton.h / 2) + playButton.h / 2 - love.graphics.getFont():getHeight() / 2, playButton.w, "center")
  end
end

return menu