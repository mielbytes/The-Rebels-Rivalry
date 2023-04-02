settings = {}

function settings:load()
  optionssettingsButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  optionssettingsbackButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  controlssettingsButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  controlssettingsbackButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  menuButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  quitsettingsButton = {
    w = 300,
    h = 100,
    clicked = true
  }

  settings:updateButtonPositions()
end

function settings:updateButtonPositions()
  local gap = 20
  
  optionssettingsbackButton.x = 20
  optionssettingsbackButton.y = love.graphics.getHeight() - 110

  controlssettingsbackButton.x = 20
  controlssettingsbackButton.y = love.graphics.getHeight() - 110

  settingstotalButtonHeight = 3 * 100 + 2 * gap
  settingsbuttonStartY = (love.graphics.getHeight() - settingstotalButtonHeight) / 2.35
  optionssettingsButton.x = (love.graphics.getWidth() - 300) / 2
  optionssettingsButton.y = settingsbuttonStartY

  controlssettingsButton.x = (love.graphics.getWidth() - 300) / 2
  controlssettingsButton.y = settingsbuttonStartY + 100 + gap

  menuButton.x = (love.graphics.getWidth() - 300) / 2
  menuButton.y = settingsbuttonStartY + 2 *(100 + gap)

  quitsettingsButton.x = (love.graphics.getWidth() - 300) / 2
  quitsettingsButton.y = settingsbuttonStartY + 3 *(100 + gap)
end


function settings:update(dt)
  
end

function settings:mousepressed(x, y, button)
  if button == 1 and x >= optionssettingsButton.x and x <= optionssettingsButton.x + optionssettingsButton.w and y >= optionssettingsButton.y and y <= optionssettingsButton.y + optionssettingsButton.h and not optionssettingsButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    gameState = "optionssettings"
    playButton.clicked = true
    optionsButton.clicked = true
    controlsButton.clicked = true
    quitButton.clicked = true
    optionsbackButton.clicked = true
    controlsbackButton.clicked = true
    optionssettingsButton.clicked = true
    controlssettingsButton.clicked = true
    quitsettingsButton.clicked = true
    menuButton.clicked = true
    controlssettingsbackButton.clicked = true
    optionssettingsbackButton.clicked = false
  end

  if button == 1 and x >= controlssettingsButton.x and x <= controlssettingsButton.x + controlssettingsButton.w and y >= controlssettingsButton.y and y <= controlssettingsButton.y + controlssettingsButton.h and not controlssettingsButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    gameState = "controlssettings"
    playButton.clicked = true
    optionsButton.clicked = true
    controlsButton.clicked = true
    quitButton.clicked = true
    optionsbackButton.clicked = true
    controlsbackButton.clicked = true
    optionssettingsButton.clicked = true
    controlssettingsButton.clicked = true
    quitsettingsButton.clicked = true
    menuButton.clicked = true
    controlssettingsbackButton.clicked = false
    optionssettingsbackButton.clicked = true
  end

  if button == 1 and x >= controlssettingsbackButton.x and x <= controlssettingsbackButton.x + controlssettingsbackButton.w and y >= controlssettingsbackButton.y and y <= controlssettingsbackButton.y + controlssettingsbackButton.h and not controlssettingsbackButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    gameState = "settings"
    optionssettingsButton.clicked = false
    controlssettingsButton.clicked = false
    quitsettingsButton.clicked = false
    menuButton.clicked = false
    optionssettingsbackButton.clicked = true
    controlssettingsbackButton.clicked = true
  end

  if button == 1 and x >= optionssettingsbackButton.x and x <= optionssettingsbackButton.x + optionssettingsbackButton.w and y >= optionssettingsbackButton.y and y <= optionssettingsbackButton.y + optionssettingsbackButton.h and not optionssettingsbackButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    gameState = "settings"
    optionssettingsButton.clicked = false
    controlssettingsButton.clicked = false
    quitsettingsButton.clicked = false
    menuButton.clicked = false
    optionssettingsbackButton.clicked = true
    controlssettingsbackButton.clicked = true
  end

  if button == 1 and x >= menuButton.x and x <= menuButton.x + menuButton.w and y >= menuButton.y and y <= menuButton.y + menuButton.h and not menuButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    love.load()
  end

  if button == 1 and x >= quitsettingsButton.x and x <= quitsettingsButton.x + quitsettingsButton.w and y >= quitsettingsButton.y and y <= quitsettingsButton.y + quitsettingsButton.h and not quitsettingsButton.clicked then
    love.audio.stop(click)
    love.audio.play(click)
    love.event.quit()
  end

  if button == 1 and x >= fullscreenButton.x and x <= fullscreenButton.x + fullscreenButton.w and y >= fullscreenButton.y and y <= fullscreenButton.y + fullscreenButton.h and gameState == "optionssettings" then
    love.audio.stop(click)
    love.audio.play(click)
    toggleFullscreen()
  end
end

function settings:keypressed(key, scancode, isrepeat)
  
end

function settings:draw()
  if gameState == "settings" then
    love.graphics.setColor(0.3, 0.3, 0.3)
    love.graphics.rectangle("fill", 700, 220, love.graphics.getWidth() - (2 * 700), love.graphics.getHeight() - (2 * 220))
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", 700, 220, love.graphics.getWidth() - (2 * 700), love.graphics.getHeight() - (2 * 220))

    -- DRAW OPTIONS BUTTON
    if isHovering(optionssettingsButton.x, optionssettingsButton.y, optionssettingsButton.w, optionssettingsButton.h) and not optionssettingsButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", optionssettingsButton.x, optionssettingsButton.y, optionssettingsButton.w, optionssettingsButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("OPTIONS", optionssettingsButton.x, optionssettingsButton.y + optionssettingsButton.h / 2 - love.graphics.getFont():getHeight() / 2, optionssettingsButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", optionssettingsButton.x, optionssettingsButton.y, optionssettingsButton.w, optionssettingsButton.h, buttonRadius)
    -- END DRAW OPTIONS BUTTON

    -- DRAW MENU BUTTON
    if isHovering(menuButton.x, menuButton.y, menuButton.w, menuButton.h) and not menuButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", menuButton.x, menuButton.y, menuButton.w, menuButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("MENU", menuButton.x, menuButton.y + menuButton.h / 2 - love.graphics.getFont():getHeight() / 2, menuButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", menuButton.x, menuButton.y, menuButton.w, menuButton.h, buttonRadius)
    -- END DRAW MENU BUTTON

    -- DRAW CONTROLS BUTTON
    if isHovering(controlssettingsButton.x, controlssettingsButton.y, controlssettingsButton.w, controlssettingsButton.h) and not controlssettingsButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", controlssettingsButton.x, controlssettingsButton.y, controlssettingsButton.w, controlssettingsButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("CONTROLS", controlssettingsButton.x, controlssettingsButton.y + controlssettingsButton.h / 2 - love.graphics.getFont():getHeight() / 2, controlssettingsButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", controlssettingsButton.x, controlssettingsButton.y, controlssettingsButton.w, controlssettingsButton.h, buttonRadius)
    -- END DRAW CONTROLS BUTTON


    -- DRAW QUIT BUTTON
    if isHovering(quitsettingsButton.x, quitsettingsButton.y, quitsettingsButton.w, quitsettingsButton.h) and not quitsettingsButton.clicked then
      love.graphics.setColor(63/255, 63/255, 63/255)
    else
      love.graphics.setColor(90/255, 90/255, 90/255)
    end
    love.graphics.rectangle("fill", quitsettingsButton.x, quitsettingsButton.y, quitsettingsButton.w, quitsettingsButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("QUIT", quitsettingsButton.x, quitsettingsButton.y + quitsettingsButton.h / 2 - love.graphics.getFont():getHeight() / 2, quitsettingsButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", quitsettingsButton.x, quitsettingsButton.y, quitsettingsButton.w, quitsettingsButton.h, buttonRadius)
    -- END DRAW QUIT BUTTON
  end

  if gameState == "optionssettings" then
    draw_options()
    -- DRAW OPTIONSBACK BUTTON
    if isHovering(optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h) and not optionsbackButton.clicked then
      love.graphics.setColor(63 / 255, 63 / 255, 63 / 255)
    else
      love.graphics.setColor(90 / 255, 90 / 255, 90 / 255)
    end
    love.graphics.rectangle("fill", optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("BACK", optionsbackButton.x, optionsbackButton.y + optionsbackButton.h / 2 - love.graphics.getFont():getHeight() / 2, optionsbackButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", optionsbackButton.x, optionsbackButton.y, optionsbackButton.w, optionsbackButton.h, buttonRadius)
    -- END DRAW OPTIONSBACK BUTTON
  end

  if gameState == "controlssettings" then
    draw_controls()

    -- DRAW CONTROLSBACK BUTTON
    if isHovering(controlssettingsbackButton.x, controlssettingsbackButton.y, controlssettingsbackButton.w, controlssettingsbackButton.h) and not controlssettingsbackButton.clicked then
      love.graphics.setColor(63 / 255, 63 / 255, 63 / 255)
    else
      love.graphics.setColor(90 / 255, 90 / 255, 90 / 255)
    end
    love.graphics.rectangle("fill", controlssettingsbackButton.x, controlssettingsbackButton.y, controlssettingsbackButton.w, controlssettingsbackButton.h, buttonRadius)
    love.graphics.setFont(fonts.big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("BACK", controlssettingsbackButton.x, controlssettingsbackButton.y + controlssettingsbackButton.h / 2 - love.graphics.getFont():getHeight() / 2, controlssettingsbackButton.w, "center")
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", controlssettingsbackButton.x, controlssettingsbackButton.y, controlssettingsbackButton.w, controlssettingsbackButton.h, buttonRadius)
    -- END DRAW CONTROLSBACK BUTTON
  end
end

function settings:resize(width, height)
  settings:updateButtonPositions()
end

return settings