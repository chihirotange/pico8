_ene_basic = 1

function create_enemy(_loc, type)
    if type == _ene_basic then
        create_object({
            loc = _loc,
            team = _team_enemy,
            shoot_timer = 0, -- shoot delay in frame
            shoot_delay = 120,
            mov_dir = v_zero,
            update = function(self)
                local _ENV = self
                -- shoot
                if shoot_timer == 0 then
                    create_bullet(team, loc, v_down, 4, 4)
                    shoot_timer = shoot_delay
                end
                shoot_timer -= 1

                -- move
                if (loc.x >= 120) then
                    mov_dir = v_left
                else
                    mov_dir = v_right
                end
                loc = v_add(loc, mov_dir)
                
                printh(loc.x)
                -- printh(mov_dir.x)
            end,
            on_overlap = function(self, other_obj)
                local _ENV = self
                if other_obj.team ~= team
                    and contains(other_obj.tags, "can_deal_dmg") then
                    create_part_system(loc, 10, 8, 20)
                end
            end,
            draw = function(self)
                local _ENV = self
                rectfill(loc.x, loc.y, loc.x + w, loc.y + h, 8)
            end
        }, true)
    else
        printh("no enemy type defined to spawn")
    end
end