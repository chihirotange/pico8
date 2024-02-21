function create_enemy(_loc)
    local ene = create_object({
        loc = _loc,
        team = _team_enemy,
        on_overlap = function(self, other_obj)
            local _ENV = self
            if other_obj.team ~= nil and contains(other_obj.tags, "can_deal_dmg") then
                create_part_system(loc, 10, 8, 15)
                self:destroy()
                create_enemy(vector(rnd(120), 50))
            end
        end,
        draw = function(self)
            local _ENV = self
            rectfill(loc.x, loc.y, loc.x + w, loc.y + h, 8)
        end
    }, true)
end