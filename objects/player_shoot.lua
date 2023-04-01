local bullet_delay = 0

function player:gun()
    local img_right = love.graphics.newImage("assets/images/player_gun_right.png") -- too lazy to do math
    local img_left = love.graphics.newImage("assets/images/player_gun_left.png")
    local img
    local y
    img_right:setFilter('nearest')
    img_left:setFilter('nearest')
    if round(player_mouse_angle()) == 2 or round(player_mouse_angle()) == 3 then
        img = img_left
        y = 20
    else
        img = img_right
        y = 0
    end
    
    love.graphics.draw(img, self.x, self.y + y, player_mouse_angle(), 4, 4)
end

local function spawn_bullet()
    local y_offset
    if player_mouse_angle() > 1.5 and player_mouse_angle() < 4.5 then
        y_offset = 20
    else
        y_offset = -20 
    end
    table.insert(bullets, bullet(player.x, player.y - y_offset, "player"))
end


function player:shoot(dt)
    bullet_delay = bullet_delay - 1 * dt
    if love.mouse.isDown(1) and bullet_delay <= 0 then
        spawn_bullet()
        bullet_delay = 0.5
    end
end