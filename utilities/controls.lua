controls = {}

function controls:load()
  controlsbackButton = {
    w = 300,
    h = 100,
    clicked = true,
  }
  keys = {
    w = love.graphics.newImage("assets/images/wlight.png"),
    a = love.graphics.newImage("assets/images/alight.png"),
    s = love.graphics.newImage("assets/images/slight.png"),
    d = love.graphics.newImage("assets/images/dlight.png"),
    lshift = love.graphics.newImage("assets/images/shiftlight.png")
  }
  for _, value in pairs(keys) do
    value:setFilter("nearest", "nearest")
  end
  updateButtonPositions()
end

function controls:updateButtonPositions()
  local gap = 30

  keys.wWidth, keys.wHeight = keys.w:getWidth() * 6, keys.w:getHeight() * 6
  keys.aWidth, keys.aHeight = keys.a:getWidth() * 6, keys.a:getHeight() * 6
  keys.sWidth, keys.sHeight = keys.s:getWidth() * 6, keys.s:getHeight() * 6
  keys.dWidth, keys.dHeight = keys.d:getWidth() * 6, keys.d:getHeight() * 6
  keys.lshiftWidth, keys.lshiftHeight = keys.lshift:getWidth() * 6, keys.lshift:getHeight() * 6

  keys.wx = (love.graphics.getWidth() - keys.wWidth) / 3.5
  keys.wy = ((love.graphics.getHeight()) - (keys.wHeight + keys.aHeight + gap)) / 6
---@diagnostic disable-next-line: redundant-parameter
  keys.wTextY = keys.wy + (keys.wHeight - fonts.huge:getHeight("FORWARD")) / 2

  keys.ax = (love.graphics.getWidth() - keys.aWidth) / 3.5
  keys.ay = keys.wy + keys.wHeight + gap
---@diagnostic disable-next-line: redundant-parameter
  keys.aTextY = keys.ay + (keys.aHeight - fonts.huge:getHeight("FORWARD")) / 2

  keys.sx = (love.graphics.getWidth() - keys.sWidth) / 3.5
  keys.sy = keys.ay + keys.aHeight + gap
---@diagnostic disable-next-line: redundant-parameter
  keys.sTextY = keys.sy + (keys.sHeight - fonts.huge:getHeight("RIGHT")) / 2

  keys.dx = (love.graphics.getWidth() - keys.dWidth) / 3.5
  keys.dy = keys.sy + keys.sHeight + gap
---@diagnostic disable-next-line: redundant-parameter
  keys.dTextY = keys.dy + (keys.dHeight - fonts.huge:getHeight("DOWN")) / 2

  keys.lshiftx = (love.graphics.getWidth() - keys.lshiftWidth) / 3.2
  keys.lshifty = keys.dy + keys.dHeight + gap
---@diagnostic disable-next-line: redundant-parameter
  keys.lshiftTextY = keys.lshifty + (keys.lshiftHeight - fonts.huge:getHeight("RUN")) / 2

  controlsbackButton.x = 20
  controlsbackButton.y = love.graphics.getHeight() - 110
end

function controls:update(dt)
  
end

function draw_controls()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(keys.w, keys.wx, keys.wy, nil, 6, 6)
  fonts.huge:setFilter("nearest", "nearest")
  love.graphics.setFont(fonts.huge)
  love.graphics.print("FORWARD", keys.wx + keys.wWidth + 30, keys.wTextY)

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(keys.a, keys.ax, keys.ay, nil, 6, 6)
  fonts.huge:setFilter("nearest", "nearest")
  love.graphics.setFont(fonts.huge)
  love.graphics.print("LEFT", keys.ax + keys.aWidth + 30, keys.aTextY)

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(keys.s, keys.sx, keys.sy, nil, 6, 6)
  fonts.huge:setFilter("nearest", "nearest")
  love.graphics.setFont(fonts.huge)
  love.graphics.print("RIGHT", keys.sx + keys.sWidth + 30, keys.sTextY)

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(keys.d, keys.dx, keys.dy, nil, 6, 6)
  fonts.huge:setFilter("nearest", "nearest")
  love.graphics.setFont(fonts.huge)
  love.graphics.print("DOWN", keys.dx + keys.dWidth + 30, keys.dTextY)

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(keys.lshift, keys.lshiftx, keys.lshifty, nil, 6, 6)
  fonts.huge:setFilter("nearest", "nearest")
  love.graphics.setFont(fonts.huge)
  love.graphics.print("RUN", keys.lshiftx + keys.lshiftWidth + 30, keys.lshiftTextY)
end

function controls:draw()
  if gameState == "controlsmenu" or gameState == "controlssettings" then
    draw_controls()

    -- DRAW CONTROLSBACK BUTTON
    if isHovering(controlsbackButton.x, controlsbackButton.y, controlsbackButton.w, controlsbackButton.h) and not controlsbackButton.clicked then
      love.graphics.setColor(63 / 255, 63 / 255, 63 / 255)
    else
      love.graphics.setColor(90 / 255, 90 / 255, 90 / 255)
    end
    love.graphics.rectangle("fill", controlsbackButton.x, controlsbackButton.y, controlsbackButton.w, controlsbackButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("BACK", controlsbackButton.x, controlsbackButton.y + controlsbackButton.h / 2 - love.graphics.getFont():getHeight() / 2, controlsbackButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", controlsbackButton.x, controlsbackButton.y, controlsbackButton.w, controlsbackButton.h, buttonRadius)
    -- END DRAW CONTROLSBACK BUTTON
  end
end

function controls:keypressed(key, scancode, isrepeat)
  
end

function controls:mousepressed(x, y, button)
  if button == 1 and x >= controlsbackButton.x and x <= controlsbackButton.x + controlsbackButton.w and y >= controlsbackButton.y and y <= controlsbackButton.y + controlsbackButton.h and not controlsbackButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    playButton.clicked = false
    optionsButton.clicked = false
    controlsButton.clicked = false
    optionsbackButton.clicked = true
    quitButton.clicked = false
    controlsbackButton.clicked = true
    gameState = "menu"
  end
end

function controls:resize(width, height)
  controls:updateButtonPositions()
end

return controls