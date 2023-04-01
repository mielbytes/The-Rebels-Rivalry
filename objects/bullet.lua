bullet = Class{}

function bullet:init(x,y, type) --we will use hitboxes for bullets
    self.x = x
    self.y = y
    self.dir = player_mouse_angle()
    self.speed = 1000
    self.type = type
    self.timer = 5
    self.isDead = false
    self.img = love.graphics.newImage("assets/images/bullet.png")
    self.img:setFilter("nearest")
end

function bullet:update(dt)
    self.timer = self.timer - 1 * dt
    self:movement(dt)
    self:detect()
    if self.timer <= 0 then
        self.isDead = true
    end
    
end

function bullet:render()
    if self.timer > 0 then
        love.graphics.draw(self.img, self.x - 16, self.y - 16, nil, 4, 4)
    end
end

function bullet:movement(dt)
    self.x = self.x + (math.cos(self.dir) * self.speed * dt )
    self.y = self.y + (math.sin(self.dir) * self.speed * dt)
end

function bullet:detect()
    local query
    if self.type == "enemy" then
        query = world:queryCircleArea(self.x, self.y, 16, {"Player"})
        for i, v in pairs(query) do
            local player = v:getObject()
            player:take_damage(1)
            self.isDead = true
        end
    elseif self.type == "player" then
        query = world:queryCircleArea(self.x, self.y, 16, {"Enemy"})
        for i, v in pairs(query) do
            local enemy = v:getObject()
            enemy:take_damage(1)
            self.isDead = true
        end
    end
end