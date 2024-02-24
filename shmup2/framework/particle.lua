function create_particle(_loc, _r, _c, _lifespan)
    foo = _loc
    local particle = create_object({
        loc = _loc,
        r = _r,
        c = _c,
        type = "particle",
        vel = v_rnd(),
        lifetime = 0, -- unit is frame 
        lifespan = _lifespan + rnd(_lifespan),
        init = function(self)
            self.loc = foo
        end,
        update = function(self)
            local _ENV = self
            lifetime += 1
            r *= 0.94
            if lifetime >= lifespan then
                self:destroy()
            end
            if lifetime > lifespan * 0.8 then
                c = 5
            elseif lifetime > lifespan * 0.5 then
                c = 2
            elseif lifetime > lifespan * 0.2 then
                c = 10
            end

            loc = v_add(loc, v_mul(vel, 0.5))
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