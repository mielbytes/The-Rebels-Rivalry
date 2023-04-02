local stamina = 100
local is_tired = false


function player:run(dt)
    self.stamina = stamina
    if love.keyboard.isDown("lshift") and not is_tired and player.state == 2 then
        stamina = stamina - 35 * dt
        self.speed = 400
        if stamina <= 0 then
            is_tired = true
        end
    elseif not is_tired then
        self.speed = 250
    end
    if stamina <= 100 then
        stamina = stamina + 10 * dt
    end
    if is_tired then
        self.speed = 200
        if stamina >= 100 then
            is_tired = false
            self.speed = 250
        end
    end
    if stamina >= 100 then
        stamina = 100
    elseif stamina <= 0 then
        stamina = 0
    end
end


