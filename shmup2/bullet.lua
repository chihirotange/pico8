all_bullets = {}

function create_bullet(x, y)
    local bullet = create_object({
        x = x,
        y = y,
        r = 4,
        sy = -6,
        sx = 0,
        update = function(self)
            local _ENV = self
            y += sy

            if(y <= 0) then
                destroy(self)
            end
        end,
        draw = function(self)
            local _ENV = self
            circfill(x , y, r)
        end
    })
end