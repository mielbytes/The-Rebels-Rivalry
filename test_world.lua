test_world = {}
local walls = {
    world:newRectangleCollider(0, 0, 64, 720),
    world:newRectangleCollider(0,0, 1280, 64),
    world:newRectangleCollider(1216,0, 64, 720),
    world:newRectangleCollider(0,656, 1280, 64)
}
local px, py
function test_world:load()
    world:addCollisionClass("Player")
    world:addCollisionClass("Enemy", {ignores = {"Player"}})
    world:addCollisionClass("Wall")
    for i, v in pairs(walls) do
        v:setType("static")
        v:setFixedRotation(true)
        v:setCollisionClass("Wall")
        table.insert(colliders, v)
    end
    world:setQueryDebugDrawing(true) 
    table.insert(enemies, enemy(100,100))
end





function test_world:update(dt)
    px, py = player.hitbox:getLinearVelocity()
    world:update(dt)
    for i, v in pairs(enemies) do
        v:update(dt)
        if v.health <= 0 then
            v.hitbox:destroy()
            table.remove(enemies, i)
        end
    end
    for i, v in pairs(bullets) do
        v:update(dt)
        if v.isDead then
            table.remove(bullets, i)
        end
    end
end

function test_world:draw()
    love.graphics.clear(0.17,0.17,0.17)
    world:draw()
    love.graphics.setFont(fonts.small)
    love.graphics.printf("Velocity: " .. px .. " " .. py, -30, 5, 1280, 'right')
    love.graphics.printf("X Y: " .. round(player.hitbox:getX()) .. " " .. round(player.hitbox:getY()), -50, 30, 1280, 'right')
    set_color(1,0,0)
        love.graphics.printf("Health: " .. round(player.health), 5, 5, 1280, 'left')
    set_color(0,1,0)
        love.graphics.printf("Stamina: " .. round(player.stamina), 5, 30, 1280, 'left')
        love.graphics.printf("Speed: " .. round(player.speed), 5, 55, 1280, 'left')
    set_color(1,1,1)
    player:draw()
    for i, v in pairs(enemies) do
        v:render()
        love.graphics.printf("Enemy Health: " .. v.health .. "/" .. v.max_health, 0, 64 * i, 1280, 'left')
    end
    for i, v in pairs(bullets) do
        v:render()
    end
    self:draw_colliders()
    set_color(1,1,1)

end

function test_world:keypressed(key, scancode, isrepeats)
  
end

function test_world:mousepressed(x,y,button)
  
end

function test_world:draw_colliders()
    set_color(1,1,0)
        love.graphics.rectangle("line", player.x - 32, player.y - 64, player.width, player.height)
    for i, v in pairs(enemies) do
        set_color(1,0,0)    
            love.graphics.rectangle("line", v.x - 32, v.y - 64, v.width, v.height)
        set_color(1,1,1)
    end
end