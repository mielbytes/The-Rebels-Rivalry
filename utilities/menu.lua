menu = {}
local darkGray = {0.1, 0.1, 0.1}
local lightGray = {0.8, 0.8, 0.8}

function menu:load()
  buttonRadius = 15
  -- PLAY BUTTON TABLE
  playButton = {
    w = 300,
    h = 100,
    clicked = false
  }

  optionsButton = {
    w = 300,
    h = 100,
    clicked = false
  }
  
  controlsButton = {
    w = 300,
    h = 100,
    clicked = false
  }

  quitButton = {
    w = 300,
    h = 100,
    clicked = false
  }

  menu:updateButtonPositions()

  gameStates = {
    "menu",
    "playing",
    "optionsmenu",
    "optionssettings",
    "controlsmenu",
    "controlssettings"
  }
end


function menu:keypressed(key, scancode, isrepeat)
  
end

function menu:updateButtonPositions()
  local gap = 20

  playButton.x = love.graphics.getWidth() / 2 - playButton.w / 2
  playButton.y = (love.graphics.getHeight() / 2) - (1.5 * playButton.h) - gap

  optionsButton.x = love.graphics.getWidth() / 2 - optionsButton.w / 2
  optionsButton.y = (love.graphics.getHeight() / 2) - optionsButton.h / 2

  controlsButton.x = love.graphics.getWidth() / 2 - controlsButton.w / 2
  controlsButton.y = (love.graphics.getHeight() / 2) + (0.9 * controlsButton.h) - gap

  quitButton.x = love.graphics.getWidth() / 2 - quitButton.w / 2
  quitButton.y = (love.graphics.getHeight() / 2) + (2.1 * quitButton.h) - gap
end


function menu:mousepressed(x, y, button)
  if button == 1 and x >= playButton.x and x <= playButton.x + playButton.w and y >= playButton.y and y <= playButton.y + playButton.h and not playButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    playButton.clicked = true
    optionsButton.clicked = true
    controlsButton.clicked = true
    quitButton.clicked = true
    optionsbackButton.clicked = true
    controlsbackButton.clicked = true
    gameState = "playing"
  end

  if button == 1 and x >= optionsButton.x and x <= optionsButton.x + optionsButton.w and y >= optionsButton.y and y <= optionsButton.y + optionsButton.h and not optionsButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    playButton.clicked = true
    optionsButton.clicked = true
    controlsButton.clicked = true
    optionsbackButton.clicked = false
    quitButton.clicked = true
    controlsbackButton.clicked = true
    gameState = "optionsmenu"
  end
  
  if button == 1 and x >= controlsButton.x and x <= controlsButton.x + controlsButton.w and y >= controlsButton.y and y <= controlsButton.y + controlsButton.h and not controlsButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    playButton.clicked = true
    optionsButton.clicked = true
    controlsButton.clicked = true
    optionsbackButton.clicked = true
    quitButton.clicked = true
    controlsbackButton.clicked = false
    gameState = "controlsmenu"
  end

  if button == 1 and x >= quitButton.x and x <= quitButton.x + quitButton.w and y >= quitButton.y and y <= quitButton.y + quitButton.h and not quitButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    love.event.quit()
  end
end

function menu:update(dt)
  if gameState == "menu" or gameState == "optionsmenu" or gameState == "controlsmenu" then
    love.audio.play(menubackground)
  else
    love.audio.stop(menubackground)
  end
end

function isHovering(x, y, w, h)
  local mouseX, mouseY = love.mouse.getPosition()
  if mouseX > x and mouseX < x + w and mouseY > y and mouseY < y + h then
    return true
  else
    return false
  end
end

function menu:draw()
  if gameState == "menu" or gameState == "optionsmenu" or gameState == "optionssettings" or gameState == "controlsmenu" or gameState == "controlssettings" or gameState == "settings" then
    -- DRAW BACKGROUND COLOR
    local top = love.graphics.getHeight()
    local bottom = 0
    for y = bottom, top do
      local gradient = (y - bottom) / (top - bottom)
      local color = {
        lightGray[1] * ((1 - gradient) + darkGray[1] * gradient) / 2,
        lightGray[2] * ((1 - gradient) + darkGray[2] * gradient) / 2,
        lightGray[3] * ((1 - gradient) + darkGray[3] * gradient) / 2
      }
      love.graphics.setColor(color)
      love.graphics.line(0, y, love.graphics.getWidth(), y)
    end
    -- END DRAW BACKGROUND COLOR
  end

  if gameState == "menu" then
    -- DRAW TITLE
    love.graphics.setFont(fonts.huge)
    local titlex = (love.graphics.getWidth() - fonts.huge:getWidth("THE REBEL'S RIVALRY")) / 2
    love.graphics.print("THE REBEL'S RIVALRY", titlex, love.graphics.getHeight() / 12)
    -- END DRAW TITLE

    -- DRAW PLAY BUTTON
    if isHovering(playButton.x, playButton.y, playButton.w, playButton.h) and not playButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", playButton.x, playButton.y, playButton.w, playButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("PLAY", playButton.x, playButton.y + playButton.h / 2 - love.graphics.getFont():getHeight() / 2, playButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", playButton.x, playButton.y, playButton.w, playButton.h, buttonRadius)
    -- END DRAW PLAY BUTTON

    -- DRAW OPTIONS BUTTON
    if isHovering(optionsButton.x, optionsButton.y, optionsButton.w, optionsButton.h) and not optionsButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", optionsButton.x, optionsButton.y, optionsButton.w, optionsButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("OPTIONS", optionsButton.x, optionsButton.y + optionsButton.h / 2 - love.graphics.getFont():getHeight() / 2, optionsButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", optionsButton.x, optionsButton.y, optionsButton.w, optionsButton.h, buttonRadius)
    -- END DRAW OPTIONS BUTTON

    -- DRAW CONTROLS BUTTON
    if isHovering(controlsButton.x, controlsButton.y, controlsButton.w, controlsButton.h) and not controlsButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", controlsButton.x, controlsButton.y, controlsButton.w, controlsButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("CONTROLS", controlsButton.x, controlsButton.y + controlsButton.h / 2 - love.graphics.getFont():getHeight() / 2, controlsButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", controlsButton.x, controlsButton.y, controlsButton.w, controlsButton.h, buttonRadius)
    -- END DRAW CONTROLS BUTTON


    -- DRAW QUIT BUTTON
    if isHovering(quitButton.x, quitButton.y, quitButton.w, quitButton.h) and not quitButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", quitButton.x, quitButton.y, quitButton.w, quitButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("QUIT", quitButton.x, quitButton.y + quitButton.h / 2 - love.graphics.getFont():getHeight() / 2, quitButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", quitButton.x, quitButton.y, quitButton.w, quitButton.h, buttonRadius)
    -- END DRAW QUIT BUTTON
  end
end

function menu:resize(width, height)
  menu:updateButtonPositions()
end

return menu