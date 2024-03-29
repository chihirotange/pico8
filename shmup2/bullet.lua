_type_bullet = "bullet"
function create_bullet(_team, _loc, _vel, _spd, _r)
    local bullet = create_object({
        spd = _spd,
        type = _type_bullet,
        r = _r,
        tags = {"can_deal_dmg"},
        w = _r * 2,
        h = _r * 2,
        sy = 5,
        sx = 0,
        init = function(self, atts)
        end,
        update = function(self)
            local _ENV = self
            loc = v_add(loc, v_mul(vel, spd))
            
            if loc.x > 128 or loc.x < 0 or loc.y < 0 or loc.y > 128 then
                self:destroy()
            end
            -- printh(loc.y)

        end,
        on_overlap = function(self, other_obj)
            if other_obj.team ~= nil and (self.team ~= other_obj.team) then
                self:destroy()
            end
        end,
        -- detect_collision = function(self)
        --     for obj in all(all_collider_object) do
        --         if col(self, obj) and not obj.pending_destroy then
        --             self:on_overlap(obj)
        --             obj:on_overlap(self)
        --         end
        --     end
        -- end,
        draw = function(self)
            local _ENV = self
            circfill(loc.x + r, loc.y + r, r, 10)
        end
    }, true)
    
    -- respawn
    bullet.team = _team
    bullet.loc = _loc
    bullet.vel = _vel
end