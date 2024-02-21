function create_particle(_x, _y, _r, _c, _lifespan)
    local particle = create_object({
        x = _x,
        y = _y,
        r = _r,
        c = _c,
        lifetime = 0, -- unit is frame 
        lifespan = _lifespan + rnd(5),
        update = function(self)
            local _ENV = self
            lifetime += 1
            r *= 0.9
            if lifetime >= lifespan then
                self:destroy()
            end
        end,
        draw = function(self)
            _ENV = self
            circfill(x, y, r, c)
        end
    }, false)
end

function create_part_system(x, y, _r, c, ls)
    local r = _r*2
    for i = 1, flr(r/4)  do
        create_particle(x + rnd(r) - r/2, y + rnd(r) - r/2, r/2 + rnd(r/2), c, ls)
    end
end