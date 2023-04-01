bullet = Class{}

function bullet:init(x,y, dir) --we will use hitboxes for bullets
    self.x = x
    self.y = y
    self.dir = dir
    self.speed = 500
    self.timer = 5
    self.hitbox = world:newCircleCollider(self.x, self.y, 16)
    self.hitbox:setType("dynamic")
    self.hitbox:setFixedRotation(true)
    self.hitbox:setCollisionClass("Bullet")
    self.img = love.graphics.newImage("assets/images/bullet.png")
    self.hitbox:setLinearVelocity(self.dir * self.speed, self.dir * self.speed)
    self.hitbox:setRestitution(1)
    self.img:setFilter("nearest")
end

function bullet:update(dt)
    self.x, self.y = self.hitbox:getX(), self.hitbox:getY()
    self.timer = self.timer - 1 * dt
    if self.hitbox:enter("Player") then
        player:take_damage(100)
    end
end

function bullet:render()
    if self.timer > 0 then
        love.graphics.draw(self.img, self.x - 16, self.y - 16, nil, 4, 4)
    end
end

function bullet:destroy()
    self.hitbox:destroy()
end