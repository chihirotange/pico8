function _init()
   --starfield
    for i = 1, 50 do
        starfield:new({
            is_abstract = false,
            x = rnd(127),
            y = rnd(127),
            speed = rnd(1.5) + 0.5
        })
    end


    -- enemies
    for i = 1,10 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(120),
            y = rnd(60)
        })
    end

    --test
    add(all_listeners, sound)
    add(all_listeners, player)
end

function _update()
    gamestate:update()
end

function _draw()
    gamestate:draw()
end