function create_bullet(_team, _x, _y, _r)
    local bullet = create_object({
        x = _x - _r,
        y = _y - _r,
        r = _r,
        team = _team,
        tags = {"can_deal_dmg"},
        w = _r * 2,
        h = _r * 2,
        sy = 5,
        sx = 0,
        update = function(self)
            local _ENV = self
            y -= sy

            if(y <= -8) then
                destroy(self)
            end
        end,
        on_overlap = function(self, other_obj)
            printh("bullet")
            if other_obj.team ~= nil and (self.team ~= other_obj.team) then
                self:destroy()
            end
        end,
        detect_collision = function(self)
            for obj in all(all_collider_object) do
                if col(self, obj) and not obj.pending_destroy then
                    self:on_overlap(obj)
                    obj:on_overlap(self)
                end
            end
        end,
        draw = function(self)
            local _ENV = self
            circfill(x + r, y + r, r, 10)
        end
    }, true)
end