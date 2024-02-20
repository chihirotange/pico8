function create_enemy(_x, _y)
    local ene = create_object({
        x = _x,
        y = _y,
        team = 2, -- 2 is enemy
        tag = "enemy",
        on_overlap = function(self, other_obj)
            if other_obj.team ~= nil and contains(other_obj.tags, "can_deal_dmg") then
                self:destroy()
            end
        end,
        draw = function(self)
            local _ENV = self
            rectfill(x, y, x + w, y + h)
        end
    })
end