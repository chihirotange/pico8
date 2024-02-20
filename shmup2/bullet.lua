function create_bullet(_x, _y, _r)
    local bullet = create_object({
        x = _x - _r,
        y = _y - _r,
        r = _r,
        tag = "bullet",
        w = _r * 2,
        h = _r * 2,
        sy = 3,
        sx = 0,
        update = function(self)
            local _ENV = self
            y -= sy

            if(y <= 0) then
                destroy(self)
            end

            --bullet collisions
            for obj in all(all_objects) do
                if obj.tag != "bullet" and col(self, obj) then
                    destroy(self)
                end
            end
        end,
        draw = function(self)
            local _ENV = self
            circfill(x + r, y + r, r)
        end
    })
end