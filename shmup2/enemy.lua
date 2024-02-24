_type_ene_basic = "basic enemy"

function create_enemy(_loc, type)
    foo = _loc
    if type == _type_ene_basic then
        create_object({
            loc = _loc,
            team = _team_enemy,
            type = _type_ene_basic,
            shoot_timer = 0, -- shoot delay in frame
            shoot_delay = 30,
            mov_spd = 1,
            mov_dir = v_rnd(),
            init = function(self)
                self.loc = foo
            end,
            update = function(self)
                local _ENV = self
                -- shoot
                -- if shoot_timer == 0 then
                --     create_bullet(team, loc, v_down, 4, 4)
                --     shoot_timer = shoot_delay
                -- end
                -- shoot_timer -= 1

                -- move
                if loc.x >= 120 or loc.x <= 0 then
                    mov_dir = vector(-mov_dir.x, mov_dir.y)
                end
                if loc.y >= 120 or loc.y <= 0 then
                    mov_dir = vector(mov_dir.x, -mov_dir.y)
                end
                loc = v_add(loc, v_mul(mov_dir, mov_spd))

                -- create_part_system(v_add(loc, vector(4,4)), 7, 8, 30)
            end,
            on_overlap = function(self, other_obj)
                local _ENV = self
                if other_obj.team ~= team
                    and contains(other_obj.tags, "can_deal_dmg") then
                    create_part_system(loc, 10, 8, 20)
                    self:destroy()
                    -- mov_dir = v_rnd()
                    -- mov_spd += 0.5
                end
            end,
            draw = function(self)
                local _ENV = self
                rectfill(loc.x, loc.y, loc.x + w, loc.y + h, 7)
            end
        }, true)
    else
        printh("no enemy type defined to spawn")
    end
end