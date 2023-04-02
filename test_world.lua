test_world = {}
local px, py
world:addCollisionClass("Player")
world:addCollisionClass("Enemy", {ignores = {"Player", "Enemy"}})
world:addCollisionClass("Wall")
world:addCollisionClass("Door")
function test_world:load()
    world:setQueryDebugDrawing(true) 
    GenerateWalls()
    GenerateDoors()
    SpawnEnemies()
    player:load()

   
end





function test_world:update(dt)
    world:update(dt)

    if player.hitbox:enter("Door") then
        for b, c in ipairs(colliders) do
            if c then
                c:setActive(false)
            end
        end
        for k, p in ipairs(enemies) do
            p.health = 0
            --p.hitbox:destroy()
            --table.remove(enemies, k)
        end
        if current_room == 1 then
            player.hitbox:setX(475)
            player.hitbox:setY(1500)
        elseif current_room == 2 then
            player.hitbox:setX(1750)
            player.hitbox:setY(500)
        end
        current_room = current_room + 1
        gameMap = sti("assets/tile/" .. current_room .. ".lua")   
        GenerateDoors()
        GenerateWalls()
        SpawnEnemies()

    end
    px, py = player.hitbox:getLinearVelocity()
    for i, v in ipairs(enemies) do
        v:update(dt)
        if v.health <= 0 then
            v.hitbox:destroy()
            table.remove(enemies, i)
        end
    end
    for a, d in pairs(bullets) do
        d:update(dt)
        if d.isDead then
            table.remove(bullets, a)
        end
    end

end

function test_world:draw()
    cam:attach()
        if gameMap.layers["Layer1"] then
            gameMap:drawLayer(gameMap.layers["Layer1"])
        end
        if gameMap.layers["Layer2"] then
            gameMap:drawLayer(gameMap.layers["Layer2"])
        end
        if gameMap.layers["Layer3"] then
            gameMap:drawLayer(gameMap.layers["Layer3"])
        end
        for i, v in pairs(enemies) do
            v:render()
        end
        for i, v in pairs(bullets) do
            v:render()
        end
        player:draw()
        world:draw()
        self:draw_colliders()
    cam:detach()

    love.graphics.setFont(fonts.small)
    love.graphics.printf("Velocity: " .. px .. " " .. py, -30, 5, 1280, 'right')
    love.graphics.printf("X Y: " .. round(player.hitbox:getX()) .. " " .. round(player.hitbox:getY()), -50, 30, 1280, 'right')
    set_color(1,0,0)
        love.graphics.printf("Health: " .. round(player.health), 5, 5, 1280, 'left')
    set_color(0,1,0)
        love.graphics.printf("Stamina: " .. round(player.stamina), 5, 30, 1280, 'left')
        love.graphics.printf("Speed: " .. round(player.speed), 5, 55, 1280, 'left')
    set_color(1,1,1)
    for i, v in pairs(enemies) do
        love.graphics.printf("Enemy Health: " .. v.health .. "/" .. v.max_health, 0, 64 * i, 1280, 'left')
    end
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