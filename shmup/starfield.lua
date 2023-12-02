starfield = entity:new({
    sc = 7,
    speed = 0,
    update = function(_ENV)
        if y > 128 then
            y = 0
        end
        y += speed
    end,
    draw = function(_ENV)
        if (speed < 0.8) then
            sc = 5
        elseif (speed < 1.5) then
            sc = 6
        end
        pset(x, y, sc)
    end
})