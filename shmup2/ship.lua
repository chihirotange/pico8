ship = create_object({
    x = 60,
    y = 110,
    sx = 0,
    sy = 0,
    spr_i = 2,

    update = function(self)
        local _ENV = self
        sx = 0
        sy = 0
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
            printh("shoot")
        end

        -- update ship location
        x += sx
        y += sy
    end,

    draw = function(self)
        local _ENV = self
        spr(spr_i, x, y)
    end
})