test_world = {}
local colliders = {}
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
        table.insert(colliders, v)
    end
end


function test_world:update(dt)
    px, py = player.hitbox:getLinearVelocity()
    world:update(dt)
end

function test_world:draw()
    world:draw()
    love.graphics.printf("Velocity: " .. px .. " " .. py, -50, 0, 1280, 'right')
    love.graphics.printf("X Y: " .. round(player.hitbox:getX()) .. " " .. round(player.hitbox:getY()), -50, 50, 1280, 'right')
end

function test_world:keypressed(key, scancode, isrepeats)
   
end

function test_world:mousepressed(x,y,button)
  
end