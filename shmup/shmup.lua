function _init()
   --starfield
    for i = 1, 100 do
        starfield:new({
            is_abstract = false,
            x = rnd(127),
            y = rnd(127),
            speed = rnd(1.5) + 0.5
        })
    end

    -- enemies
    for i = 1,5 do
        enemy_green:new({
            is_abstract = false,
            x = rnd(120),
            y = 1
        })
    end

    --test
    add(event_system.listeners, sound)
    add(event_system.listeners, player)
    add(event_system.listeners, gamestate)
end

function _update()
    gamestate:update()
end

function _draw()
    gamestate:draw()
end