function create_bullet(_owner, _x, _y, _r)
    local bullet = create_object({
        x = _x - _r,
        y = _y - _r,
        r = _r,
        owner = _owner,
        tag = "bullet",
        w = _r * 2,
        h = _r * 2,
        sy = 4,
        sx = 0,
        update = function(self)
            local _ENV = self
            y -= sy

            if(y <= 0) then
                destroy(self)
            end
        end,
        on_overlap = function(self, other_obj)
            if other_obj.team ~= nil and (self.owner.team ~= other_obj.team) then
                self:destroy()
            end
        end,
        draw = function(self)
            local _ENV = self
            circfill(x + r, y + r, r)
        end
    })
end