function create_particle(_loc, _r, _c, _lifespan)
    local particle = create_object({
        loc = _loc,
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
            circfill(loc.x, loc.y, r, c)
        end
    }, false)
end

function create_part_system(_loc, _r, c, ls)
    local r = _r*2
    for i = 1, flr(r/4)  do
        create_particle(v_add(_loc, v_mul(v_rnd(), r/2)), r/2 + rnd(r/2), c, ls)
    end
end