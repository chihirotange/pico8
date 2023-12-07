player = entity:new({
    is_abstract = false,
    max_lives = 4,
    current_lives = 1,
    score = 0,
    on_event_received = function(_ENV, tbl)
        if tbl.event_id == event_system.on_spaceship_collides_enemy then
            current_lives -= 1
            if current_lives == 0 then
                event_system:fire_event({
                    event_id = event_system.on_player_died
                })
            end
        end
    end
})