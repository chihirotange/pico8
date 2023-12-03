player = entity:new({
    x = 10,
    y = 10,
    is_abstract = false,
    draw_order = 100,
    max_lives = 4,
    current_lives = 3,
    draw = function(_ENV)
        for i = 0,max_lives - 1 do
            if current_lives > i then
                spr(12, x + i*9,y)
            else
                spr(11, x + i *9,y)
            end
        end
    end
})