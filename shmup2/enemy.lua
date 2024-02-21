function create_enemy(_x, _y)
    local ene = create_object({
        x = _x,
        y = _y,
        team = _team_enemy,
        on_overlap = function(self, other_obj)
            local _ENV = self
            if other_obj.team ~= nil and contains(other_obj.tags, "can_deal_dmg") then
                create_part_system(x, y, 10, 8, 15)
                self:destroy()
                create_enemy(rnd(120), 50)
            end
        end,
        draw = function(self)
            local _ENV = self
            rectfill(x, y, x + w, y + h, 8)
        end
    }, true)
end