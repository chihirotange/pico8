ship = create_object({
    loc = vector(60, 110),
    vel = v_zero,
    w = 8,
    h = 8,
    tag = "ship",
    team = _team_player,
    sx = 0,
    sy = 0,
    spr_i = 2,
    bul_spd = 6,
    default_bul_timer = 2, --unit is frames
    bul_timer = 0,
    update = function(self)
        local _ENV = self
        -- "drag, friction"
        sx = 0
        sy = 0

        if btn(0) then
            sx = -1
        end
        
        if btn(1) then
            sx = 1
        end
        
        if btn(2) then
            sy = -1
        end

        if btn(3) then
            sy = 1
        end

        if btn(4) then
            if bul_timer <= 0 then
                create_bullet(team, loc, v_up, bul_spd, 4)
                bul_timer = default_bul_timer
                sfx(0)
            end
        end

        -- update ship location
        vel = v_mul(v_norm(vector(sx, sy)), 2)
        loc = v_add(loc, vel)

        bul_timer -= 1        
    end,

    draw = function(self)
        local _ENV = self
        spr(spr_i, loc.x, loc.y)
    end
}, true)