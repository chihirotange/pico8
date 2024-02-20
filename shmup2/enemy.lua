function create_enemy(_x, _y)
    local ene = create_object({
        x = _x,
        y = _y,
        draw = function(self)
            local _ENV = self
            rectfill(x, y, x + w, y + h)
        end
    })
end