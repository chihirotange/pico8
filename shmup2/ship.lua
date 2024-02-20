ship = create_object({
    x = 60,
    y = 110,
    sx = 0,
    sy = 0,
    spr_i = 2,
    default_bul_timer = 1, --unit is frames
    bul_timer = 0,
    update = function(self)
        local _ENV = self
        -- "drag, friction"
        sx *= 0.5
        sy *= 0.5

        if btn(0) then
            sx = -2
        end
        
        if btn(1) then
            sx = 2
        end
        
        if btn(2) then
            sy = -2
        end

        if btn(3) then
            sy = 2
        end

        if btn(4) then
            if bul_timer <= 0 then
                create_bullet(x + 4, y)
                bul_timer = default_bul_timer
            end
        end

        -- update ship location
        x += sx
        x = min(120, x)
        x = max(0, x)
        y += sy
        y = min(120, y)
        y = max(0, y)

        bul_timer -= 1        
    end,

    draw = function(self)
        local _ENV = self
        spr(spr_i, x, y)
    end
})